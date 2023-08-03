package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.constant.CERTIFICATE_TYPE;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.CertificateDetailVo;
import io.renren.modules.edu.vo.CertificateVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
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

    /*@Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<EduCertificateEntity> page = this.page(
                new Query<EduCertificateEntity>().getPage(params),
                new QueryWrapper<EduCertificateEntity>()
        );

        return new PageUtils(page);
    }*/


    @Override
    public List<CertificateVo> queryExport(Query query, EduCertificateEntity key, Long deptId) {
 /*       SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if(null == deptId || deptId <= 0){
            Long academyId = user.getAcademyId();
            deptId = academyId == -1 ? null : academyId;
        }*/
        /*this.baseMapper.selectCertificateVoInfo(page, key, deptId)*/
        return null;
    }

    @Override
    public PageUtils queryPage(IPage<CertificateVo> page, EduCertificateEntity key, Long deptId) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        if(null == deptId || deptId <= 0){
            Long academyId = user.getAcademyId();
            deptId = academyId == -1 ? null : academyId;
        }
        IPage<CertificateVo> iPage = page.setRecords(this.baseMapper.selectCertificateVoInfo(page, key, deptId));
        return new PageUtils(iPage);
    }

    @Override
    public void importByList(List<CertificateVo> cachedDataList) {

    }

    @Override
    public void deleteByIds(Long[] ids) {
        List<Long> idList = Arrays.asList(ids);
        this.baseMapper.deleteByIds(idList);
    }

    @Override
    public CertificateDetailVo detailById(Long stuId) {
        CertificateDetailVo detailVo = new CertificateDetailVo();
        List<StuBaseInfoEntity> baseInfoList = stuBaseInfoDao.selectStuBaseInfo(null, stuId, null, null, null,null);
        if(baseInfoList == null || baseInfoList.size() != 1 )
            return null;
        detailVo.setBaseInfo(baseInfoList.get(0));
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
        return detailVo;
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
