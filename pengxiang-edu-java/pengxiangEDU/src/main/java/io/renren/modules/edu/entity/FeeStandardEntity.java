package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 收费标准设置表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("fee_standard")
public class FeeStandardEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@TableId
	private Long id;
	/**
	 * 院校id
	 */
	private Long academyId;
	/**
	 * 年级
	 */
	private Long gradeId;
	/**
	 * 专业
	 */
	private Long majorId;
	/**
	 * 班级类型(0升学，1就业)
	 */
	private Integer classType;
	/**
	 * 学制
	 */
	private String schoolSystem;
	/**
	 * 学年数
	 */
	private Integer schoolYear;
	/**
	 * 培训费
	 */
	private BigDecimal trainFee;
	/**
	 * 服装费
	 */
	private BigDecimal clothesFee;
	/**
	 * 教材费
	 */
	private BigDecimal bookFee;
	/**
	 * 住宿费
	 */
	private BigDecimal hotelFee;
	/**
	 * 被褥费
	 */
	private BigDecimal bedFee;
	/**
	 * 保险费
	 */
	private BigDecimal insuranceFee;
	/**
	 * 公物押金
	 */
	private BigDecimal publicFee;
	/**
	 * 证书费
	 */
	private BigDecimal certificateFee;
	/**
	 * 国防教育费
	 */
	private BigDecimal defenseEduFee;
	/**
	 * 体检费
	 */
	private BigDecimal bodyExamFee;




}
