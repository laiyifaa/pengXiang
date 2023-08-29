package io.renren.modules.edu.vo;

import lombok.Data;

import java.util.List;
@Data
public class DeptTreeListVo{

  private Long id;
  private String label;
  private Long value;
  private List<DeptTreeListVo> children;
  private Long pid;
}
