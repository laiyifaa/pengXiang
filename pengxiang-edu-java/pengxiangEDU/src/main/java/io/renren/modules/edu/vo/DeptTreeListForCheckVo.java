package io.renren.modules.edu.vo;

import lombok.Data;

import java.util.List;

@Data
public class DeptTreeListForCheckVo
{
  private Long value;
  private String label;
  private List<DeptTreeListForCheckVo> children;
}
