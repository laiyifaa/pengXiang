package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

/**
 * (FeeStuPaid)实体类
 *
 * @author makejava
 * @since 2023-02-27 14:35:56
 */
@Data
@TableName("fee_stu_paid")
public class FeeStuPaidEntity extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 819572821881772434L;
    /**
     * 主键
     */
    private Long id;
    /**
     * 每条记录和needpay表中每条记录一一对应
     */
    private Long feeNeedPayId;
    /**
     * 学生id
     */
    private Long stuId;
    /**
     * 院校id
     */
    private Long academyId;

    private Long deptId;

    private String billInfo;
    /**
     * 已缴培训费
     */
    private BigDecimal trainFee;
    /**
     * 已缴服装费
     */
    private BigDecimal clothesFee;
    /**
     * 已缴教材费
     */
    private BigDecimal bookFee;
    /**
     * 已缴住宿费
     */
    private BigDecimal hotelFee;
    /**
     * 已缴被褥费
     */
    private BigDecimal bedFee;
    /**
     * 已缴保险费
     */
    private BigDecimal insuranceFee;
    /**
     * 已缴公物押金
     */
    private BigDecimal publicFee;
    /**
     * 已缴证书费
     */
    private BigDecimal certificateFee;
    /**
     * 已缴国防教育费
     */
    private BigDecimal defenseEduFee;
    /**
     * 已缴体检费
     */
    private BigDecimal bodyExamFee;
    /**
     * 已缴费合计
     */
    private BigDecimal totalPaidFee;

    /**
     * 当前支付的费用类型
     */
    private Long feeStandardId;
    /**
     * 当前费用状态，是否缴清（已缴清800，未缴清801）
     */
    private Integer feeStatus;

}

