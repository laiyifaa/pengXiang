package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.ReduceListEcoEntity;
import lombok.Data;

import java.io.Serializable;

@Data
public class ReduceListEcoVo extends ReduceListEcoEntity implements Serializable {

  private static final long serialVersionUID = 1L;

  private String academyName;

}
