package io.renren.modules.edu.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dao.StuTempDao;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuTempEntity;
import io.renren.modules.edu.entity.constant.*;
import io.renren.modules.edu.service.FeeSchoolSundryService;
import io.renren.modules.edu.service.StuTempService;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuTempVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;


@Service("stuTempService")
public class StuTempServiceImpl extends ServiceImpl<StuTempDao, StuTempEntity> implements StuTempService {
    @Resource
    private StuTempDao stuTempDao;

    @Resource
    private SysDeptDao sysDeptDao;

    @Resource
    private StuBaseInfoDao stuBaseInfoDao;
    @Resource
    private FeeSchoolSundryService feeSchoolSundryService;
    @Override
    public PageUtils queryPage(Query query, StuTempEntity record,Long deptId) {
        IPage<StuTempVo> page = Query.getPage(query);
        page.setRecords(stuTempDao.selectStuTempInfo(page,record,deptId));
        return new PageUtils(page);
    }

    @Override
    public List<StuTempVo> queryExport(Query query, StuTempEntity record, Long deptId) {

        return this.baseMapper.selectStuTempInfo(null == query ? null : Query.getPage(query),record,deptId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<StuTempVo> cachedDataList) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        List<DeptdescriptionDto> descList = sysDeptDao.listStuTempDesc(null);
        Map<String, DeptdescriptionDto> deptDescMap = descList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        //来自excel的身份证列表
        List<String> cacheIdNumberList = new ArrayList<>(cachedDataList.size());
        for(StuTempVo entity : cachedDataList){
            cacheIdNumberList.add(entity.getIdNumber());
        }
        //查询数据库 是否有这些 身份证(关键词)
        List<StuKeyWordDto> oldStudentList = this.baseMapper.listAllKey(cacheIdNumberList, 1);
        Map<String,StuKeyWordDto> oldStudentMap = oldStudentList.stream().collect(Collectors.toMap(StuKeyWordDto::getIdNumber,Function.identity()));

        List<StuTempEntity> updateStudentList = new LinkedList<>();
        List<StuTempEntity> addStudentList = new LinkedList<>();
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        for(StuTempVo entity : cachedDataList){
            setTempDeptInfo(entity,deptDescMap);
/*            StuTempEntity temp = new StuTempEntity();
            BeanUtils.copyProperties(entity,temp);*/
            if(oldStudentMap.containsKey(entity.getIdNumber())){
                StuKeyWordDto dbKey = oldStudentMap.get(entity.getIdNumber());
                if(null == dbKey)
                    continue;
                entity.setId(dbKey.getId());
                entity.setUpdateTime(new Date());
                entity.setUpdateBy(userEntity.getUserId());
                updateStudentList.add(entity);
            }else {
                entity.setIsDeleted(false);
                entity.setCreateTime(new Date());
                entity.setCreateBy(userEntity.getUserId());
                addStudentList.add(entity);
            }
        }
        if(null != updateStudentList && !updateStudentList.isEmpty()){
            this.updateBatchById(updateStudentList);
        }
        if(null != addStudentList && !addStudentList.isEmpty()){
            this.baseMapper.batchInsert(addStudentList);
        }

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByIds(Long[] ids) {
        List<Long> idList = Arrays.asList(ids);
        stuTempDao.deleteByIds(idList);
    }

    @Override
    public StuTempVo getVoById(Long id) {
        StuTempEntity record = new StuTempEntity();
        record.setId(id);
        List<StuTempVo> ansList = stuTempDao.selectStuTempInfo(null, record, null);
        if(null == ansList || ansList.isEmpty())
            return new StuTempVo();
        return ansList.get(0);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveTemp(StuTempVo temp) throws Exception {
        Long id = temp.getId();
        check(temp);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        temp.setUpdateTime(new Date());
        temp.setUpdateBy(user.getUserId());
        List<DeptdescriptionDto> descList = sysDeptDao.listStuTempDesc(null);
        Map<String, DeptdescriptionDto> deptDescMap = descList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        Boolean aBoolean = setTempDeptInfo(temp, deptDescMap);
        if(!aBoolean)
            throw new Exception("院校、专业、年级填写有误");
        if(null == id || id <= 0){
            temp.setCreateTime(new Date());
            temp.setCreateBy(user.getUserId());
 /*           StuTempEntity insertEntity = new StuTempVo();
            BeanUtils.copyProperties(temp,insertEntity);*/
            temp.setIsDeleted(false);
            List<StuTempEntity> list = new LinkedList<>();
            list.add(temp);
            this.baseMapper.batchInsert(list);
        }else {
            this.baseMapper.updateById(temp);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void pass(Long[] ids) throws Exception {
        if(null == ids || 0 == ids.length)
            return;
        /**
         * 查询考生 并去除已经通过的考生
         */
        List<StuTempEntity> stuTempList = this.baseMapper.selectBatchIds(Arrays.asList(ids));
        stuTempList.removeIf(temp -> temp.getStatus() == STUTEMP_STATUS.PASS.getValue());

        List<StuBaseInfoEntity> baseInfoList = new ArrayList<>(stuTempList.size());
        List<FeeSchoolSundryEntity> feeList = new ArrayList<>(stuTempList.size());
        for (StuTempEntity stuTempEntity : stuTempList){
            checkIdNumber(stuTempEntity);
            stuTempEntity.setStatus(1);
            StuBaseInfoEntity baseInfo = new StuBaseInfoEntity();
            BeanUtils.copyProperties(stuTempEntity,baseInfo);
            baseInfo.setSchoolRollStatus(SCHOOL_ROLL_STATUS.getValue(null));
            baseInfo.setCurrentStatus(CURRENT_STATUS.getValue(null));
            baseInfoList.add(baseInfo);
        }
        if(null != stuTempList && !stuTempList.isEmpty()){
            this.updateBatchById(stuTempList);
        }
        if(null != baseInfoList && !baseInfoList.isEmpty()){
            stuBaseInfoDao.insertBatch(baseInfoList);
            for(StuBaseInfoEntity baseInfo : baseInfoList){
                FeeSchoolSundryEntity feeInfo = new FeeSchoolSundryEntity();
                BeanUtils.copyProperties(baseInfo,feeInfo);
                feeInfo.setIsArrearage(0);
                feeInfo.setIsDeleted(false);
                feeList.add(feeInfo);
            }
            feeSchoolSundryService.saveBatch(feeList);
        }
    }
    private Boolean setTempDeptInfo(StuTempVo entity, Map<String, DeptdescriptionDto> map){
        if(entity.getAcademyId() == null || entity.getMajorId() == null || entity.getGradeId() == null){
            String academyName = entity.getAcademyName();
            String majorName = entity.getMajorName();
            String gradeName = entity.getGradeName();
            String desc = academyName + gradeName  +  majorName;
            DeptdescriptionDto descDto = map.get(desc);
            if(null == descDto)
                return false;
            entity.setAcademyId(descDto.getAcademyId());
            entity.setMajorId(descDto.getMajorId());
            entity.setGradeId(descDto.getGradeId());
        }
        if(null == entity.getStatus()){
            entity.setStatus(STUTEMP_STATUS.getValue(entity.getStatusName()));
        }
        if(null == entity.getClassType()){
            entity.setClassType(CLASS_TYPE.getValue(entity.getClassTypeName()));
        }
        if(null == entity.getResidenceType()){
            entity.setResidenceType(RESIDENCE_TYPE.getValue(entity.getResidenceTypeName()));
        }
        return true;
    }
    private void check(StuTempVo temp) throws Exception{

        if(null == temp.getAcademyId() &&StringUtils.isEmpty(temp.getAcademyName())){
            throw new Exception("院校不能为空");
        }
        if(StringUtils.isEmpty(temp.getEnrollTeacher())){
            throw new Exception("招生老师不能为空");
        }
        if(null == temp.getMajorId() && StringUtils.isEmpty(temp.getMajorName())){
            throw new Exception("专业不能为空");
        }
        if(null == temp.getStatus()){
            throw new Exception("考生状态不能为空");
        }
        if(null == temp.getGradeId() && StringUtils.isEmpty(temp.getGradeName())){
            throw new Exception("年级不能为空");
        }
        if(null == temp.getSchoolingLength()){
            throw new Exception("学制不能为空");
        }
        if(StringUtils.isEmpty(temp.getStuName())){
            throw new Exception("姓名不能为空");
        }
       checkIdNumber(temp);
    }
    private void checkIdNumber(StuTempEntity temp) throws Exception{
        if(StringUtils.isEmpty(temp.getIdNumber())){
            throw new Exception("证件号不能为空");
        }
        StuTempEntity tempRecord = new StuTempEntity();
        tempRecord.setIdNumber(temp.getIdNumber());
        StuBaseInfoEntity record = new StuBaseInfoEntity();
        record.setIdNumber(temp.getIdNumber());
        if(temp.getId() == null
                && stuBaseInfoDao.selectStuBaseInfo(null,null,record,null,null,null).size()>0
                && stuTempDao.selectStuTempInfo(null,tempRecord,null).size()>0){
            throw new Exception("该名学生证件号系统中已存在");
        }
    }

}