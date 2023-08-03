package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import lombok.Data;

import java.util.Date;

@Data
public class StuEmployedVo extends InemEmployedStuRecordEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 学号
     */
    private String schoolNumber;
    /**
     * 学生姓名
     */
    private String stuName;
    /**
     * 系部
     */
    private String academyName;
    /**
     * 年级
     */
    private String grade;
    /**
     * 班级
     */
    private String className;

  /**
   * 入学日期
   */
  private Date admissionDate;
    /**
     * 专业
     */
    private String major;
    /**
     * 现就读学校
     */
    private String studyIn;
    /**
     * 现学籍学校
     */
    private String statusSchool;

}
