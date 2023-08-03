package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 部门
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Data
@TableName("sys_dept")
public class SysDeptEntity extends BaseEntity implements Serializable,Comparable {
	private static final long serialVersionUID = 1L;

	/**
	 * ID
	 */
	@TableId
	private Long deptId;
	/**
	 * 标志位：0-寝室，1-院系专业
	 */
//	private Integer typeFlag;
	/**
	 * 上级部门
	 */
	private Long pid;
//	/**
//	 * 子部门数目
//	 */
//	private Integer subCount;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 院系专业详细信息
	 */
	private String description;

  /**
   * 部门类型
   * 0 学校、学院
   * 1 专业、系部
   * 2 年级
   * 3 班级
   */
	private Integer deptType;

//	/**
//	 * 排序
//	 */
//	private Integer deptSort;
	/**
	 * 状态
	 */

  @Override
  public int compareTo(Object o) {
    SysDeptEntity entity = (SysDeptEntity) o;
    return this.getDeptId()>entity.getDeptId()?1:-1;
  }
}
