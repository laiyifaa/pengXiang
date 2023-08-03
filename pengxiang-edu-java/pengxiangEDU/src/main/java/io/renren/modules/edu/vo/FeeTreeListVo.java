package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.FeeStandardEntity;
import lombok.Data;

import java.util.List;

@Data
public class FeeTreeListVo {

  private Long id;
  private String label;
  private List<FeeStandardEntity> children;
}
