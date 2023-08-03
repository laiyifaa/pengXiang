package io.renren.modules.edu.dto;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuStatusChangeInfoEntity;
import lombok.Data;

@Data
public class StuInfoAndChangeDto {
    private StuBaseInfoEntity stuBaseInfoEntity;
    private StuStatusChangeInfoEntity stuStatusChangeInfoEntity;
    private String grade;
    private String major;
    private String School;
    private String Dept;
}
