package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.renren.modules.edu.entity.EduCertificateEntity;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@ExcelIgnoreUnannotated
public class CertificateExcelVo extends EduCertificateEntity {

    @ExcelProperty("学生姓名")
    private String stuName;

    @ExcelProperty("身份证号码")
    private String idNumber;

    @ExcelProperty("院校名称")
    private String academyName;

    @ExcelProperty("专业名称")
    private String majorName;

    @ExcelProperty("年级名称")
    private String gradeName;

    @ExcelProperty("班级名称")
    private String className;

}
