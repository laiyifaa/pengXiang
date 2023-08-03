package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.renren.modules.edu.excel.DateConverter;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/7/28 14:23
 */
@Data
@ExcelIgnoreUnannotated
public class FeeSundryExportVo {

    @TableId
    private Long id;
    private Long stuId;
    @ExcelProperty("院校名称")
    @TableField(exist = false)
    private String academyName;
    /**
     * 学号
     */
    @ExcelProperty("学号")
    private String schoolNumber;
    /**
     * 姓名
     */
    @ExcelProperty("姓名")
    private String stuName;
    /**
     * 身份证号码
     */

    @ExcelProperty("身份证号码")
    private String idNumber;
    /**
     * 性别
     */
    @ExcelProperty("性别")
    private String gender;
    /**
     * 民族
     */
    @ExcelProperty("民族")
    private String nation;
    /**
     * 籍贯
     */
    @ExcelProperty("籍贯")
    private String nativePlace;

    /**
     * 专业
     */
    @ExcelProperty("专业名称")
    @TableField(exist = false)
    private String majorName;

    @ExcelProperty("年级名称")
    @TableField(exist = false)
    private String gradeName;

    /**
     * 班级
     */

    @ExcelProperty("班级名称")
    @TableField(exist = false)
    private String className;
    /**
     * 招生季
     */
    @ExcelProperty("招生季")
    private String admissionSeason;

    @ExcelProperty("出生日期")
    private String birthday;

    /**
     * 缴费日期
     */
    @ExcelProperty(value = "缴费日期", converter = DateConverter.class)
    private Date paySchoolDate;
    /**
     * 缴费学年
     */
    @ExcelProperty("缴费学年")
    private Integer paySchoolYear;
    /**
     * 应缴培训费
     */
    @ExcelProperty("应缴培训费")
    private BigDecimal payTrainFee;
    /**
     * 实缴培训费
     */
    @ExcelProperty("实缴培训费")
    private BigDecimal trainFee;
    /**
     * 应缴服装费
     */
    @ExcelProperty("应缴服装费")
    private BigDecimal payClothesFee;
    /**
     * 实缴服装费
     */
    @ExcelProperty("实缴服装费")
    private BigDecimal clothesFee;
    /**
     * 应缴教材费
     */
    @ExcelProperty("应缴教材费")
    private BigDecimal payBookFee;
    /**
     * 实缴教材费
     */
    @ExcelProperty("实缴教材费")
    private BigDecimal bookFee;
    /**
     * 应缴住宿费
     */
    @ExcelProperty("应缴住宿费")
    private BigDecimal payHotelFee;
    /**
     * 实缴住宿费
     */
    @ExcelProperty("实缴住宿费")
    private BigDecimal hotelFee;
    /**
     * 应缴被褥费
     */
    @ExcelProperty("应缴被褥费")
    private BigDecimal payBedFee;
    /**
     * 实缴被褥费
     */
    @ExcelProperty("实缴被褥费")
    private BigDecimal bedFee;
    /**
     * 应缴保险费
     */
    @ExcelProperty("应缴保险费")
    private BigDecimal payInsuranceFee;
    /**
     * 实缴保险费
     */
    @ExcelProperty("实缴保险费")
    private BigDecimal insuranceFee;
    /**
     * 应缴公物押金
     */
    @ExcelProperty("应缴公物押金")
    private BigDecimal payPublicFee;
    /**
     * 实缴公物押金
     */
    @ExcelProperty("实缴公物押金")
    private BigDecimal publicFee;
    /**
     * 应缴证书费
     */
    @ExcelProperty("应缴证书费")
    private BigDecimal payCertificateFee;
    /**
     * 实缴证书费
     */
    @ExcelProperty("实缴证书费")
    private BigDecimal certificateFee;
    /**
     * 应缴国防教育费
     */
    @ExcelProperty("应缴国防教育费")
    private BigDecimal payDefenseEduFee;
    /**
     * 实缴国防教育费
     */
    @ExcelProperty("实缴国防教育费")
    private BigDecimal defenseEduFee;
    /**
     * 应缴体检费
     */
    @ExcelProperty("应缴体检费")
    private BigDecimal payBodyExamFee;
    /**
     * 实缴体检费
     */
    @ExcelProperty("实缴体检费")
    private BigDecimal bodyExamFee;
    /**
     * 减免金额
     */
    @ExcelProperty("减免金额")
    private BigDecimal derateMoney;
    /**
     * 减免类型 1：贫困生 0：非贫困
     */
    @ExcelProperty("减免类型")
    private String derateType;
    /**
     * 减免备注
     */
    @ExcelProperty("减免备注")
    private String derateDetail;
    /**
     * 返费时间
     */
    @ExcelProperty("返费时间")
    private String returnFeeTime;
    /**
     * 应返费总额
     */
    @ExcelProperty("应返费总额")
    private BigDecimal needReturnFeeNum;
    /**
     * 返费金额
     */
    @ExcelProperty("返费金额")
    private BigDecimal factReturnFeeNum;
    /**
     * 返费账户
     */
    @ExcelProperty("返费账户")
    private String account;
    /**
     * 返费账号
     */
    @ExcelProperty("返费账号")
    private String accountNumber;
    /**
     * 返费开户行
     */
    @ExcelProperty("返费开户行")
    private String depositBank;
    /**
     * 应缴培训费
     */
//    @ExcelProperty("应缴培训费")
//    private BigDecimal payTrainFee;

    /**
     * 是否欠费 1：是 0：否
     */
    @ExcelProperty("是否欠费")
    private String isArrearage;
}
