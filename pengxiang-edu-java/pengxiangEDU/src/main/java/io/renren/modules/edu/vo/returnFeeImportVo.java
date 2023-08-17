package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.excel.DateConverter;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

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
public class returnFeeImportVo {

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
     * 退费学年
     */
    @ExcelProperty("退费学年")
    private Integer returnSchoolYear;
    /**
     * 退费时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty(value = "退费时间")
    private Date returnMoneyTime;

    /**
     * 退费金额
     */
    @ExcelProperty("退费金额")
    private BigDecimal returnFeeNum;
    /**
     * 退培训费
     */
    @ExcelProperty("退培训费")
    private BigDecimal trainFee;
    /**
     * 退服装费
     */
    @ExcelProperty("退服装费")
    private BigDecimal clothesFee;
    /**
     * 退教材费
     */
    @ExcelProperty("退教材费")
    private BigDecimal bookFee;
    /**
     * 退住宿费
     */
    @ExcelProperty("退住宿费")
    private BigDecimal hotelFee;
    /**
     * 退被褥费
     */
    @ExcelProperty("退被褥费")
    private BigDecimal bedFee;
    /**
     * 退保险费
     */
    @ExcelProperty("退保险费")
    private BigDecimal insuranceFee;
    /**
     * 退公物押金
     */
    @ExcelProperty("退公物押金")
    private BigDecimal publicFee;
    /**
     * 退证书费
     */
    @ExcelProperty("退证书费")
    private BigDecimal certificateFee;
    /**
     * 退国防教育费
     */
    @ExcelProperty("退国防教育费")
    private BigDecimal defenseEduFee;
    /**
     * 退体检费
     */
    @ExcelProperty("退体检费")
    private BigDecimal bodyExamFee;
    /**
     * 退费账户
     */
    @ExcelProperty("退费账户")
    private String account;
    /**
     * 退费账号
     */
    @ExcelProperty("退费账号")
    private String accountNumber;
    /**
     * 退费开户行
     */
    @ExcelProperty("退费开户行")
    private String depositBank;
}
