package io.renren.modules.edu.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.data.CellData;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.modules.edu.excel.DateConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@TableName("stu_practice")
@AllArgsConstructor
@NoArgsConstructor
@ExcelIgnoreUnannotated
public class StuPracticeEntity {
      private int id;
      private Long stuId;
      @ExcelProperty("学号")
      private String schoolNumber;
      @DateTimeFormat(pattern = "yyyy-MM-dd")
      @JsonFormat(pattern = "yyyy-MM-dd")
      @ExcelProperty("离校日期")
      private Date leaveDate;
      @DateTimeFormat(pattern = "yyyy-MM-dd")
      @JsonFormat(pattern = "yyyy-MM-dd")
      @ExcelProperty("预计实习结束日期")
      private Date expectEndDate;
      @DateTimeFormat(pattern = "yyyy-MM-dd")
      @JsonFormat(pattern = "yyyy-MM-dd")
      @ExcelProperty("实际实习结束日期")
      private Date realEndDate;
      @ExcelProperty("实习单位")
      private String practiceOrg;
      @ExcelProperty("实习岗位")
      private String practicePost;
      @ExcelProperty("实习报酬")
      private String  practiceIncome;
      @ExcelProperty("带队教师")
      private String  postLeader;
      @ExcelProperty("带队教师电话")
      private String  postLeaderPhone;
      @ExcelProperty("是否对岗位满意")
      private String  isSatisfied;
      @ExcelProperty("实习类别")
      private String   practiceType;
      @ExcelProperty("学生实习鉴定结果")
      private String practiceResult;
}
