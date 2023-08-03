package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 *
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Getter
@Setter
@EqualsAndHashCode
@TableName("stu_status_change_info")
public class StuStatusChangeInfoEntity extends BaseEntity implements Serializable {
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
	private String changeDetail;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date levelDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate;

	private Integer oldCurrentStatus;

	private Integer newCurrentStatus;

	private Integer oldSchoolRollStatus;

	private Integer newSchoolRollStatus;

}
