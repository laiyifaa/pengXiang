package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.EduCertificateEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import lombok.Data;

import java.util.List;

@Data
public class CertificateDetailVo {
    private List<EduCertificateEntity>  necessaryList ;
    private List<EduCertificateEntity> optionList;
    private StuBaseInfoEntity baseInfo;
}
