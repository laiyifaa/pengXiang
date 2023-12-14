package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.excel.DateConverter;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Getter
@Setter
@EqualsAndHashCode
@Data
@TableName("stu_base_info")
@ExcelIgnoreUnannotated
public class StuBaseInfoEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long stuId;
	/**
	 * 院校id
	 */
	private Long academyId;

	@ExcelProperty("院校名称")
	@TableField(exist = false)
	private String academyName;
	/**
	 * 学号
	 */
	@ExcelProperty("学号")
	private String schoolNumber;
	/**
	 * 姓名
	 */
	@ExcelProperty("姓名")
	private String stuName;
	/**
	 * 身份证号码
	 */
	@ExcelProperty("证件号码")
	private String idNumber;

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
	 * 联系电话
	 */
	@ExcelProperty("联系电话")
	private String phone;

	@ExcelProperty("入学学历")
	private String eduBefore;

	@ExcelProperty("入学前技能水平")
	private String skillBefore;

	@ExcelProperty("毕业学校")
	private String schoolBefore;

	private Integer residenceType;

	@ExcelProperty("户口性质")
	@TableField(exist = false)
	private String residenceTypeName;

	@ExcelProperty("电子邮件")
	private String email;

	/**
	 * 学制
	 */
	@ExcelProperty("学制")
	private String schoolingLength;

	/**
	 * 系部
	 */
	private Long deptId;
	/**
	 * 年级
	 */
	private Long gradeId;

	@ExcelProperty("年级名称")
	@TableField(exist = false)
	private String gradeName;
	/**
	 * 专业
	 */

	private Long majorId;

	@ExcelProperty("专业名称")
	@TableField(exist = false)
	private String majorName;
	/**
	 * 班级
	 */

	private Long classId;

	@ExcelProperty("班级名称")
	@TableField(exist = false)
	private String className;
	/**
	 * 招生季
	 */
	@ExcelProperty("招生季")
	private String admissionSeason;
	/**
	 * 入学日期
	 */

	@JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelProperty(value = "入学日期")
	@DateTimeFormat(value = "yyyy-MM-dd")
	private Date admissionDate;
	/**
	 * 注册学籍日期
	 */

    @JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelProperty(value = "注册学籍日期")
	@DateTimeFormat(value = "yyyy-MM-dd")
	private Date registerDate;

	/**
	 * 学籍状态
	 * 0 1 2 3 已注册、未注册、注册前退学、注册后退学
	 */
	private Integer schoolRollStatus;

	@ExcelProperty("学籍状态")
	@TableField(exist = false)
	private String schoolRollStatusName;
	/**
	 * 班型
	 */
	@ExcelProperty("班型(1就业 0升学)")
	private Integer classType;
	/**
	 * 是否提前入学
	 */
	@ExcelProperty("是否提前入学")
	private String isAdmissionEarly;



	/**
	 * 班主任
	 */
	@ExcelProperty("班主任")
	private String headTeacher;
	/**
	 * 班主任电话
	 */
	@ExcelProperty("班主任电话")
	private String headTeacherPhone;

	@ExcelProperty("班主任所属部门名称")
	private String headTeacherDept;
	/**
	 * 现就读学校
	 */
	@ExcelProperty("现就读学校")
	private String studyIn;
	/**
	 * 现学籍学校
	 */
	@ExcelProperty("现学籍学校")
	private String statusSchool;

	@ExcelProperty("培养层次")
	private String developLevel;


	/**
	 * 当前状态：0在校、1实习、2就业、3请假、4休学、5退学、6毕业、7未报到
	 */
	private Integer currentStatus;

	@ExcelProperty("当前状态")
	@TableField(exist = false)
	private String currentStatusName;

	/**
	 *
	 */
	@ExcelProperty("宿舍楼号")
	private String dormNum;
	/**
	 *
	 */
	@ExcelProperty("房间号")
	private String roomNum;
	/**
	 *
	 */
	@ExcelProperty("床位号")
	private String bedNum;
	/**
	 * 入住日期
	 */
	@DateTimeFormat(value = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelProperty(value = "入住日期")
	private Date checkIn;
	/**
	 * 离宿日期
	 */
	@DateTimeFormat(value = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	@ExcelProperty(value = "离宿日期")
	private Date leaveDate;

	/**
	 *
	 */
	@ExcelProperty(value = "第一学期评定")
	private String firstAssess;
	/**
	 *
	 */
	@ExcelProperty(value = "第二学期评定")
	private String secondAssess;
	/**
	 *
	 */
	@ExcelProperty(value = "第三学期评定")
	private String thirdAssess;
	/**
	 *
	 */
	@ExcelProperty(value = "第四学期评定")
	private String fourthAssess;
	/**
	 *
	 */
	@ExcelProperty(value = "第五学期评定")
	private String fifthAssess;
	/**
	 *
	 */
	@ExcelProperty(value = "第六学期评定")
	private String sixthAssess;

	/**
	 * 是否家庭困难
	 */
	@ExcelProperty("是否家庭困难")
	private String isDifficulty;

	@ExcelProperty(value = "家庭困难类型")
	private String difficultyType;


	@ExcelProperty(value = "资助申请类型")
	private String supportType;

	/**
	 * 家庭年总收入（元）
	 */
	@ExcelProperty(value = "家庭年总收入（元）")
	private BigDecimal totalIncome;
	/**
	 * 家庭人均收入（元）
	 */
	@ExcelProperty(value = "家庭人均收入（元）")
	private BigDecimal aveIncome;
	/**
	 *
	 */


	/**
	 * 身份证地址
	 */
	@ExcelProperty("证件地址")
	private String idCardAddr;
	/**
	 * 家庭联系人
	 */
	@ExcelProperty("家庭联系人")
	private String familyMemberName;
	/**
	 * 邮编
	 */
	@ExcelProperty("邮编")
	private String postCode;
	/**
	 * 家庭住址
	 */
	@ExcelProperty("家庭住址")
	private String familyAddr;
	/*
	 *
	 */
	@ExcelProperty("家庭联系电话")
	private String familyPhone;

	@ExcelProperty(value = "家庭经济来源")
	private String incomeSource;

	@TableField(exist = false)
	private String IfQMoney;

}
