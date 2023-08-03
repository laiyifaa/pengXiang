package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
@Data
@TableName("reduce_list_stipend")
public class ReduceListStipendEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 * 家庭困难类型
	 */
	private String typeName;

	private Long academyId;
	/**
	 * 扣减学费
	 */
	private BigDecimal reduceTrainFee;
	/**
	 * 扣减服装费
	 */
	private BigDecimal reduceClothesFee;
	/**
	 * 扣减教材费
	 */
	private BigDecimal reduceBookFee;
	/**
	 * 扣减住宿费
	 */
	private BigDecimal reduceHotelFee;
	/**
	 * 扣减被褥费
	 */
	private BigDecimal reduceBedFee;
	/**
	 * 扣减保险费
	 */
	private BigDecimal reduceInsuranceFee;
	/**
	 * 扣减公物押金
	 */
	private BigDecimal reducePublicFee;
	/**
	 * 扣减证书费
	 */
	private BigDecimal reduceCertificateFee;
	/**
	 * 扣减国防教育费
	 */
	private BigDecimal reduceDefenseEduFee;
	/**
	 * 扣减体检费
	 */
	private BigDecimal reduceBodyExamFee;

}
