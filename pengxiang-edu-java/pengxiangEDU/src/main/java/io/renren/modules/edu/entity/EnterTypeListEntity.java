package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-01-13 18:40:54
 */
@Data
@TableName("enter_type_list")
public class EnterTypeListEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Long typeId;


  /**
   * 学院id，每个学院回扣力度不一样
   */
  private Long academyId;

	/**
	 * 招生方式名称
	 */
	private String enterTypeName;

  /**
   * 回扣金额
   */
	private BigDecimal couldGet;

}
