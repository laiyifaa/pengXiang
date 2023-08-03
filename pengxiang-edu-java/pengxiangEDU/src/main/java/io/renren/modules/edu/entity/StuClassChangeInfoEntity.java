package io.renren.modules.edu.entity;

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
@TableName("stu_class_change_info")
public class StuClassChangeInfoEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 *
	 */
	private Long academyId;
	/**
	 *
	 */
	private Date changeDate;
	/**
	 * 系部
	 */
	private String dept;
	/**
	 * 专业
	 */
	private String major;
	/**
	 *
	 */
	private Integer grade;
	/**
	 * 班级
	 */
	private String className;
	/**
	 * 班主任
	 */
	private String headTeacher;
	/**
	 * 班主任电话
	 */
	private String phone;

}
