package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("stu_base_info")
public class StuInfoEntity {
    @TableField("stu_id")
    private int  stuId;
    private int academyId;
    @TableField("school_number")
    private  String schoolNumber;
    @TableField("stu_name")
    private  String stuName;
    @TableField("id_number")
    private  String idNumber;
    @TableField("phone")
    private  String phone;
    @TableField("dept_id")
    private  int deptId;
    @TableField("grade_id")
    private int gradeId;
    @TableField("major_id")
    private int majorId;
    @TableField("class_id")
    private int classId;
    @TableField("head_teacher")
    private String headTeacher;
    @TableField("head_teacher_phone")
    private String headTeacherPhone;
    @TableField("schooling_length")
    private String schoolingLength;
    private String birthday;
    private String email;
    private  int classType;
    private String gender;
    private String politicalStatus;
    private String nation;
    private String nativePlace;
    private int residenceType;
    private Date admissionDate;

    private boolean isDeleted;
}
