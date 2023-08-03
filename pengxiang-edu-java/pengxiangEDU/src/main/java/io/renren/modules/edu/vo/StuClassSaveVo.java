package io.renren.modules.edu.vo;

import lombok.Data;

@Data
public class StuClassSaveVo {
    private Long stuId;
    private Long academyId;
    private Long majorId;
    private Long gradeId;
    private Long classId;
    private String stuName;
    private String schoolNumber;
    private String majorInfo;
    private String gradeInfo;
    private String ClassInfo;
    private String academyInfo;
}
