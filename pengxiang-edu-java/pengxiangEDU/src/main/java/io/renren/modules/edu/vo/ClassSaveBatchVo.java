package io.renren.modules.edu.vo;

import lombok.Data;

import java.util.List;

@Data
public class ClassSaveBatchVo {
    List<Integer> ids;
    Long deptId;
}
