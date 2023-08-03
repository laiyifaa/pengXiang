package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.SysDeptEntity;
import lombok.Data;

import java.io.Serializable;
@Data
public class SysDeptVo extends SysDeptEntity implements Serializable {
  private static final long serialVersionUID = 1L;

  private String deptTypeInfo;
}
