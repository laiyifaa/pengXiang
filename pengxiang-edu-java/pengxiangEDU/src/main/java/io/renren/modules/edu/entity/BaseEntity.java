package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class BaseEntity implements Serializable {

  private static final long serialVersionUID = 1L;


  @TableField(fill = FieldFill.INSERT)
  @ExcelIgnore
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
  private Date createTime;

  @TableField(fill = FieldFill.INSERT_UPDATE)
  @ExcelIgnore
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  @JsonFormat(pattern = "yyyy-MM-dd")
  private Date updateTime;

  @TableField(fill = FieldFill.INSERT)
  @ExcelIgnore
  private Long createBy;

  @TableField(fill = FieldFill.INSERT_UPDATE)
  @ExcelIgnore
  private Long updateBy;

  @TableField(fill = FieldFill.INSERT)
  @ExcelIgnore
  private boolean isDeleted;
}
