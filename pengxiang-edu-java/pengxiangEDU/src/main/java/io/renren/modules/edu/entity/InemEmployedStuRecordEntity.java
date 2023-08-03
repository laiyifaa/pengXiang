package io.renren.modules.edu.entity;

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
@TableName("inem_employed_stu_record")
public class InemEmployedStuRecordEntity extends BaseEntity implements Serializable {
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
	 *
	 */
	private Long deptId;
	/**
	 * 入学日期
	 */
	private Date admissionDate;
	/**
	 * 离校日期
	 */
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
	private Date leaveDate;
	/**
	 * 离校原因(上岗就业或自主择业)
	 */
	private String leaveReason;
	/**
	 * 就业单位
	 */
	private String workIn;
	/**
	 * 就业岗位
	 */
	private String job;
	/**
	 * 试用期限
	 */
	private String trialPeriod;
	/**
	 * 试用期薪酬
	 */
	private String probationSalary;
	/**
	 * 转正薪酬
	 */
	private String regularizeSalary;
	/**
	 * 岗位负责人
	 */
	private String workLeader;

}
