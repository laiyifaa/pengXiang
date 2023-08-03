package io.renren.modules.edu.vo;

import lombok.Data;

import java.util.List;

@Data
public class DeptListVo {

  private Long id;
  private String label;
  private List<Long> list;
  private List<DeptListVo> children;
  private Long pid;

  public void setChildren(List<Long> listByPid) {
  }
}
