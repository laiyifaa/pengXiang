package io.renren.modules.edu.service.impl;


import com.alibaba.excel.util.StringUtils;
import io.renren.modules.edu.dao.*;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.entity.constant.CURRENT_STATUS;
import io.renren.modules.edu.entity.constant.RESIDENCE_TYPE;
import io.renren.modules.edu.entity.constant.SCHOOL_ROLL_STATUS;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;
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

    @Override
    public List<StuBaseInfoEntity> queryExport(Query query, StuBaseInfoEntity record, Long deptId) {
        List<StuBaseInfoEntity> exportList = baseMapper.selectStuBaseInfo(null == query ? null :Query.getPage(query), null, record, null, deptId,1);
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

/*    @Override
    public void bindClass(StuBaseInfoEntity stuBaseInfo) {
        if(stuBaseInfo.getEntranceStatus() == 100){
            stuBaseInfo.setEntranceStatus(200);
        }
        this.baseMapper.update(stuBaseInfo,new QueryWrapper<StuBaseInfoEntity>().eq("stu_id",stuBaseInfo.getStuId()));
    }*/

   /* @Override
    public void updateClass(StuBaseInfoEntity stuBaseInfo) {
        StuBaseInfoEntity baseInfoEntity = this.baseMapper.selectById(stuBaseInfo.getStuId());
        if(baseInfoEntity != null) {
            if(baseInfoEntity.getEntranceStatus() == 100){
                baseInfoEntity.setEntranceStatus(200);
            }
            baseInfoEntity.setClassId(stuBaseInfo.getClassId());
            this.baseMapper.updateById(baseInfoEntity);
        }
//        this.baseMapper.update(stuBaseInfo,new QueryWrapper<StuBaseInfoEntity>().eq("stu_id",stuBaseInfo.getStuId()));
    }

    @Override
    public void unbundlingClass(List<Long> stuIds) {
        for (Long stuId : stuIds) {
            this.baseMapper.unbundlingClass(stuId);
        }
    }
*/
    @Override
    public PageUtils selectStuBaseInfo(IPage<StuBaseInfoEntity> page, StuBaseInfoEntity key, Long deptId) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        IPage<StuBaseInfoEntity> iPage = page.setRecords(baseMapper.selectStuBaseInfo(page, null,key, user.getAcademyId(), deptId,null));
        return new PageUtils(iPage);
    }

    @Override
    public StuBaseInfoEntity getBaseInfoById(Long stuId)throws Exception {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<StuBaseInfoEntity> list = baseMapper.selectStuBaseInfo(null, stuId, null, user.getAcademyId(), null,null);
        if(null != list && list.size() != 1)
            throw new Exception();
        return list.get(0);
    }

    @Override
    public StuDetailVo detailById(Long stuId) {
        StuDetailVo detailVo = new StuDetailVo();
        List<StuBaseInfoEntity> baseInfoList = this.baseMapper.selectStuBaseInfo(null, stuId, null, null, null,null);
        if(null == baseInfoList || baseInfoList.isEmpty())
            return detailVo;
        StuBaseInfoEntity baseInfo = baseInfoList.get(0);
        detailVo.setBaseInfo(baseInfo);
        /**
         * 学杂费
         */
        List<FeeSchoolSundryEntity> feeList = feeSchoolSundryDao.selectList(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id", stuId).eq("is_deleted", 0));
        detailVo.setFeeList(feeList);
        List<StuEmployVistEntity> visitList = stuEmployVistDao.selectList(new QueryWrapper<StuEmployVistEntity>().eq("stu_id",baseInfo.getStuId()).eq("is_deleted",0));
        detailVo.setVisitList(visitList);
        List<StuEmployEntity> employInfoList  = stuEmployDao.selectList(new QueryWrapper<StuEmployEntity>().eq("stu_id", baseInfo.getStuId()).eq("is_deleted",0));
        if(null != employInfoList && employInfoList.size()>0){
            detailVo.setEmployInfo(employInfoList.get(0));
        }else {
            detailVo.setEmployInfo(new StuEmployEntity());
        }
        List<StuPracticeEntity> practiceList = stuPracticeDao.selectList(new QueryWrapper<StuPracticeEntity>().eq("stu_id", baseInfo.getStuId()).eq("is_deleted", 0));
        detailVo.setPracticeList(practiceList);
        return detailVo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<StuBaseInfoEntity> cachedDataList) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        //拿全部的dept
        List<DeptdescriptionDto> deptDescList = sysDeptDao.listDesc(null);
        Map<String, DeptdescriptionDto> deptDescMap = deptDescList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        //来自excel的身份证列表
        List<String> cacheIdNumberList = new ArrayList<>(cachedDataList.size());
        for(StuBaseInfoEntity entity : cachedDataList){
            cacheIdNumberList.add(entity.getIdNumber());
        }
        //查询数据库 是否有这些 身份证(关键词)
        List<StuKeyWordDto> oldStudentList = stuBaseInfoDao.listAllKey(cacheIdNumberList, 1);
        Set<String> oldIdNumberSet = oldStudentList.stream().map(StuKeyWordDto::getIdNumber).collect(Collectors.toSet());
        //新身份证则为 要add  老身份证则为update
        List<StuBaseInfoEntity> updateStudentList = new LinkedList<>();
        List<StuBaseInfoEntity> addStudentList = new LinkedList<>();
        for(StuBaseInfoEntity entity : cachedDataList){
            setExcelStuBaseInfo(entity,deptDescMap);
            if(oldIdNumberSet.contains(entity.getIdNumber())){
                updateStudentList.add(entity);
            }else {
                addStudentList.add(entity);
            }
        }
        if(null != updateStudentList && !updateStudentList.isEmpty()){
            stuBaseInfoDao.updateBatch(updateStudentList);
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
        if(baseInfo.getStuId() == null && stuBaseInfoDao.selectStuBaseInfo(null,null,record,null,null,null).size()>0){
            throw new Exception("该名学生证件号系统中已存在");
        }
    }
}
