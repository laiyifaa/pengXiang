package io.renren.modules.edu.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableName;
import io.renren.modules.edu.entity.BaseEntity;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
public class StuDetailInfoEntityDto extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@ExcelProperty(value = "学生id")
	private String stuId;
	/**
	 * 培养层次
	 */
	@ExcelProperty(value = "培养层次")
	private String eduLevel;
	/**
	 * 入学前技能水平
	 */
	@ExcelProperty(value = "入学前技能水平")
	private String skillBeforeAdmission;
	/**
	 * 入学学历
	 */
	@ExcelProperty(value = "入学学历")
	private String entranceQual;
	/**
	 * 毕业学校
	 */
	@ExcelProperty(value = "毕业学校")
	private String graduatedSchool;
	/**
	 * 户口性质
	 */
	@ExcelProperty(value = "户口性质")
	private String registeredResidence;
	/**
	 * 是否家庭困难
	 */
	@ExcelProperty(value = "是否家庭困难")
	private Boolean isDifficulty;
	/**
	 * (家庭困难类型)助学金申请：涉农专业、22个县户籍、家庭经济困难、建档立卡家庭经济困难学生、最低生活保障家庭学生、特困供养学生、孤儿学生、烈士子女 、家庭经济困难残疾学生、家庭经济困难残疾人子女、其他
	 */
	@ExcelProperty(value = "家庭困难类型")
	private String difficultyType;
	/**
	 * 资助申请类型
	 */

	@ExcelProperty(value = "资助申请类型")
	private String supportType;
	/**
	 * 家庭年总收入（元）
	 */
	@ExcelProperty(value = "家庭年总收入（元）")
	private String totalIncome;
	/**
	 * 家庭人均收入（元）
	 */
	@ExcelProperty(value = "家庭人均收入（元）")
	private String aveIncome;
	/**
	 *
	 */
	@ExcelProperty(value = "家庭经济来源")
	private String incomeSource;

	/**
	 * 银行账户
	 */
	@ExcelProperty(value = "银行账户")
	private String bankAccount;
	/**
	 * 银行卡帐号
	 */
	@ExcelProperty(value = "银行卡帐号")
	private String bankCardNum;
	/**
	 * 开户行
	 */
	@ExcelProperty(value = "开户行")
	private String deposit;

}
