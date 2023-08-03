package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 培训费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Data
@TableName("fee_train_in_out")
public class FeeTrainInOutEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;

	/**
	 * 姓名
	 */
	private String name;

	/**
	 * 证件
	 */
	private String idCard;
	/**
	 * 院校id
	 */
	private Long academyId;
	/**
	 * 培训类别
	 */
	private String trainType;
	/**
	 * 证书名称
	 */
	private String certificateName;
	/**
	 * 证书等级
	 */
	private String certificateLevel;
	/**
	 * 应收金额
	 */
	private BigDecimal needFeeNum;
	/**
	 * 实收金额
	 */
	private BigDecimal factFeeNum;
	/**
	 * 减免金额
	 */
	private BigDecimal derateFeeNum;
	/**
	 * 招生老师
	 */
	private String teacher;
	/**
	 * 招生老师电话
	 */
	private String teacherPhone;
	/**
	 * 返费时间
	 */
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
	private String returnAccount;
	/**
	 * 返费账号
	 */
	private String returnAccountNumber;
	/**
	 * 退费时间
	 */
	private Date backFeeTime;
	/**
	 * 退费金额
	 */
	private BigDecimal backFeeNum;
	/**
	 * 退费账户
	 */
	private String backAccount;
	/**
	 * 退费账号
	 */
	private String backAccountNumber;


}
