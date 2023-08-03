package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("stu_employ_visit")
public class StuEmployVistEntity {
    private Date visitDate;
    private int isPost;
    private int isSatisfied;
    private String workSituation;
    private String departReason;
    private int isSecondEmploy;
    private String secondEmployDate;
    private String employOrg;
    private String employPost;
    private String probationPeriod;
    private String probationIncome;
    private String formalIncome;
    private String postLeader;
    private String schoolNumber;
    private Long stuId;
    private int id;
}
