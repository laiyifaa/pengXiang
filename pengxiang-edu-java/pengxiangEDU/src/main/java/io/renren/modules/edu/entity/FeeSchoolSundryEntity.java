package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 学杂费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-27 09:15:34
 */
@Data
@TableName("fee_school_sundry")
public class FeeSchoolSundryEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 学生id
	 */
	private Long stuId;
	/**
	 * 院校id
	 */
	private Long academyId;
	/**
	 *
	 */
	private Long deptId;
	/**
	 * 缴费日期
	 */
	private Date paySchoolDate;
	/**
	 * 缴费学年
	 */
	private Integer paySchoolYear;


	/**
	 * 实缴培训费
	 */
	private BigDecimal trainFee;
	/**
	 * 实缴服装费
	 */
	private BigDecimal clothesFee;
	/**
	 * 实缴教材费
	 */
	private BigDecimal bookFee;
	/**
	 * 实缴住宿费
	 */
	private BigDecimal hotelFee;
	/**
	 * 实缴被褥费
	 */
	private BigDecimal bedFee;
	/**
	 * 实缴保险费
	 */
	private BigDecimal insuranceFee;
	/**
	 * 实缴公物押金
	 */
	private BigDecimal publicFee;
	/**
	 * 实缴证书费
	 */
	private BigDecimal certificateFee;
	/**
	 * 实缴国防教育费
	 */
	private BigDecimal defenseEduFee;
	/**
	 * 实缴体检费
	 */
	private BigDecimal bodyExamFee;
	/**
	 * 减免金额
	 */
	private BigDecimal derateMoney;
	/**
	 * 减免类型 1：贫困生 0：非贫困
	 */
	private String derateType;
	/**
	 * 减免备注
	 */
	private String derateDetail;
	/**
	 * 返费时间
	 */
	@JSONField(format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
	private Date returnFeeTime;
	/**
	 * 应返费总额
	 */
	private BigDecimal needReturnFeeNum;
	/**
	 * 返费金额
	 */
	private BigDecimal factReturnFeeNum;
	/**
	 * 返费账户
	 */
	private String account;
	/**
	 * 返费账号
	 */
	private String accountNumber;
	/**
	 * 返费开户行
	 */
	private String depositBank;
	/**
	 * 应缴培训费
	 */
	private BigDecimal payTrainFee;
	/**
	 * 应缴服装费
	 */
	private BigDecimal payClothesFee;
	/**
	 * 应缴教材费
	 */
	private BigDecimal payBookFee;
	/**
	 * 应缴住宿费
	 */
	private BigDecimal payHotelFee;
	/**
	 * 应缴被褥费
	 */
	private BigDecimal payBedFee;
	/**
	 * 应缴保险费
	 */
	private BigDecimal payInsuranceFee;
	/**
	 * 应缴公物押金
	 */
	private BigDecimal payPublicFee;
	/**
	 * 应缴证书费
	 */
	private BigDecimal payCertificateFee;
	/**
	 * 应缴国防教育费
	 */
	private BigDecimal payDefenseEduFee;
	/**
	 * 应缴体检费
	 */
	private BigDecimal payBodyExamFee;
	/**
	 * 是否欠费 1：是 0：否
	 */
	private Integer isArrearage;

	@TableField(exist = false)
	private String IfQMoney;

	@TableField(fill = FieldFill.INSERT)
	@ExcelIgnore
	private Boolean isDeleted;
}
