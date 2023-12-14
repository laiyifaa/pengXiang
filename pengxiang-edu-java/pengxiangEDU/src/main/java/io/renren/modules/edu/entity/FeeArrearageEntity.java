package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 欠费明细表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-24 11:26:23
 */
@Data
@TableName("fee_arrearage")
public class FeeArrearageEntity implements Serializable {
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
	 * 年份
	 */
	private String year;
	/**
	 * 欠培训费
	 */
	private BigDecimal trainFee;
	/**
	 * 欠服装费
	 */
	private BigDecimal clothesFee;
	/**
	 * 欠教材费
	 */
	private BigDecimal bookFee;
	/**
	 * 欠住宿费
	 */
	private BigDecimal hotelFee;
	/**
	 * 欠被褥费
	 */
	private BigDecimal bedFee;
	/**
	 * 欠保险费
	 */
	private BigDecimal insuranceFee;
	/**
	 * 欠公物押金
	 */
	private BigDecimal publicFee;
	/**
	 * 欠证书费
	 */
	private BigDecimal certificateFee;
	/**
	 * 欠国防教育费
	 */
	private BigDecimal defenseEduFee;
	/**
	 * 欠体检费
	 */
	private BigDecimal bodyExamFee;
	/**
	 * 欠费合计
	 */
	private BigDecimal feeNum;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;
	/**
	 * 创建人
	 */
	private Long createBy;
	/**
	 * 修改人
	 */
	private Long updateBy;
	/**
	 * 是否删除
	 */
	@TableField(fill = FieldFill.INSERT)
	@ExcelIgnore
	private Boolean isDeleted;

}
