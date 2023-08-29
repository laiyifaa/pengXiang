package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 招生临时信息
 * 
 * @author lzq
 * @date 2023-07-20 16:49:26
 */
@Data
@TableName("stu_temp")
public class StuTempEntity  implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long id;
	/**
	 * 学生姓名
	 */
	@ExcelProperty("学生姓名")
	private String stuName;
	/**
	 * 学生证件
	 */
	@ExcelProperty("证件号码")
	private String idNumber;
	/**
	 * 报考院校id
	 */
	private Long academyId;
	/**
	 * 期望进入的专业
	 */
	private Long majorId;
	/**
	 * 进入的年级
	 */
	private Long gradeId;
	/**
	 * 班型（1就业、0升学）
	 */
	@ExcelProperty("班型(1就业 0升学)")
	private Integer classType;
	/**
	 * 学制（2\3）
	 */
	@ExcelProperty("学制")
	private String schoolingLength;

	/**
	 * 考生状态：0未参加面试，1通过面试，2未通过面试
	 */
	private Integer status;
	/**
	 * 证件类型
	 */
	@ExcelProperty("证件类型")
	private String idNumberType;
	/**
	 * 出生日期
	 */
	@ExcelProperty("出生日期")
	private String birthday;
	/**
	 * 性别
	 */
	@ExcelProperty("性别")
	private String gender;
	/**
	 * 民族
	 */
	@ExcelProperty("民族")
	private String nation;
	/**
	 * 籍贯
	 */
	@ExcelProperty("籍贯")
	private String nativePlace;
	/**
	 * 政治面貌
	 */
	@ExcelProperty("政治面貌")
	private String politicalStatus;
	/**
	 * 入学前技能水平
	 */
	@ExcelProperty("联系电话")
	private String phone;

	@ExcelProperty("入学前技能水平")
	private String skillBefore;

	@ExcelProperty("入学学历")
	private String eduBefore;
	/**
	 * 毕业学校
	 */
	@ExcelProperty("毕业学校")
	private String schoolBefore;
	/**
	 * 户口性质 0非农户口 1农业户口
	 */
	private Integer residenceType;
	/**
	 * 电子邮件
	 */
	@ExcelProperty("电子邮件")
	private String email;
	/**
	 * 招生季
	 */
	@ExcelProperty("招生季")
	private String admissionSeason;
	/**
	 * 招生老师
	 */
	@ExcelProperty("招生老师")
	private String enrollTeacher;
	/**
	 * 招生老师部门
	 */
	@ExcelProperty("招生老师部门")
	private String enrollTeacherDept;
	/**
	 * 招生老师电话
	 */
	@ExcelProperty("招生老师电话")
	private String enrollTeacherPhone;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT)
	private Date createTime;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Date updateTime;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT)
	private Long createBy;
	/**
	 *
	 */
	@TableField(fill = FieldFill.INSERT_UPDATE)
	private Long updateBy;
	/**
	 *
	 */
	private Boolean isDeleted;


}
