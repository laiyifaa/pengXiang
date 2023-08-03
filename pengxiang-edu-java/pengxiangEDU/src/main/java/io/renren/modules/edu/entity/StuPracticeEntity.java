package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("stu_practice")
public class StuPracticeEntity {
      private int id;
      private Long stuId;
      private String schoolNumber;
      private Date leaveDate;
      private Date expectEndDate;
      private Date realEndDate;
      private String practiceOrg;
      private String practicePost;
      private String  practiceIncome;
      private String  postLeader;
      private String  postLeaderPhone;
      private short  isSatisfied;
      private short   practiceType;
      private String practiceResult;
}
