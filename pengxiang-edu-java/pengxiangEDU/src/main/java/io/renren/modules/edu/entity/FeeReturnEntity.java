package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import lombok.Data;

/**
 * 学生减免退费管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("fee_return")
public class FeeReturnEntity extends BaseEntity  implements Serializable {
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
	 * 退费学年
	 */
	private Integer returnSchoolYear;
	/**
	 * 退费时间
	 */
	private Date returnMoneyTime;

	/**
	 * 退费金额
	 */
	private BigDecimal returnFeeNum;
	/**
	 * 退培训费
	 */
	private BigDecimal trainFee;
	/**
	 * 退服装费
	 */
	private BigDecimal clothesFee;
	/**
	 * 退教材费
	 */
	private BigDecimal bookFee;
	/**
	 * 退住宿费
	 */
	private BigDecimal hotelFee;
	/**
	 * 退被褥费
	 */
	private BigDecimal bedFee;
	/**
	 * 退保险费
	 */
	private BigDecimal insuranceFee;
	/**
	 * 退公物押金
	 */
	private BigDecimal publicFee;
	/**
	 * 退证书费
	 */
	private BigDecimal certificateFee;
	/**
	 * 退国防教育费
	 */
	private BigDecimal defenseEduFee;
	/**
	 * 退体检费
	 */
	private BigDecimal bodyExamFee;
	/**
	 * 退费账户
	 */
	private String account;
	/**
	 * 退费账号
	 */
	private String accountNumber;
	/**
	 * 退费开户行
	 */
	private String depositBank;


	@TableField(fill = FieldFill.INSERT)
	@ExcelIgnore
	private Boolean isDeleted;
}
