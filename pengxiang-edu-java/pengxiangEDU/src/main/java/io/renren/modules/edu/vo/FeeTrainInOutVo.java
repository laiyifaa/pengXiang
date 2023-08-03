package io.renren.modules.edu.vo;


import io.renren.modules.edu.entity.FeeTrainInOutEntity;
import lombok.Data;


@Data
public class FeeTrainInOutVo extends FeeTrainInOutEntity {
	private static final long serialVersionUID = 1L;
	/**
	 * 院校姓名
	 */
	String academyInfo;

}
