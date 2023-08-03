package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
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
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("stu_detail_info")

public class StuDetailInfoEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

  @TableId
  private Long id;
	/**
	 *
	 */
	private Long stuId;
	/**
	 * 培养层次
	 */
	private String eduLevel;
	/**
	 * 入学前技能水平
	 */
	private String skillBeforeAdmission;
	/**
	 * 入学学历
	 */
	private String entranceQual;
	/**
	 * 毕业学校
	 */
	private String graduatedSchool;
	/**
	 * 户口性质
	 */
	private String registeredResidence;
	/**
	 * 是否家庭困难
	 */
	private Boolean isDifficulty;
	/**
	 * (家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、
   * 最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、
   * 家庭经济困难残疾人子女、其他
	 */
	private Long difficultyType;
  /**
   * 免学费申请类型:免学费申请：农村（含县镇）学生 、
   * 城市涉农专业学生、城市家庭经济困难学生、民族地区就读学生、戏曲表演专业学生
   */
	private Long waiveType;

  /**
   * 资助申请类型 0都不申请，1申请家庭困难，2申请免学费，3两者都申请
   */
	private Integer supportType;
	/**
	 * 家庭年总收入（元）
	 */
	private BigDecimal totalIncome;
	/**
	 * 家庭人均收入（元）
	 */
	private BigDecimal aveIncome;
	/**
	 *
	 */
	private String incomeSource;
	/**
	 *
	 */
	private String firstSemesterLevel;
	/**
	 *
	 */
	private String secondSemesterLevel;
	/**
	 *
	 */
	private String thirdSemesterLevel;
	/**
	 *
	 */
	private String fourthSemesterLevel;
	/**
	 *
	 */
	private String fifthSemesterLevel;
	/**
	 *
	 */
	private String sixthSemesterLevel;
	/**
	 * 银行账户
	 */
	private String bankAccount;
	/**
	 * 银行卡帐号
	 */
	private String bankCardNum;
	/**
	 * 开户行
	 */
	private String deposit;

}
