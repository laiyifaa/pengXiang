package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.FeeArrearageEntity;
import lombok.Data;

import java.util.Date;
@Data
public class FeeArrearageVo extends FeeArrearageEntity {


    /**
     * 院校姓名
     */
    private String academyInfo;

    /**
     * 学生姓名
     */
    private String stuName;
    /**
     * 身份证号
     */
    private String idNumber;
    /**
     * 年级
     */
    private String grade;
    /**
     * 招生季
     */
    private String admissionSeason;
    /**
     * 入学日期
     */
    private Date admissionDate;
    /**
     * 是否提前入学
     */
    private String isAdmissionEarly;

    /**
     * 专业
     */
    private String major;
    /**
     * 班型
     */
    private String classType;
    /**
     * 学制
     */
    private Integer schoolingLength;
}
