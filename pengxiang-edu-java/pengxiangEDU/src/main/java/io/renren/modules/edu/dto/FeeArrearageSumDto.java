package io.renren.modules.edu.dto;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 欠费明细表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-24 11:26:23
 */
@Data
public class FeeArrearageSumDto  {
	/**
	 * 欠培训费
	 */
	private BigDecimal trainFeeNum;
	/**
	 * 欠服装费
	 */
	private BigDecimal clothesFeeNum;
	/**
	 * 欠教材费
	 */
	private BigDecimal bookFeeNum;
	/**
	 * 欠住宿费
	 */
	private BigDecimal hotelFeeNum;
	/**
	 * 欠被褥费
	 */
	private BigDecimal bedFeeNum;
	/**
	 * 欠保险费
	 */
	private BigDecimal insuranceFeeNum;
	/**
	 * 欠公物押金
	 */
	private BigDecimal publicFeeNum;
	/**
	 * 欠证书费
	 */
	private BigDecimal certificateFeeNum;
	/**
	 * 欠国防教育费
	 */
	private BigDecimal defenseEduFeeNum;
	/**
	 * 欠体检费
	 */
	private BigDecimal bodyExamFeeNum;
	/**
	 * 欠费合计
	 */
	private BigDecimal FeeNumNum;


}
