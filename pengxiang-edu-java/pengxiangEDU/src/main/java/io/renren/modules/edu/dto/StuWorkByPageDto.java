package io.renren.modules.edu.dto;

import lombok.Data;

import java.util.List;

@Data
public class StuWorkByPageDto {
   private List<StuWorkDto> list;
   private Long total;

}
