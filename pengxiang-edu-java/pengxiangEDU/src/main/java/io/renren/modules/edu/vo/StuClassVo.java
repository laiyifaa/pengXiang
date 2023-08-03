package io.renren.modules.edu.vo;/**
 * @author augus
 * @create 2022-11-29-8:56
 */

import lombok.Data;

/**
 * @ClassName:StuClassVo
 * @Description:TODO
 * @author Augus
 * @date 2022/11/29 8:56
 * @Version 1.0
 **/
@Data
public class StuClassVo {
    private Long stuId;
    private Long academyId;
    private Long majorId;
    private Long gradeId;
    private Long classId;
    private String stuName;
    private String schoolNumber;
    private String majorName;
    private String gradeName;
    private String ClassName;
    private String academyName;
}
