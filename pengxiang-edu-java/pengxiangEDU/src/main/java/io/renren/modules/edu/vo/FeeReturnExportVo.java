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
public class FeeReturnExportVo {

    @TableId
    private Long id;
    private Long stuId;
    @ExcelProperty("院校名称")
    @TableField(exist = false)
    private String academyName;
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
     * 退费学年
     */
    @ExcelProperty("退费学年")
    private Integer returnSchoolYear;
    /**
     * 退费时间
     */
    @ExcelProperty(value = "退费时间",converter = DateConverter.class)
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
