package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;
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
@TableName("train_stu_info")
public class TrainStuInfoEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 性别(男 or 女)
	 */
	private String gender;
	/**
	 * 年龄
	 */
	private Integer age;
	/**
	 * 学历
	 */
	private String educationBackground;
	/**
	 * 证件号
	 */
	private String idNumber;
	/**
	 * 户籍地
户籍地
	 */
	private String nativePlace;
	/**
	 * 联系方式
	 */
	private String phone;
	/**
	 * 现住址
	 */
	private String addres;
	/**
	 * 从事工作
	 */
	private String work;
	/**
	 * 培训类别
	 */
	private String trainCategory;
	/**
	 * 证书名称
	 */
	private String certificate;
	/**
	 * 证书等级
	 */
	private String certificateLevel;
	/**
	 * 有无社保（有无）
	 */
	private Integer isSocialSecurity;
	/**
	 * 缴费金额
	 */
	private BigDecimal paymentAmount;
	/**
	 * 缴费日期
	 */
	private Date paymentDate;
	/**
	 * 培训开始日期
	 */
	private Date trainStartDate;
	/**
	 * 培训结束日期
	 */
	private Date trainEndDate;
	/**
	 * 总学时
	 */
	private BigDecimal periodSum;
	/**
	 * 理论学时
	 */
	private String period;
	/**
	 * 理论教师
	 */
	private String teacher;
	/**
	 * 学习形式
	 */
	private String studyMode;
	/**
	 * 培训场所
	 */
	private String trainPlace;
	/**
	 * 实践学时
	 */
	private String practicePeriod;
	/**
	 * 报名信息来源（微信 熟人介绍 抖音）
	 */
	private String infoSource;
	/**
	 * 招生老师
	 */
	private String admissionTeacher;
	/**
	 * 招生老师电话
	 */
	private String admissionTeacherPhone;
	/**
	 * 证书编号
	 */
	private String certificateNumber;
	/**
	 * 签收日期
	 */
	private Date lodgmentDate;
	/**
	 * 学员状态（在培、结业、退学）
	 */
	private String stuStatus;


}
