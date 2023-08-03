package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import io.renren.modules.edu.entity.EduCertificateEntity;
import lombok.Data;

import java.util.Date;
@Data
@ExcelIgnoreUnannotated
public class CertificateVo extends EduCertificateEntity {
    private Long stuId;

    private String stuName;

    private String schoolNumber;


    private String academyName;

    private String majorName;

    private String gradeName;

    private String className;

    private String schoolingLength;

    private String phone;

    private Integer necessaryCount;

    private Integer optionCount;

}
