package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.renren.modules.edu.entity.EduCertificateEntity;
import lombok.Data;

@Data
@ExcelIgnoreUnannotated
public class CertificateVo extends EduCertificateEntity {
    @ExcelProperty("学生姓名")
    private String stuName;

    @ExcelProperty("身份证号码")
    private String idNumber;

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
