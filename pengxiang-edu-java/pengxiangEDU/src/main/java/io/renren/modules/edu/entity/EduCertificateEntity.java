package io.renren.modules.edu.entity;


import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.excel.DateConverter;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("edu_certificate")
public class EduCertificateEntity extends BaseEntity  implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long id;

	private Long stuId;

	/**
	 * 证书名称（茶艺证、礼仪证、铁路客服证、急救证、普通话证、教师资格证、保育员证等，其他证书）
	 */
	@ExcelProperty("证书名称")
	private String certificateName;
	/**
	 *
	 */


	/**
	 * 错补证信息（无，已补发/未补发）
	 */
	@ExcelProperty("错补证信息")
	private String information;

	/***
	 *考证时间
	 */
	@ExcelProperty(value = "考证时间",converter = DateConverter.class)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date examTime;
	/**
	 *发证日期
	 */
	@ExcelProperty(value = "发证日期",converter = DateConverter.class)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date issueTime;

	/**
	 * 备注
	 */
	@ExcelProperty("备注")
	private String remarks;
	/**
	 * 1 必考 0 选考
	 */
	@ExcelProperty("证书类型")
	private Integer type;
	/**
	 * 考证状态 1已考 0未考
	 */
	@ExcelProperty("考证状态")
	private Integer status;

}
