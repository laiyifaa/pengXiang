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
public class StuEmployDto {
    private int serNum;
    @ExcelProperty("姓名")
    private String name;
    @ExcelProperty("身份证号")
    private String idNumber;
    @ExcelProperty("联系电话")
    private String phone;
    @ExcelProperty("邮箱")
    private String email;
    @ExcelProperty("学号")
    private String schoolNumber;
    @ExcelProperty("专业")
    private String majorName;
    @ExcelProperty("学制")
    private String schoolingLength;
    @ExcelProperty("年级")
    private String gradeName;
    @ExcelProperty("系部")
    private String deptName;
    @ExcelProperty("班级")
    private String  className;
    @ExcelProperty("老师")
    private String headTeacher;
    @ExcelProperty("老师联系电话")
    private String headTeacherPhone;
    @ExcelProperty("就业公司")
    private String employOrg;
    @ExcelProperty("就业岗位")
    private String employPost;
    @ExcelProperty("负责人")
    private String postLeader;

    private String age;

    private String gender;

    private String nation;

    private String nativePlace;

    private String politicalStatus;


    private int classType;

    private Date leaveDate;

    private String leaveReason;

    private String probationIncome;

    private String formalIncome;

    private int residenceType;
}
