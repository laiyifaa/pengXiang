package io.renren.modules.edu.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeptdescriptionDto {
    private Long academyId;
    private String academyName;
    private Long majorId;
    private String  majorName;
    private Long deptId;
    private Long gradeId;
    private String gradeName;
    private Long classId;
    private String className;
    private String description;
}
