package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("recruit_admission_payment_useless")
public class RecruitAdmissionPaymentUselessEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	private Long stuId;
	/**
	 *
	 */

	@TableField(exist = false)
	private String stuname;

	@TableId
	private Integer id;
	/**
	 * 返费账户
	 */
	private String rebateAccount;
	/**
	 * 返费账号
	 */
	private String rebateAccountNumber;
	/**
	 * 返费开户行
	 */
	private String rebateBank;
	/**
	 * 缴费日期
	 */
	private Date paymentDate;

}
