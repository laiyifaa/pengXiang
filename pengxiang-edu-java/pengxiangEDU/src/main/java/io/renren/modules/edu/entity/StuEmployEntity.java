package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.excel.DateConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("stu_employ")
@AllArgsConstructor
@NoArgsConstructor
@ExcelIgnoreUnannotated
public class StuEmployEntity {
    private int id;
    private Long stuId;
    @ExcelProperty("身份证号")
    private String idNumber;
    @ExcelProperty("学号")
    private String schoolNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty(value = "离校日期")
    private Date leaveDate;
    @ExcelProperty("离校原因")
    private String leaveReason;
    @ExcelProperty("就业单位")
    private String employOrg;
    @ExcelProperty("就业岗位")
    private String employPost;
    private String probationPeriod;
    @ExcelProperty("试用期薪酬")
    private String probationIncome;
    @ExcelProperty("转正薪酬")
    private String formalIncome;
    @ExcelProperty("岗位负责人")
    private String postLeader;
    private String postLeaderPhone;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date updateTime;
    private int createBy;
    private int updateBy;
    private int isDeleted;
}
