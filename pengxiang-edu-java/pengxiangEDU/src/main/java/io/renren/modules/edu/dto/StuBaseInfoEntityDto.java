package io.renren.modules.edu.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableName;
import io.renren.modules.edu.entity.BaseEntity;
import lombok.Data;

import java.io.Serializable;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("stu_base_info")
public class StuBaseInfoEntityDto extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@ExcelProperty(value = "序号")
	private String stuId;

	@ExcelProperty(value = "姓名")
	private String stuName;

	@ExcelProperty(value = "性别")
	private String gender;

	@ExcelProperty(value = "身份证号")
	private String idNumber;

	@ExcelProperty(value = "身份证地址")
	private String idCardAddr;

	@ExcelProperty(value = "初中毕业学校")
	private String graduatedSchool;

	@ExcelProperty(value = "手机号")
	private String phone;

	@ExcelProperty(value = "春招/秋招")
	private String admissionSeason;

	@ExcelProperty(value = "入学日期")
	private String admissionDate;

	@ExcelProperty(value = "注册学籍日期")
	private String registerDate;

	@ExcelProperty(value = "年级")
	private String gradeId;

	@ExcelProperty(value = "学历层次")
	private String eduLevel;

	@ExcelProperty(value = "学费" , index = 13)
	private String classId;

}
