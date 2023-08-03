package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-29 11:01:51
 */
@TableName("fee_stu_need_pay")
public class FeeStuNeedPayEntity implements Serializable {
	private static final long serialVersionUID = 1L;

  @TableId
  @Setter
  @Getter
  private Long id;
	/**
	 *
	 */

  @Setter
  @Getter
	private Long stuId;

  /**
   * 学生应缴对应feestandard
   */
  @Getter
  @Setter
	private Long standardId;
	/**
	 *
	 */
  @Getter
  @Setter
	private Long deptId;
	/**
	 * 学年（1、2、3）
	 */
  @Getter
  @Setter
	private Integer schoolYear;

  @Getter
  @Setter
  private String schoolYearInfo;


  /**
	 * 培训费
	 */
  @Getter
  @Setter
	private BigDecimal trainFee;
	/**
	 * 服装费
	 */
  @Getter
  @Setter
	private BigDecimal clothesFee;
	/**
	 * 教材费
	 */
  @Getter
  @Setter
	private BigDecimal bookFee;
	/**
	 * 住宿费
	 */
  @Getter
  @Setter
	private BigDecimal hotelFee;
	/**
	 * 被褥费
	 */
  @Getter
  @Setter
	private BigDecimal bedFee;
	/**
	 * 保险费
	 */
  @Getter
  @Setter
	private BigDecimal insuranceFee;
	/**
	 * 公物押金
	 */
  @Getter
  @Setter
	private BigDecimal publicFee;
	/**
	 * 证书费
	 */
  @Getter
  @Setter
	private BigDecimal certificateFee;
	/**
	 * 国防教育费
	 */
  @Getter
  @Setter
	private BigDecimal defenseEduFee;
	/**
	 * 体检费
	 */
  @Getter
  @Setter
	private BigDecimal bodyExamFee;

  /**
   * 两种费用减免类型标记
   */
  @Getter
  @Setter
  private Long ecoReduceType;

  @Getter
  @Setter
  private Long stipendReduceType;

	/**
	 * 应收合计
	 */
	@Setter
	private BigDecimal totalNeedFee;

  public BigDecimal getTotalNeedFee() {
    return trainFee.add(clothesFee).add(bookFee).add(hotelFee)
      .add(bedFee).add(insuranceFee).add(publicFee).add(certificateFee)
      .add(defenseEduFee).add(bodyExamFee);

  }
}
