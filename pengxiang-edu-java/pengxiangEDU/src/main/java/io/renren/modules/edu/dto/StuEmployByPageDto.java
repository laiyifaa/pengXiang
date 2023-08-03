package io.renren.modules.edu.dto;

import lombok.Data;

import java.util.List;

@Data
public class StuEmployByPageDto {
    List<StuEmployDto> list;
    long total;
}
