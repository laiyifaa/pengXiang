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
@TableName("inem_emp_revisit")
public class InemEmpRevisitEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long wa;
	/**
	 *
	 */
	private Long stuId;
	/**
	 *
	 */
	private Long deptId;
	/**
	 * 是否在岗(1在岗，0不在岗)
	 */
	private Boolean isWork;
	/**
	 * 是否对岗位满意
	 */
	private String isSatisfied;
	/**
	 * 学生就业工作情况(升职、降职、加薪、降薪、其他)
	 */
	private String empStatus;
	/**
	 * 离职原因(辞职、辞退)
	 */
	private String leaveReason;
	/**
	 * 转正薪酬
	 */
	private String regularizeSalary;
	/**
	 * 试用期限(二次就业分配填写)
	 */
	private String trialPeriod;
	/**
	 * 就业岗位(二次就业分配填写)
	 */
	private String reworkJob;
	/**
	 * 岗位负责人
	 */
	private String workLeader;
	/**
	 * 是否需要二次就业(0需要，1不需要)
	 */
	private Integer isNeedReemp;
	/**
	 * 二次就业分配时间(二次就业分配填写)
	 */
	private Date reempAllocateTime;
	/**
	 * 就业单位(二次就业分配填写)
	 */
	private String reworkIn;
	/**
	 * 试用期薪酬
	 */
	private String probationSalary;

}
