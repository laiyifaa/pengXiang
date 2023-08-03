package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuDetailInfoEntity;
import lombok.Data;

@Data
public class StuBaseAndDetailCollectionVo {
  private StuBaseInfoEntity base;
  private StuDetailInfoEntity detail;
}
