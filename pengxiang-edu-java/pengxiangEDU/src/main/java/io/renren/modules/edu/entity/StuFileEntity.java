package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("stu_file")
public class StuFileEntity extends BaseEntity  implements Serializable {
    private Long id;

    private Long stuId;

    private Integer type;

    private String path;

}
