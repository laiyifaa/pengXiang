package io.renren.modules.edu.dto;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import lombok.Data;

import java.util.List;

@Data
public class StuChangeDto {
    long total;
    private List<StuInfoAndChangeDto> list;
}
