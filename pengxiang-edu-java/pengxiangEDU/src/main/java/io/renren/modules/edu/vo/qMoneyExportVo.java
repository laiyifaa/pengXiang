package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.math.BigDecimal;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/7/26 9:50
 */
@Data
public class qMoneyExportVo {

    @ExcelProperty("年级名称")
    @TableField(exist = false)
    private String gradeName;
    /**
     * 专业
     */

    @ExcelProperty("专业名称")
    @TableField(exist = false)
    private String majorName;
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
     * 年份
     */
    @ExcelProperty("年份")
    private Integer year;
    /**
     * 欠培训费
     */
    @ExcelProperty("欠培训费")
    private BigDecimal trainFee;
    /**
     * 欠服装费
     */
    @ExcelProperty("欠服装费")
    private BigDecimal clothesFee;
    /**
     * 欠教材费
     */
    @ExcelProperty("欠教材费")
    private BigDecimal bookFee;
    /**
     * 欠住宿费
     */
    @ExcelProperty("欠住宿费")
    private BigDecimal hotelFee;
    /**
     * 欠被褥费
     */
    @ExcelProperty("欠被褥费")
    private BigDecimal bedFee;
    /**
     * 欠保险费
     */
    @ExcelProperty("欠保险费")
    private BigDecimal insuranceFee;
    /**
     * 欠公物押金
     */
    @ExcelProperty("欠公物押金")
    private BigDecimal publicFee;
    /**
     * 欠证书费
     */
    @ExcelProperty("院校名称")
    private BigDecimal certificateFee;
    /**
     * 欠国防教育费
     */
    @ExcelProperty("欠国防教育费")
    private BigDecimal defenseEduFee;
    /**
     * 欠体检费
     */
    @ExcelProperty("欠体检费")
    private BigDecimal bodyExamFee;
    /**
     * 欠费合计
     */
    @ExcelProperty("欠费合计")
    private BigDecimal feeNum;
}
