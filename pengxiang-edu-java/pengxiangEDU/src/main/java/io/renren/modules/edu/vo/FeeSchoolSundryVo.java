package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

@Data
@ExcelIgnoreUnannotated
public class FeeSchoolSundryVo extends FeeSchoolSundryEntity {
    private static final long serialVersionUID = 1L;

    private String IfQMoney;
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
    @ExcelProperty("身份证号码")
    private String idNumber;

    @ExcelProperty("身份证类型")
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("入学日期")
    private Date admissionDate;
    /**
     * 注册学籍日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("注册学籍日期")
    private Date registerDate;

    /**
     * 学籍状态
     * 0 在册在籍、1 在册不在籍、2 在籍退学、3 非在册非在籍、4 提前入学
     */
    private Integer schoolRollStatus;

    @ExcelProperty("学籍状态")
    @TableField(exist = false)
    private String schoolRollStatusName;
    /**
     * 班型
     */
    @ExcelProperty("班型")
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
     * 当前状态：0在校、1实习、2就业、3请假、4休学、5退学、6毕业
     */
    private Integer currentStatus;

    @ExcelProperty("当前状态")
    @TableField(exist = false)
    private String currentStatusName;

    /**
     *
     */
    @ExcelProperty("宿舍楼号")
    private Integer dormNum;
    /**
     *
     */
    @ExcelProperty("房间号")
    private Integer roomNum;
    /**
     *
     */
    @ExcelProperty("床位号")
    private Integer bedNum;
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
     * 身份证地址
     */
    @ExcelProperty("身份证地址")
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

    /**
     * 缴费日期
     */
    private Date paySchoolDate;
    /**
     * 缴费学年
     */
    private Integer paySchoolYear;
    /**
     * 实缴培训费
     */
    private BigDecimal trainFee;
    /**
     * 实缴服装费
     */
    private BigDecimal clothesFee;
    /**
     * 实缴教材费
     */
    private BigDecimal bookFee;
    /**
     * 实缴住宿费
     */
    private BigDecimal hotelFee;
    /**
     * 实缴被褥费
     */
    private BigDecimal bedFee;
    /**
     * 实缴保险费
     */
    private BigDecimal insuranceFee;
    /**
     * 实缴公物押金
     */
    private BigDecimal publicFee;
    /**
     * 实缴证书费
     */
    private BigDecimal certificateFee;
    /**
     * 实缴国防教育费
     */
    private BigDecimal defenseEduFee;
    /**
     * 实缴体检费
     */
    private BigDecimal bodyExamFee;
    /**
     * 减免金额
     */
    private BigDecimal derateMoney;
    /**
     * 减免类型 1：贫困生 0：非贫困
     */
    private String derateType;
    /**
     * 减免备注
     */
    private String derateDetail;
    /**
     * 返费时间
     */
    private Date returnFeeTime;
    /**
     * 应返费总额
     */
    private BigDecimal needReturnFeeNum;
    /**
     * 返费金额
     */
    private BigDecimal factReturnFeeNum;
    /**
     * 返费账户
     */
    private String account;
    /**
     * 返费账号
     */
    private String accountNumber;
    /**
     * 返费开户行
     */
    private String depositBank;
    /**
     * 应缴培训费
     */
    private BigDecimal payTrainFee;
    /**
     * 应缴服装费
     */
    private BigDecimal payClothesFee;
    /**
     * 应缴教材费
     */
    private BigDecimal payBookFee;
    /**
     * 应缴住宿费
     */
    private BigDecimal payHotelFee;
    /**
     * 应缴被褥费
     */
    private BigDecimal payBedFee;
    /**
     * 应缴保险费
     */
    private BigDecimal payInsuranceFee;
    /**
     * 应缴公物押金
     */
    private BigDecimal payPublicFee;
    /**
     * 应缴证书费
     */
    private BigDecimal payCertificateFee;
    /**
     * 应缴国防教育费
     */
    private BigDecimal payDefenseEduFee;
    /**
     * 应缴体检费
     */
    private BigDecimal payBodyExamFee;
    /**
     * 是否欠费 1：是 0：否
     */
    private Integer isArrearage;
}
