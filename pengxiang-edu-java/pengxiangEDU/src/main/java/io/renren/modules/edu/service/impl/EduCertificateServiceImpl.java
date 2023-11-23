package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.constant.CERTIFICATE_TYPE;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.CertificateDetailVo;
import io.renren.modules.edu.vo.CertificateVo;
import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;

import io.renren.modules.edu.dao.EduCertificateDao;
import io.renren.modules.edu.entity.EduCertificateEntity;
import io.renren.modules.edu.service.EduCertificateService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Service("eduCertificateService")
public class EduCertificateServiceImpl extends ServiceImpl<EduCertificateDao, EduCertificateEntity> implements EduCertificateService {

    @Resource
    private StuBaseInfoDao stuBaseInfoDao;

    @Resource
    private SysUserDao sysUserDao;

    @Override
    public List<CertificateVo> queryExport(Query query, CertificateVo key, Long deptId) {

        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<Long> deptIdList = sysUserDao.queryDeptIdList(user.getUserId());
        List<CertificateVo> exportList = baseMapper.selectCertificateVoInfo(null == query ? null : Query.getPage(query),
                key,
                deptId,
                null != deptIdList && deptIdList.size() > 0 ? deptIdList : null);
        return exportList;
    }

    @Override
    public PageUtils queryPage(IPage<CertificateVo> page, EduCertificateEntity key, Long deptId) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if(null == deptId || deptId <= 0){
            Long academyId = user.getAcademyId();
            deptId = academyId == -1 ? null : academyId;
        }
        List<Long> deptIdList = sysUserDao.queryDeptIdList(user.getUserId());
        IPage<CertificateVo> iPage;
        if(null == deptIdList || deptIdList.size() == 0){
            iPage = page.setRecords(this.baseMapper.selectCertificateVoInfo(page, key, deptId,null));
        }else {
            iPage = page.setRecords(this.baseMapper.selectCertificateVoInfo(page, key, deptId,deptIdList));
        }

        return new PageUtils(iPage);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void importByList(List<CertificateVo> cachedDataList) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return;
        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        //涉及到的学生全删全增
        Set<String> cacheIdNumberSet = new LinkedHashSet<>(cachedDataList.size());
        for( int i = 0;i<cachedDataList.size();++i){
            CertificateVo entity = cachedDataList.get(i);
            if(!cacheIdNumberSet.contains(entity.getIdNumber())){
                cacheIdNumberSet.add(entity.getIdNumber());
            }
        }
        List<String> cacheIdNumberList = cacheIdNumberSet.stream().collect(Collectors.toList());
        List<StuKeyWordDto> dbStudentList = stuBaseInfoDao.listAllKey(cacheIdNumberList, 1);
        Map<String, Long> dbStudentMap = dbStudentList.stream().collect(Collectors.toMap(StuKeyWordDto::getIdNumber, StuKeyWordDto::getStuId));
        List<EduCertificateEntity> addList = new ArrayList<>(dbStudentList.size() * 2);
        for(int i = 0; i < cachedDataList.size();++i){
            CertificateVo entity = cachedDataList.get(i);
            if(dbStudentMap.containsKey(entity.getIdNumber())){
                entity.setStuId(dbStudentMap.get(entity.getIdNumber()));
                entity.setIsDeleted(false);
                entity.setCreateTime(new Date());
                entity.setUpdateTime(new Date());
                entity.setCreateBy(userEntity.getUserId());
                addList.add(entity);
            }
        }
        this.baseMapper.batchInsert(addList);
    }

    @Override
    public void deleteByIds(Long[] ids) {
        List<Long> idList = Arrays.asList(ids);
        this.baseMapper.deleteByIds(idList);
    }

    @Override
    public CertificateDetailVo detailById(Long stuId) {
        CertificateDetailVo detailVo = new CertificateDetailVo();
        List<StuBaseInfoEntity> baseInfoList = stuBaseInfoDao.selectStuBaseInfo(null, stuId, null, null, null,null,null,null);
        if(baseInfoList == null || baseInfoList.size() != 1 )
            return null;
        detailVo.setBaseInfo(baseInfoList.get(0));
        setCertificateList(stuId,detailVo);
        return detailVo;
    }
    @Override
    public void setCertificateList(Long stuId,CertificateDetailVo detailVo){
        List<EduCertificateEntity> certificateList = this.baseMapper.selectList(new QueryWrapper<EduCertificateEntity>()
                .eq("is_deleted", 0)
                .eq("stu_id", stuId));
        List<EduCertificateEntity> optionList = new LinkedList<>();
        List<EduCertificateEntity> necessaryList = new LinkedList<>();
        for(EduCertificateEntity entity : certificateList){
            if(entity.getType() != null && entity.getType().equals(CERTIFICATE_TYPE.OPTION.getValue())){
                optionList.add(entity);
            }
            if(entity.getType() != null && entity.getType().equals(CERTIFICATE_TYPE.NECESSARY.getValue())){
                necessaryList.add(entity);
            }
        }
        detailVo.setNecessaryList(necessaryList);
        detailVo.setOptionList(optionList);
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveCertificateInfo(EduCertificateEntity temp) throws Exception {
        Long id = temp.getId();
        if(id == null){
            this.baseMapper.insert(temp);
            return;
        }
        if(id <= 0)
            throw new Exception();
        this.baseMapper.updateById(temp);
    }

}
