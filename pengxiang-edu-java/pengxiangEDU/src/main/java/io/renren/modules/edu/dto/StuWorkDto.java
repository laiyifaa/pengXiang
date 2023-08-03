package io.renren.modules.edu.dto;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
public class StuWorkDto {
    private int serNum;
    @ExcelProperty("姓名")
    private String name;
    @ExcelProperty("身份证号")
    private String idNumber;
    @ExcelProperty("联系电话")
    private String phone;
    @ExcelProperty("专业")
    private String majorName;
    @ExcelProperty("实习公司")
    private String practiceOrg;
    @ExcelProperty("实习岗位")
    private String practicePost;
    @ExcelProperty("实习类别")
    private Short practiceType;
    @ExcelProperty("负责人")
    private String postLeader;
    @ExcelProperty("实习次数")
    private int times;

    private String schoolingLength;
    private String gradeName;
    private String schoolName;
    private String className;
    private String schoolNumber;
    private Date  admissionDate;

}
