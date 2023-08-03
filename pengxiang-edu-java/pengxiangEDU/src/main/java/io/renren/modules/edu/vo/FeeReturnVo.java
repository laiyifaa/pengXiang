package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.FeeReturnEntity;
import lombok.Data;

import java.util.Date;

@Data
public class FeeReturnVo extends FeeReturnEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 院校姓名
     */
    private String academyInfo;
    /**
     * 学号
     */
    private String schoolNumber;
    /**
     * 学生姓名
     */
    private String stuName;
    /**
     * 证件号
     */
    private String idNumber;
    /**
     * 年级
     */
    private Integer grade;
    /**
     * 招生季
     */
    private String admissionSeason;
    /**
     * 入学日期
     */
    private Date admissionDate;
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
