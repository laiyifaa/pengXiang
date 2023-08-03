package io.renren.modules.edu.service.impl;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.vo.FeeSchoolSundryVo;
import io.renren.modules.edu.vo.FeeSundryExportVo;
import io.renren.modules.edu.vo.SearchConditionVo;
//import io.renren.modules.edu.vo.StuBaseInfoVo;
//import io.renren.modules.edu.vo.pageVo;
import io.renren.modules.edu.vo.StuTempVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.FeeSchoolSundryDao;
import io.renren.modules.edu.service.FeeSchoolSundryService;
import org.springframework.web.client.HttpClientErrorException;

import javax.annotation.Resource;


@Service("feeSchoolSundryService")
public class FeeSchoolSundryServiceImpl extends ServiceImpl<FeeSchoolSundryDao, FeeSchoolSundryEntity> implements FeeSchoolSundryService {

    @Autowired
    private AcademyService academyService;
    @Autowired
    private FeeSchoolSundryService feeSchoolSundryService;
    @Autowired
    private FeeSchoolSundryDao feeSchoolSundryDao;
    @Autowired
    private StuBaseInfoService stuBaseInfoService;

    @Autowired
    RedisUtils redis;
    @Resource
    private StuBaseInfoDao stuBaseInfoDao;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FeeSchoolSundryEntity> page = this.page(
                new Query<FeeSchoolSundryEntity>().getPage(params),
                new QueryWrapper<FeeSchoolSundryEntity>()
        );
        List<FeeSchoolSundryEntity> records = page.getRecords();
        List<FeeSchoolSundryVo> vos = new ArrayList<>();
        for (FeeSchoolSundryEntity record : records) {
            FeeSchoolSundryVo feeSchoolSundryVo = new FeeSchoolSundryVo();
            BeanUtils.copyProperties(record,feeSchoolSundryVo);
            AcademyEntity academy = academyService.getById(record.getAcademyId());
            StuBaseInfoEntity stuBaseInfo = stuBaseInfoService.getById(record.getStuId());
            feeSchoolSundryVo.setStuName(stuBaseInfo.getStuName());
            vos.add(feeSchoolSundryVo);
        }
        IPage<FeeSchoolSundryVo> voIPage = new Page<>();
        BeanUtils.copyProperties(page,voIPage);
        voIPage.setRecords(vos);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        redis.set("feeList"+user.getUserId(),JSON.toJSON(vos).toString());

        return new PageUtils(voIPage);
    }

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
                Integer feeYear = dto.getPaySchoolYear();

                //与当前学年差距过大，建议修改年份
                if(feeYear<year-5&&feeYear>year+5)return -3;

                //查询是不是存在当前年份的记录
                QueryWrapper<FeeSchoolSundryEntity> feeWrapper = new QueryWrapper<>();
                feeWrapper.eq("pay_school_year", feeYear);
                feeWrapper.eq("stu_id",students.get(0).getStuId());
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
    public PageUtils queryPageInConditions(SearchConditionVo searchConditionVo) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("feeList"+user.getUserId());
        List<FeeSchoolSundryVo> collect = JSON.parseArray(jsonStr, FeeSchoolSundryVo.class);
        Map params = new HashMap();
        params.put("limit",searchConditionVo.getLimit());
        params.put("page",searchConditionVo.getPage());
        IPage<FeeSchoolSundryVo> page = this.page(
                new Query<FeeSchoolSundryVo>().getPage(params)
        );
        String yearValue = "";
        QueryWrapper<StuBaseInfoEntity> queryWrapper = new QueryWrapper();
        for (io.renren.modules.edu.vo.pageVo pageVo : searchConditionVo.getSearchConditions()){
            if (pageVo.getOption().equals("year")){
                yearValue = pageVo.getValue();
                continue;
            }
            queryWrapper.like(pageVo.getOption(),pageVo.getValue());
        }
        LambdaQueryWrapper<FeeSchoolSundryEntity> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(FeeSchoolSundryEntity::getPaySchoolYear,yearValue);
        List<FeeSchoolSundryEntity> list = feeSchoolSundryDao.selectList(lambdaQueryWrapper);
        List<StuBaseInfoEntity> records = stuBaseInfoService.getBaseMapper().selectList(queryWrapper);

        List stuIdList = new ArrayList();
        for (StuBaseInfoEntity record : records) {

            stuIdList.add(record.getStuId());
        }
        List stuIdListInYear = new ArrayList();
        for (FeeSchoolSundryEntity record : list) {

            stuIdListInYear.add(record.getId());
        }
        collect = collect.stream().filter(item -> stuIdList.contains(item.getStuId())).collect(Collectors.toList());
        if (stuIdListInYear.size() != 0){
            collect = collect.stream().filter(item -> stuIdListInYear.contains(item.getId())).collect(Collectors.toList());
        }else if (yearValue == ""){
            page.setRecords(collect);
            return new PageUtils(page);
        }else {
            collect = null;
        }
        page.setRecords(collect);
        return new PageUtils(page);
    }

    @Override
    public Map<String, Object> getStuBaseInfoAndFeeSundry(Long id) {

        HashMap<String, Object> res = new HashMap<>();

        //获取feeSchoolSundry
        FeeSchoolSundryEntity sundryEntity = this.baseMapper.selectById(id);
        if(sundryEntity==null)throw new RuntimeException("缴费信息记录为空，检查记录id是否正确");

        //获取学生base信息
        List<StuBaseInfoEntity> vos = stuBaseInfoDao.selectStuBaseInfo(null, sundryEntity.getStuId(), null, null, null,null);
        if(vos==null||vos.size()==0)throw new RuntimeException("学生信息记录为空，检查记录中学生相关信息是否正确，联系管理员");

        LambdaQueryWrapper<FeeSchoolSundryEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(FeeSchoolSundryEntity::getStuId,sundryEntity.getStuId());
        List<FeeSchoolSundryEntity> feeSchoolSundryEntities = baseMapper.selectList(queryWrapper);

            if (sundryEntity.getIsArrearage() == null)vos.get(0).setIfQMoney("");
            else {
                if (sundryEntity.getIsArrearage()==1){
                    vos.get(0).setIfQMoney("已欠费");
                }
                if (sundryEntity.getIsArrearage()==0){
                    vos.get(0).setIfQMoney("未欠费");
                }
            }

        res.put("stuInfo",vos.get(0));
        res.put("feeInfo",feeSchoolSundryEntities);

        return res;


    }

    @Override
    public void importByList(List<FeeSundryExportVo> cachedDataList, AnalysisContext context) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        //来自excel的身份证列表
        List<String> cacheIdNumberList = new ArrayList<>(cachedDataList.size());
        List<Long> cacheStuIdList = new ArrayList<>(cachedDataList.size());
        for(FeeSundryExportVo entity : cachedDataList){
            LambdaQueryWrapper<StuBaseInfoEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();

            lambdaQueryWrapper.eq(StuBaseInfoEntity::getIdNumber,entity.getIdNumber());
//            lambdaQueryWrapper.eq(StuBaseInfoEntity::getSchoolNumber,entity.getSchoolNumber());
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getStuName,entity.getStuName());
            StuBaseInfoEntity one = stuBaseInfoService.getOne(lambdaQueryWrapper);
            if (one != null){
                cacheIdNumberList.add(entity.getIdNumber());
                entity.setStuId(one.getStuId());
                continue;
            }
            throw new EmptyDataException("学生不存在，请检查学生信息，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        //查询数据库 是否有这些 身份证(关键词)
        List<Long> idList = baseMapper.getIdList();


        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        for(FeeSundryExportVo entity : cachedDataList){
/*            StuTempEntity temp = new StuTempEntity();
            BeanUtils.copyProperties(entity,temp);*/
            if(cacheIdNumberList.contains(entity.getIdNumber())){
                LambdaQueryWrapper<FeeSchoolSundryEntity> queryWrapper = new LambdaQueryWrapper<>();
                if (idList.contains(entity.getStuId())){
                    queryWrapper.eq(FeeSchoolSundryEntity::getStuId,entity.getStuId());
                    FeeSchoolSundryEntity feeSchoolSundryEntity = feeSchoolSundryDao.selectOne(queryWrapper);
                    entity.setId(feeSchoolSundryEntity.getId());
                    FeeSchoolSundryEntity feeSchoolSundryEntity1 = new FeeSchoolSundryEntity();
                    BeanUtils.copyProperties(entity,feeSchoolSundryEntity1);
                    feeSchoolSundryDao.updateById(feeSchoolSundryEntity1);
                }else {
                    LambdaQueryWrapper<StuBaseInfoEntity> queryWrapper2 = new LambdaQueryWrapper<>();
                    queryWrapper2.eq(StuBaseInfoEntity::getStuId,entity.getStuId());
                    StuBaseInfoEntity feeSchoolSundryEntity = stuBaseInfoDao.selectOne(queryWrapper2);
                    FeeSchoolSundryEntity feeSchoolSundryEntity1 = new FeeSchoolSundryEntity();
                    BeanUtils.copyProperties(entity,feeSchoolSundryEntity1);
                    feeSchoolSundryService.save(feeSchoolSundryEntity1);
                }
            }

        }

    }

    @Override
    public PageUtils selectStuFeeSundryPage(IPage<FeeSchoolSundryVo> page, String year, Long deptId, StuKeyWordDto key) {

        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        Long academyId = user.getAcademyId();
        if (year.equals("") || year == null){
            List<FeeSchoolSundryVo> records = baseMapper.selectFeeSundryVo(page, academyId, null, deptId, key);
            page.setRecords(records);
            for (FeeSchoolSundryVo record : records) {
                if (record.getIsArrearage() == null)continue;
                if (record.getIsArrearage()==1){
                    record.setIfQMoney("已欠费");
                }
                if (record.getIsArrearage()==0){
                    record.setIfQMoney("未欠费");
                }
            }
            SysUserEntity user3 = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

            redis.set("feeList"+user3.getUserId(),JSON.toJSON(records).toString());
            PageUtils pageUtils = new PageUtils(page);
            return pageUtils;
        }
        List<FeeSchoolSundryVo> records = baseMapper.selectFeeSundryVo(page, academyId, Integer.parseInt(year), deptId, key);

        for (FeeSchoolSundryVo record : records) {
            if (record.getIsArrearage()==1){
                record.setIfQMoney("已欠费");
            }
            if (record.getIsArrearage()==0){
                record.setIfQMoney("未欠费");
            }
        }

        page.setRecords(records);
        PageUtils pageUtils = new PageUtils(page);
        SysUserEntity user2 = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        redis.set("feeList"+user2.getUserId(),JSON.toJSON(records).toString());
        return pageUtils;

    }

    private int getSchoolYearInfoByDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);

        return year;
    }

}
