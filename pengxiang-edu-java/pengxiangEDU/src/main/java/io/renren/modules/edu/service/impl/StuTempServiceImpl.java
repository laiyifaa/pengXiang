package io.renren.modules.edu.service.impl;

import com.alibaba.excel.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
import io.renren.modules.edu.utils.ExcelUtils;
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

import static io.renren.modules.edu.utils.ExcelUtils.getPreError;


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

        return this.baseMapper.selectStuTempInfo(null == query ? null : Query.getPage(query),
                record,deptId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<StuTempVo> cachedDataList) throws RuntimeException {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        List<DeptdescriptionDto> descList = sysDeptDao.listStuTempDesc(null);
        Map<String, DeptdescriptionDto> deptDescMap = descList.stream().collect(Collectors.toMap(DeptdescriptionDto::getDescription, Function.identity()));
        //来自excel的身份证列表
        Set<String> cacheIdNumberSet = new LinkedHashSet<>(cachedDataList.size());
        List<Integer> repeatStuIdList = new ArrayList<>(cachedDataList.size() / 4);
        for( int i = 0;i<cachedDataList.size();++i){
            StuTempVo entity = cachedDataList.get(i);
            if(cacheIdNumberSet.contains(entity.getIdNumber())){
                repeatStuIdList.add(i + 2);
            }
            cacheIdNumberSet.add(entity.getIdNumber());
        }
        if(repeatStuIdList.size() > 0){
            throw new RuntimeException(getRepeatError(repeatStuIdList));
        }
        List<String> cacheIdNumberList = new ArrayList<>(cacheIdNumberSet);
        //查询数据库 是否有这些 身份证(关键词)
        List<StuKeyWordDto> oldStudentList = this.baseMapper.listAllKey(cacheIdNumberList, 1);
        Map<String,StuKeyWordDto> oldStudentMap = oldStudentList.stream().collect(Collectors.toMap(StuKeyWordDto::getIdNumber,Function.identity()));
        List<StuTempEntity> updateStudentList = new LinkedList<>();
        List<StuTempEntity> addStudentList = new LinkedList<>();
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Integer> errorStuList = new ArrayList<>(cachedDataList.size() / 4);
        for(int i = 0;i<cachedDataList.size();++i){
            StuTempVo entity = cachedDataList.get(i);
            Boolean aBoolean = setTempDeptInfo(entity,deptDescMap);
            if(!aBoolean){
                errorStuList.add(i + 2);
                continue;
            }
            if(oldStudentMap.containsKey(entity.getIdNumber())){
                StuKeyWordDto dbKey = oldStudentMap.get(entity.getIdNumber());
                if(null == dbKey)
                    continue;
                entity.setId(dbKey.getId());
                entity.setUpdateTime(new Date());
                entity.setUpdateBy(userEntity.getUserId());
                entity.setIsDeleted(true);
                entity.setIsDeleted(false);
                updateStudentList.add(entity);
            }else {
                entity.setIsDeleted(false);
                entity.setCreateTime(new Date());
                entity.setCreateBy(userEntity.getUserId());
                entity.setIsDeleted(false);
                if(null == entity.getStatus()){
                    entity.setStatus(STUTEMP_STATUS.NOT_ATTEND.getValue());
                }
                addStudentList.add(entity);
            }
        }
        if(errorStuList.size() > 0){
            throw new RuntimeException(getIdNumberError(errorStuList));
        }
        if(null != updateStudentList && !updateStudentList.isEmpty()){
            this.updateBatchById(updateStudentList);
        }
        if(null != addStudentList && !addStudentList.isEmpty()){
            this.baseMapper.batchInsert(addStudentList);
        }
    }

    private String getIdNumberError(List<Integer> errorStuList) {
        StringBuilder ans = ExcelUtils.getPreError(errorStuList);
        ans.append("行学生身份证号码、院校、专业、年级填写有误");
        return ans.toString();
    }

    private String getRepeatError(List<Integer> repeatStuIdList) {
        StringBuilder ans = ExcelUtils.getPreError(repeatStuIdList);
        ans.append("行学生身份证与之前重复");
        return ans.toString();
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
        StuTempEntity dbStuTemp = this.baseMapper.selectOne(new QueryWrapper<StuTempEntity>().eq("id_number", temp.getIdNumber()));
        if(null != dbStuTemp || id > 0){
            temp.setIsDeleted(false);
            this.baseMapper.updateById(temp);
        }else if(null == id || id <= 0){
            temp.setCreateTime(new Date());
            temp.setCreateBy(user.getUserId());
            if(temp.getStatus() == null){
                temp.setStatus(STUTEMP_STATUS.NOT_ATTEND.getValue());
            }
 /*           StuTempEntity insertEntity = new StuTempVo();
            BeanUtils.copyProperties(temp,insertEntity);*/
            temp.setIsDeleted(false);
            List<StuTempEntity> list = new LinkedList<>();
            list.add(temp);
            this.baseMapper.batchInsert(list);
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
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<StuTempEntity> stuTempList = this.baseMapper.selectBatchIds(Arrays.asList(ids));
        stuTempList.removeIf(temp -> temp.getStatus()!= null && temp.getStatus() == STUTEMP_STATUS.PASS.getValue());

        List<StuBaseInfoEntity> baseInfoList = new ArrayList<>(stuTempList.size());
        List<FeeSchoolSundryEntity> feeList = new ArrayList<>(stuTempList.size());
        for (StuTempEntity stuTempEntity : stuTempList){
            //checkIdNumber(stuTempEntity);
            StuBaseInfoEntity baseInfo = new StuBaseInfoEntity();
            baseInfo.setIdNumber(stuTempEntity.getIdNumber());
            if(stuBaseInfoDao.selectStuBaseInfo(null, null, baseInfo, null, null, null, null, null).size() > 0){
                throw new Exception("学生列表已存在该名学生");
            }
            stuTempEntity.setStatus(STUTEMP_STATUS.PASS.getValue());
            BeanUtils.copyProperties(stuTempEntity,baseInfo);
            baseInfo.setSchoolRollStatus(SCHOOL_ROLL_STATUS.getValue(null));
            baseInfo.setCurrentStatus(CURRENT_STATUS.getValue(null));
            baseInfo.setIsDeleted(false);
            baseInfo.setCreateTime(new Date());
            baseInfo.setCreateBy(user.getUserId());
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
                feeInfo.setCreateBy(user.getUserId());
                feeInfo.setCreateTime(new Date());
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
        if(null == entity.getCurrentStatusName()){
            entity.setCurrentStatus(CURRENT_STATUS.getValue(entity.getCurrentStatusName()));
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
        //新增检查
        if (null == temp.getId() && stuBaseInfoDao.selectStuBaseInfo(null, null, record, null, null, null, null, null).size() > 0
                && stuTempDao.selectStuTempInfo(null, tempRecord, null).size() > 0) {
            throw new Exception(temp.getStuName() + "学生的证件号，学生列表或者招生列表中已存在");
        }
    }

    @Override
    public List<StuKeyWordDto> listAllKey(List<String> keyList, Integer keyType) {
        return this.baseMapper.listAllKey(keyList,keyType);
    }
}