package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.EduCertificateEntity;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.CertificateDetailVo;
import io.renren.modules.edu.vo.CertificateVo;

import java.util.List;


/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface EduCertificateService extends IService<EduCertificateEntity> {



    List<CertificateVo> queryExport(Query query, CertificateVo key, Long deptId);

    PageUtils queryPage(IPage<CertificateVo> page, EduCertificateEntity key, Long deptId);


    void importByList(List<CertificateVo> cachedDataList);

    void deleteByIds(Long[] ids);

    CertificateDetailVo detailById(Long stuId);

    void saveCertificateInfo(EduCertificateEntity temp) throws Exception;

    void setCertificateList(Long stuId,CertificateDetailVo detailVo);

}

