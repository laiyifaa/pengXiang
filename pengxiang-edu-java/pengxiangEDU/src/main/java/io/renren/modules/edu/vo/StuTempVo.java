package io.renren.modules.edu.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.renren.modules.edu.entity.StuTempEntity;
import lombok.Data;


@Data
@ExcelIgnoreUnannotated
public class StuTempVo extends StuTempEntity {
  private static final long serialVersionUID = 1L;

  /**
   * 报考院校
   */
  @ExcelProperty("院校")
  private String academyName;
  @ExcelProperty("年级")
  private String gradeName;
  @ExcelProperty("专业")
  private String majorName;
  @ExcelProperty("班型")
  private String classTypeName;
  @ExcelProperty("考生状态")
  private String statusName;
  @ExcelProperty("户口性质")
  private String residenceTypeName;


}
