package io.renren.modules.edu.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Data
@TableName("inem_stu_internship")
public class InemStuInternshipEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 *
	 */
	private Long stuId;
	/**
	 * 实习类别(认识实习、岗位实习)
	 */
	private String internshipType;
	/**
	 * 实习单位
	 */
	private String internshipUnit;
	/**
	 * 实习报酬
	 */
	private String internshipSalary;
	/**
	 * 实习岗位
	 */
	private String internshipPost;
	/**
	 * 实习离校日期
	 */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
	private Date internshipLeaveDate;
	/**
	 * 预计实习结束日期
	 */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
	private Date expectedEndDate;
	/**
	 * 实际实习结束日期
	 */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
	private Date actualEndDate;
	/**
	 * 学生实习鉴定结果(优、良、合格、不合格)
	 */
	private String internshipResults;
	/**
	 * 是否对岗位满意
	 */
	private String isSatisfied;
	/**
	 * 带队教师
	 */
	private String leadTeacher;

}
