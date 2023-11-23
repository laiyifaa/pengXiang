package io.renren.modules.edu.service.impl;


import com.alibaba.excel.util.StringUtils;
import io.renren.modules.edu.dao.*;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.entity.constant.CURRENT_STATUS;
import io.renren.modules.edu.entity.constant.RESIDENCE_TYPE;
import io.renren.modules.edu.entity.constant.SCHOOL_ROLL_STATUS;
import io.renren.modules.edu.service.EduCertificateService;

import io.renren.modules.edu.utils.ExcelUtils;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;

import io.renren.modules.edu.service.StuBaseInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Service("stuBaseInfoService")
public class StuBaseInfoServiceImpl extends ServiceImpl<StuBaseInfoDao, StuBaseInfoEntity> implements StuBaseInfoService {

    @Resource
    private StuBaseInfoDao stuBaseInfoDao;
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private StuEmployVistDao stuEmployVistDao;
    @Resource
    private StuEmployDao stuEmployDao;
    @Resource
    private StuPracticeDao stuPracticeDao;
    @Resource
    private FeeSchoolSundryDao feeSchoolSundryDao;

    @Resource
    private FeeArrearageDao feeArrearageDao;

    @Resource
    private EduCertificateService eduCertificateService;

    @Resource
    private FeeReturnDao feeReturnDao;

    @Resource
    private SysUserDao sysUserDao;

    @Resource
    private StuTempDao stuTempDao;

    @Override
    public List<StuBaseInfoEntity> queryExport(Query query, StuBaseInfoEntity record, Long deptId) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> deptIdList = sysUserDao.queryDeptIdList(user.getUserId());
        List<StuBaseInfoEntity> exportList = baseMapper.selectStuBaseInfo(
                null == query ? null :Query.getPage(query),
                null,
                record,user.getAcademyId() , deptId,1,
                null != deptIdList && deptIdList.size() > 0 ? deptIdList : null,null);
        return exportList;
    }

    @Override
    public PageUtils selectStuClassPage(IPage<StuClassVo> page, StuClassVo stuClassVo, String key) {
        IPage<StuClassVo> iPage = page.setRecords(baseMapper.selectStuClassPage(page, stuClassVo, key));
        return new PageUtils(iPage);
    }

    @Override
    public StuBaseInfoEntity getBySchoolNumber(String schoolNumber) {
        StuBaseInfoEntity stuBaseInfoEntity = this.baseMapper.selectOne(new QueryWrapper<StuBaseInfoEntity>().eq("school_number", schoolNumber));
        return stuBaseInfoEntity;
    }

    @Override
    public PageUtils selectStuBaseInfo(IPage<StuBaseInfoEntity> page, StuBaseInfoEntity key, Long deptId,List<Long>stuIdList) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> deptIdList = sysUserDao.queryDeptIdList(user.getUserId());
        IPage<StuBaseInfoEntity> iPage = page.setRecords(baseMapper.selectStuBaseInfo(page, null,key, user.getAcademyId(), deptId,null,deptIdList,stuIdList));
        return new PageUtils(iPage);
    }

    @Override
    public StuBaseInfoEntity getBaseInfoById(Long stuId)throws Exception {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<StuBaseInfoEntity> list = baseMapper.selectStuBaseInfo(null, stuId, null, user.getAcademyId(), null,null,null,null);
        if(null != list && list.size() != 1)
            throw new Exception();
        return list.get(0);
    }

    @Override
    public StuDetailVo detailById(Long stuId) {
        StuDetailVo detailVo = new StuDetailVo();
        List<StuBaseInfoEntity> baseInfoList = this.baseMapper.selectStuBaseInfo(null, stuId, null, null, null,null,null,null);
        if(null == baseInfoList || baseInfoList.isEmpty())
            return detailVo;
        StuBaseInfoEntity baseInfo = baseInfoList.get(0);
        detailVo.setBaseInfo(baseInfo);
        /**
         * 学杂费
         */
        TreeMap<String,List<FeeSchoolSundryEntity>> treeMap=new TreeMap<>();

        List<FeeSchoolSundryEntity> feeList = feeSchoolSundryDao.selectList(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id", stuId).eq("is_deleted", 0));
        TreeSet<String> set=new TreeSet<>();
        for(FeeSchoolSundryEntity f:feeList){
           set.add(f.getPaySchoolYear());
        }
        for (String paySchoolYear : set) {
            List<FeeSchoolSundryEntity> List = feeSchoolSundryDao.selectList(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id", stuId).eq("is_deleted", 0).eq("pay_school_year", paySchoolYear).orderByAsc("pay_school_date"));
            treeMap.put(paySchoolYear, List);
        }
        detailVo.setFeeList(treeMap);
        /**
         * 回访
         */
        List<StuEmployVistEntity> visitList = stuEmployVistDao.selectList(new QueryWrapper<StuEmployVistEntity>().eq("id_number",baseInfo.getIdNumber()).eq("is_deleted",0));
        detailVo.setVisitList(visitList);
        /**
         * 就业
         */
        List<StuEmployEntity> employInfoList  = stuEmployDao.selectList(new QueryWrapper<StuEmployEntity>().eq("id_number", baseInfo.getIdNumber()).eq("is_deleted",0));
        if(null != employInfoList && employInfoList.size()>0){
            detailVo.setEmployInfo(employInfoList.get(0));
        }else {
            detailVo.setEmployInfo(new StuEmployEntity());
        }
        /**
         * 实习
         */
        List<StuPracticeEntity> practiceList = stuPracticeDao.selectList(new QueryWrapper<StuPracticeEntity>().eq("id_number", baseInfo.getIdNumber()).eq("is_deleted", 0));
        detailVo.setPracticeList(practiceList);
        /**
         * 考证
         */
        CertificateDetailVo certificateDetailVo = new CertificateDetailVo();
        certificateDetailVo.setBaseInfo(null);
        eduCertificateService.setCertificateList(stuId,certificateDetailVo);
        detailVo.setCertificateDetail(certificateDetailVo);
        /**
         * 欠费
         */
        List<FeeArrearageEntity> feeArrearageList = feeArrearageDao.getOneQmoneyListDto(stuId);
        detailVo.setFeeArrearageList(feeArrearageList);
        /**
         * 退费
         */
        List<FeeReturnEntity> feeReturnList = feeReturnDao.selectList(new QueryWrapper<FeeReturnEntity>().eq("stu_id",stuId).eq("is_deleted", 0));
        detailVo.setFeeReturnList(feeReturnList);
        /**
         * 招生
         */
        StuTempEntity tempEntity = stuTempDao.selectOne(new QueryWrapper<StuTempEntity>().eq("id_number", baseInfo.getIdNumber()).eq("is_deleted", 0));
        detailVo.setTempInfo(tempEntity);
        return detailVo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<StuBaseInfoEntity> cachedDataList) throws RuntimeException {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        //拿全部的dept
        List<DeptdescriptionDto> deptDescList = sysDeptDao.listDesc(null,null);
        Map<String, DeptdescriptionDto> deptDescMap = deptDescList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        //来自excel的身份证列表
        Set<String> cacheIdNumberSet = new LinkedHashSet<>(cachedDataList.size());
        List<Integer> repeatStuIdList = new LinkedList<>();
        for(int i = 0;i<cachedDataList.size();++i){
            StuBaseInfoEntity entity = cachedDataList.get(i);
            if(cacheIdNumberSet.contains(entity.getIdNumber())){
                repeatStuIdList.add(i + 2);
            }
            cacheIdNumberSet.add(entity.getIdNumber());
        }
        if(repeatStuIdList.size() > 0){
            throw new RuntimeException(getRepeatError(repeatStuIdList));
        }
        List<String> cacheIdNumberList = new ArrayList<>(cacheIdNumberSet);

        //2023-09-12 要求进行先招生后学管
        List<StuKeyWordDto> tempStudentList = stuTempDao.listAllKey(cacheIdNumberList, 1);
        Set<String> tempStudentIdSet = tempStudentList.stream().map(StuKeyWordDto::getIdNumber).collect(Collectors.toSet());
        List<Integer> errorStuList = new ArrayList<>(cachedDataList.size() / 4);
        for(int i = 0; i < cachedDataList.size();++i){
            StuBaseInfoEntity entity = cachedDataList.get(i);
            if(!tempStudentIdSet.contains(entity.getIdNumber())){
                errorStuList.add(i + 2);
            }
        }
        if(errorStuList.size() > 0){
            throw new RuntimeException(getCheckTempError(errorStuList));
        }
        //查询数据库 是否有这些 身份证(关键词)
        List<StuKeyWordDto> oldStudentList = stuBaseInfoDao.listAllKey(cacheIdNumberList, 1);
        Set<String> oldIdNumberSet = oldStudentList.stream().map(StuKeyWordDto::getIdNumber).collect(Collectors.toSet());
        //新身份证则为 要add  老身份证则为update
        List<StuBaseInfoEntity> updateStudentList = new LinkedList<>();
        List<StuBaseInfoEntity> addStudentList = new LinkedList<>();
        errorStuList = new ArrayList<>(cachedDataList.size() / 4);
          for(int i = 0;i<cachedDataList.size();++i){
              StuBaseInfoEntity entity = cachedDataList.get(i);
             Boolean aBoolean = setExcelStuBaseInfo(entity,deptDescMap);
             if(!aBoolean){
                 errorStuList.add(i + 2);
                 continue;
             }
              if(oldIdNumberSet.contains(entity.getIdNumber())){
                entity.setIsDeleted(false);
                updateStudentList.add(entity);
            }else {
                 addStudentList.add(entity);
            }
         }
        if(errorStuList.size() > 0){
            throw new RuntimeException(getIdNumberError(errorStuList));
        }
        if(null != updateStudentList && !updateStudentList.isEmpty()){
            stuBaseInfoDao.updateBatch(updateStudentList);
            stuTempDao.batchUpdateByStudent(updateStudentList);
        }
        if(null != addStudentList && !addStudentList.isEmpty()){
            stuBaseInfoDao.insertBatch(addStudentList);
        }

    }

    private Boolean setExcelStuBaseInfo(StuBaseInfoEntity entity,  Map<String, DeptdescriptionDto> map){
        entity.setResidenceType(RESIDENCE_TYPE.getValue(entity.getResidenceTypeName()));
        entity.setSchoolRollStatus(SCHOOL_ROLL_STATUS.getValue(entity.getSchoolRollStatusName()));
        entity.setCurrentStatus(CURRENT_STATUS.getValue(entity.getCurrentStatusName()));
        String academyName = entity.getAcademyName();
        String majorName = entity.getMajorName();
        String className = entity.getClassName();
        String gradeName = entity.getGradeName();
        //拼接
        String desc = academyName + gradeName  + majorName + className ;
         DeptdescriptionDto descDto = map.get(desc);
        if(null == descDto)
            return false;
        entity.setAcademyId(descDto.getAcademyId());
        entity.setClassId(descDto.getClassId());
        entity.setMajorId(descDto.getMajorId());
        entity.setDeptId(descDto.getDeptId());
        entity.setGradeId(descDto.getGradeId());
        return true;
    }

    @Override
    public void deleteByIds(Long[] ids) {
        List<Long> idList = Arrays.asList(ids);
        this.baseMapper.deleteByIds(idList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveBaseInfo(StuBaseInfoEntity temp) throws Exception {
        Long id = temp.getStuId();
        check(temp);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        temp.setUpdateTime(new Date());
        temp.setUpdateBy(user.getUserId());
       /*
        List<DeptdescriptionDto> deptDescList = sysDeptDao.listDesc(null);
        Map<String, DeptdescriptionDto> deptDescMap = deptDescList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        Boolean aBoolean = setExcelStuBaseInfo(temp, deptDescMap);
        if(!aBoolean)
            throw new Exception("院校、专业、年级填写有误");
        */
        if(null == id || id <= 0){
            temp.setCreateBy(user.getUserId());
            temp.setCreateTime(new Date());
            List<StuBaseInfoEntity> list = new LinkedList<>();
            list.add(temp);
            this.baseMapper.insertBatch(list);
        }else {
            List<StuBaseInfoEntity> list = new LinkedList<>();
            list.add(temp);
            stuTempDao.batchUpdateByStudent(list);
            this.baseMapper.updateById(temp);
        }
    }
    private void check(StuBaseInfoEntity baseInfo) throws Exception{
        if(null == baseInfo.getSchoolingLength()){
            throw new Exception("学制不能为空");
        }
        if(null == baseInfo.getAcademyId() && StringUtils.isEmpty(baseInfo.getAcademyName()) ){
            throw new Exception("院校不能为空");
        }
        if(null == baseInfo.getMajorId() && StringUtils.isEmpty(baseInfo.getMajorName())){
            throw new Exception("专业不能为空");
        }
        if(null == baseInfo.getGradeId() && StringUtils.isEmpty(baseInfo.getGradeName())){
            throw new Exception("年级不能为空");
        }
        if(StringUtils.isEmpty(baseInfo.getStuName())){
            throw new Exception("姓名不能为空");
        }
        if(StringUtils.isEmpty(baseInfo.getIdNumber())){
            throw new Exception("证件号不能为空");
        }
        StuBaseInfoEntity record = new StuBaseInfoEntity();
        record.setIdNumber(baseInfo.getIdNumber());
        if(baseInfo.getStuId() == null && stuBaseInfoDao.selectStuBaseInfo(null,null,record,null,null,null,null,null).size()>0){
            throw new Exception("该名学生证件号系统中已存在");
        }
    }

    private String getIdNumberError(List<Integer> errorStuList) {
        StringBuilder ans = ExcelUtils.getPreError(errorStuList);
        ans.append("行学生院校、专业、年级填写有误");
        return ans.toString();
    }

    private String getRepeatError(List<Integer> repeatStuIdList) {
        StringBuilder ans = ExcelUtils.getPreError(repeatStuIdList);
        ans.append("行学生身份证与之前重复");
        return ans.toString();
    }
    private String getCheckTempError(List<Integer> list){
        StringBuilder ans = ExcelUtils.getPreError(list);
        ans.append("行学生尚未进行招生录入或与招生登记的身份证号码存在出入");
        return ans.toString();
    }
}
