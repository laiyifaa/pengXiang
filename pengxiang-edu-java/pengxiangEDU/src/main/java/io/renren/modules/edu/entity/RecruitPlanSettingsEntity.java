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
 * @date 2022-11-16 09:55:50
 */
@Data
@TableName("recruit_plan_settings")
public class RecruitPlanSettingsEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 * 年级
	 */
	private String grade;
	/**
	 * 招生季
	 */
	private String admissionSeason;
	/**
	 * 专业
	 */
	private Long majorId;

	@TableField(exist = false)
	private String specialized;
	/**
	 * 升学/就业
	 */
	private String further;
	/**
	 * 招生计划
	 */
	private String enrollmentPlan;
	/**
	 * 院校id
	 */
	private Integer schoolId;

}
