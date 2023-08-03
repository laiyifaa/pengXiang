package io.renren.modules.edu.vo;


import io.renren.modules.edu.entity.FeeStandardEntity;
import lombok.Data;

import java.math.BigDecimal;


@Data
public class FeeStandardVo extends FeeStandardEntity {
	private static final long serialVersionUID = 1L;
	/**
	 * 院校姓名
	 */
	String academyInfo;
	/**
	 * 年级
	 */
	String grade;
	/**
	 * 专业
	 */
	String major;
	/**
	 * 合计
	 */
	BigDecimal sum;

	String classTypeName;

}
