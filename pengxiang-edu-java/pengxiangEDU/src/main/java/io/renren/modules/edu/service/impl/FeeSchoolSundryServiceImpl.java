package io.renren.modules.edu.service.impl;

import com.alibaba.excel.context.AnalysisContext;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dto.*;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.entity.constant.RESIDENCE_TYPE;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.utils.ExcelUtils;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.utils.StringUtils;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;


import io.renren.modules.edu.dao.FeeSchoolSundryDao;
import io.renren.modules.edu.service.FeeSchoolSundryService;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;


@Service("feeSchoolSundryService")
public class FeeSchoolSundryServiceImpl extends ServiceImpl<FeeSchoolSundryDao, FeeSchoolSundryEntity> implements FeeSchoolSundryService {

    public static   String schoolYearPattern = "^\\d+-\\d+|\\d+$";
    @Autowired
    private FeeSchoolSundryService feeSchoolSundryService;

    @Resource
    private FeeSchoolSundryDao feeSchoolSundryDao;

    @Resource
    private SysUserDao sysUserDao;

    @Autowired
    private StuBaseInfoService stuBaseInfoService;

    @Autowired
    RedisUtils redis;
    @Resource
    private StuBaseInfoDao stuBaseInfoDao;

    @Override
    public Integer saveOrUpdateFeeSchoolSundry(FeeSchoolSundryDto dto) {

        if(dto.getId()!=null){
            FeeSchoolSundryEntity entity = new FeeSchoolSundryEntity();
            BeanUtils.copyProperties(dto,entity);
            this.updateById(entity);
            return 1;
        }
        //add
        else {
            //根据学号和姓名还有年份查询是否存在该条记录
            QueryWrapper<StuBaseInfoEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("stu_name",dto.getStuName());
            wrapper.eq("id_number",dto.getIdNumber());
            List<StuBaseInfoEntity> students = stuBaseInfoService.list(wrapper);
            if(students.size()==1){

                int year = getSchoolYearInfoByDate(new Date());
                String feeYearStr = dto.getPaySchoolYear();
                int feeYear=Integer.parseInt(feeYearStr.split("-")[0]);
                //与当前学年差距过大，建议修改年份
                if(feeYear<year-5&&feeYear>year+5)return -3;

                //查询是不是存在当前年份的记录
                QueryWrapper<FeeSchoolSundryEntity> feeWrapper = new QueryWrapper<>();
                feeWrapper.eq("pay_school_year", feeYearStr);
                feeWrapper.eq("stu_id",students.get(0).getStuId());
                feeWrapper.eq(StringUtils.isNotEmpty(dto.getPaySchoolDate().toString()),"pay_school_date",dto.getPaySchoolDate());
                feeWrapper.eq("is_deleted",0);
                FeeSchoolSundryEntity entity = baseMapper.selectOne(feeWrapper);
                if(entity==null){
                    //不存在，可以插入记录
                    FeeSchoolSundryEntity save = new FeeSchoolSundryEntity();
                    BeanUtils.copyProperties(dto,save);
                    save.setStuId(students.get(0).getStuId());
                    save.setAcademyId(students.get(0).getAcademyId());
                    save.setDeptId(students.get(0).getDeptId());
                    save.setIsDeleted(true);
                    this.baseMapper.insert(save);
                    return 1;
                }else {
                    //已经存在，报错
                    return -1;
                }
            }else {
                //存在多条或不存在学生记录，建议检查学生信息录入是否有误
                return -2;
            }
        }

    }



    @Override
    public Map<String, Object> getSingleStuBaseInfoAndFeeSundry(Long stuId, String payYear, Date payDate) {

        HashMap<String, Object> res = new HashMap<>();

        //获取feeSchoolSundry
        FeeSchoolSundryEntity sundryEntity = this.baseMapper.selectById(stuId);
        //获取学生base信息
        List<StuBaseInfoEntity> vos = stuBaseInfoDao.selectStuBaseInfo(null, stuId, null, null, null,null,null,null);
        if(vos==null||vos.size()==0)throw new RuntimeException("学生信息记录为空，检查记录中学生相关信息是否正确，联系管理员");
        if (null == sundryEntity || sundryEntity.getIsArrearage() == null) vos.get(0).setIfQMoney("");
        else {
            if (sundryEntity.getIsArrearage()==1){
                vos.get(0).setIfQMoney("已欠费");
            }
            if (sundryEntity.getIsArrearage()==0){
                vos.get(0).setIfQMoney("未欠费");
            }
        }
        res.put("stuInfo",vos.get(0));
        res.put("feeInfo",getFeeByStuId(stuId));
        return res;

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<FeeSundryImportVo> cachedDataList, AnalysisContext context) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        //来自excel的身份证列表
        List<String> cacheIdNumberList = new ArrayList<>(cachedDataList.size());
        List<Integer> errorList = new ArrayList<>(cachedDataList.size()/4);
        for(int i = 0 ;i < cachedDataList.size();++i){
            FeeSundryImportVo entity  = cachedDataList.get(i);
            LambdaQueryWrapper<StuBaseInfoEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getIdNumber,entity.getIdNumber());
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getStuName,entity.getStuName());
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getIsDeleted,0);
            StuBaseInfoEntity one = stuBaseInfoService.getOne(lambdaQueryWrapper);
            if (one != null){
                cacheIdNumberList.add(entity.getIdNumber());
                entity.setStuId(one.getStuId());
                continue;
            }
            errorList.add((i + 2));
        }
        if(errorList.size() > 0){
            throw new EmptyDataException(getNoExist(errorList));
        }
        /*Set<String> cacheIdNumberSet = cacheIdNumberList.stream().collect(Collectors.toSet());*/
        //查询数据库 是否有这些 身份证(关键词)
      /*  List<Long> idList = baseMapper.getIdList();*/
        errorList.clear();
        for(int i = 0 ;i < cachedDataList.size();++i){
            FeeSundryImportVo entity  = cachedDataList.get(i);
            if(!checkExcelFeeSundry(entity)){
                throw new EmptyDataException("第" + (i + 2) + "行学年学期格式有误,参考1或者1-1");
            }
            /*LambdaQueryWrapper<FeeSchoolSundryEntity> queryWrapper = new LambdaQueryWrapper<>();*/
            LambdaQueryWrapper<FeeSchoolSundryEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(FeeSchoolSundryEntity::getStuId,entity.getStuId());
            lambdaQueryWrapper.eq(FeeSchoolSundryEntity::getPaySchoolYear,entity.getPaySchoolYear());
            LambdaQueryWrapper<StuBaseInfoEntity> queryWrapper2 = new LambdaQueryWrapper<>();
            queryWrapper2.eq(StuBaseInfoEntity::getStuId,entity.getStuId());
            /* StuBaseInfoEntity feeSchoolSundryEntity = stuBaseInfoDao.selectOne(queryWrapper2);*/
            FeeSchoolSundryEntity feeSchoolSundryEntity1 = new FeeSchoolSundryEntity();
            BeanUtils.copyProperties(entity,feeSchoolSundryEntity1);
            feeSchoolSundryEntity1.setIsArrearage(0);
            feeSchoolSundryService.save(feeSchoolSundryEntity1);
            /* if(cacheIdNumberSet.contains(entity.getIdNumber())){

                 if (idList.contains(entity.getStuId()) ){
                    FeeSchoolSundryEntity byId = feeSchoolSundryService.getOne(lambdaQueryWrapper);
                    if (byId!=null){
                        queryWrapper.eq(FeeSchoolSundryEntity::getStuId,entity.getStuId());
                        queryWrapper.eq(FeeSchoolSundryEntity::getPaySchoolYear,entity.getPaySchoolYear());
                        FeeSchoolSundryEntity feeSchoolSundryEntity = feeSchoolSundryDao.selectOne(queryWrapper);
                        entity.setId(feeSchoolSundryEntity.getId());
                        FeeSchoolSundryEntity feeSchoolSundryEntity1 = new FeeSchoolSundryEntity();
                        BeanUtils.copyProperties(entity,feeSchoolSundryEntity1);
                        feeSchoolSundryDao.updateById(feeSchoolSundryEntity1);
                    }else {

                    }
                }
            }*/
        }
    }

    private boolean checkExcelFeeSundry(FeeSundryImportVo entity) {
        if(null == entity)
            return false;
        if(StringUtils.isNotEmpty(entity.getPaySchoolYear())){
            return entity.getPaySchoolYear().matches(schoolYearPattern);
        }
        return false;
    }

    @Override
    public TreeMap<String, List<FeeSchoolSundryEntity>> getFeeByStuId(Long stuId) {
        TreeMap<String,List<FeeSchoolSundryEntity>> treeMap=new TreeMap<>();
        List<FeeSchoolSundryEntity> feeList = feeSchoolSundryDao.selectList(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id", stuId).eq("is_deleted", 0));
        TreeSet<String> set=new TreeSet<>();
        for(FeeSchoolSundryEntity f:feeList){
            if(f.getPaySchoolYear() != null){
                set.add(f.getPaySchoolYear());
            }
        }
        for (String paySchoolYear : set) {
            List<FeeSchoolSundryEntity> list = feeSchoolSundryDao.selectList(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id", stuId).eq("is_deleted", 0).eq("pay_school_year", paySchoolYear).orderByAsc("pay_school_date"));
            FeeSchoolSundryEntity sumFee = sumFeeBySchoolYear(list,paySchoolYear,stuId);
            if(null != sumFee){
                list.add(sumFee);
            }
            treeMap.put(paySchoolYear, list);
        }
        return treeMap;
    }

    private FeeSchoolSundryEntity sumFeeBySchoolYear(List<FeeSchoolSundryEntity> list,String paySchoolYear,Long stuId) {
        FeeSchoolSundryEntity sum = new FeeSchoolSundryEntity();
        if(null == list || list.size() <= 1)
            return null;
        sum.setPaySchoolYear(paySchoolYear);
        sum.setStuId(stuId);
        int flag = 0;
        for(FeeSchoolSundryEntity entity : list){
            sum.setBedFee(add(sum.getBedFee(),entity.getBedFee()));
            sum.setBodyExamFee(add(sum.getBodyExamFee(),entity.getBodyExamFee()));
            sum.setTrainFee(add(sum.getTrainFee(),entity.getTrainFee()));
            sum.setClothesFee(add(sum.getClothesFee(),entity.getClothesFee()));
            sum.setBookFee(add(sum.getBookFee(), entity.getBookFee()));
            sum.setHotelFee(add(sum.getHotelFee(), entity.getHotelFee()));
            sum.setInsuranceFee(add(sum.getInsuranceFee(), entity.getInsuranceFee()));
            sum.setPublicFee(add(sum.getPublicFee(), entity.getPublicFee()));
            sum.setCertificateFee(add(sum.getCertificateFee(), entity.getCertificateFee()));
            sum.setDefenseEduFee(add(sum.getDefenseEduFee(), entity.getDefenseEduFee()));
            sum.setDerateMoney(add(sum.getDerateMoney(), entity.getDerateMoney()));
            sum.setFactReturnFeeNum(add(sum.getFactReturnFeeNum(), entity.getFactReturnFeeNum()));
            if(flag == 0){
                sum.setNeedReturnFeeNum(add(sum.getNeedReturnFeeNum(), entity.getNeedReturnFeeNum()));
                sum.setPayBedFee(add(sum.getPayBedFee(),entity.getPayBedFee()));
                sum.setPayBodyExamFee(add(sum.getPayBodyExamFee(),entity.getPayBodyExamFee()));
                sum.setPayTrainFee(add(sum.getPayTrainFee(),entity.getPayTrainFee()));
                sum.setPayClothesFee(add(sum.getPayClothesFee(),entity.getPayClothesFee()));
                sum.setPayBookFee(add(sum.getPayBookFee(),entity.getPayBookFee()));
                sum.setPayHotelFee(add(sum.getPayHotelFee(),entity.getPayHotelFee()));
                sum.setPayInsuranceFee(add(sum.getPayInsuranceFee(),entity.getPayInsuranceFee()));
                sum.setPayPublicFee(add(sum.getPayPublicFee(),entity.getPayPublicFee()));
                sum.setPayCertificateFee(add(sum.getPayCertificateFee(),entity.getCertificateFee()));
                sum.setPayDefenseEduFee(add(sum.getPayDefenseEduFee(),entity.getDefenseEduFee()));
                ++flag;
            }
        }
        return sum;
    }
    private BigDecimal add(BigDecimal a, BigDecimal b) {
        if (a == null) {
            return b != null ? b : BigDecimal.ZERO;
        } else if (b == null) {
            return a;
        } else {
            return a.add(b);
        }
    }
    @Override
    public List<FeeSundryExportVo> queryExport(Query query, Integer year, Long deptId, StuKeyWordDto key, String isArrearage, String derateType) {
        List<FeeSchoolSundryVo> list = getVoList(null == query ? null : Query.getPage(query), year, deptId, key, isArrearage, derateType,1);
        List<FeeSundryExportVo> exportList = new ArrayList<>();
        for (FeeSchoolSundryVo dto : list) {
            FeeSundryExportVo exportVo = new FeeSundryExportVo();
            BeanUtils.copyProperties(dto, exportVo);
            if (dto.getIsArrearage() != null){
                exportVo.setIsArrearage(dto.getIsArrearage() == 1? "是" : "否");
            }
            if (dto.getPaySchoolDate() != null)exportVo.setPaySchoolDate(dto.getPaySchoolDate());
            if (dto.getReturnFeeTime() != null)exportVo.setReturnFeeTime(dto.getReturnFeeTime().toString());
            exportList.add(exportVo);
        }
        return exportList;
    }

    @Override
    public PageUtils selectStuFeeSundryPage(IPage<FeeSchoolSundryVo> page, Integer year, Long deptId, StuKeyWordDto key
            ,String isArrearage,String derateType) {

        IPage<FeeSchoolSundryVo> iPage = page.setRecords(
                getVoList(page,year,deptId,key,isArrearage,derateType,0));
        return new PageUtils(iPage);
    }
    private List<FeeSchoolSundryVo> getVoList(IPage<FeeSchoolSundryVo> page, Integer year, Long deptId, StuKeyWordDto key
            ,String isArrearage,String derateType,Integer isExcel){
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> deptIdList = sysUserDao.queryDeptIdList(user.getUserId());
        Integer arrearage = null;
        if(isArrearage != null){
            if("是".equals(isArrearage))
                arrearage = 1;
            if("否".equals(isArrearage))
                arrearage = 0;
        }
        List<FeeSchoolSundryVo> list = baseMapper.selectFeeSundryVo(page, user.getAcademyId(),
                deptIdList, year, deptId, key, arrearage, derateType,
                RESIDENCE_TYPE.getValue(key.getResidenceTypeName()),1 == isExcel?isExcel:null);
        Map<Long, FeeSchoolSundryVo> map = new LinkedHashMap<>();
        for (FeeSchoolSundryVo item : list) {
            map.putIfAbsent(item.getStuId(), item);
        }
        List<FeeSchoolSundryVo> ansList = new ArrayList<>(map.values());
        return ansList;
    }

    private int getSchoolYearInfoByDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);

        return year;
    }


    private String getNoExist(List<Integer> list) {
        StringBuilder ans = ExcelUtils.getPreError(list);
        ans.append("行学生不存在，请检查学生信息");
        return ans.toString();
    }

}
