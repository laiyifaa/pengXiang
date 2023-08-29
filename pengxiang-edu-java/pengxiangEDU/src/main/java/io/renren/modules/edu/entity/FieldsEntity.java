package io.renren.modules.edu.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@TableName("fields")
@AllArgsConstructor
@NoArgsConstructor
public class FieldsEntity {
    private int id;
    private String fieldsName;
    private String fieldsDatabaseName;
    private int plateType;
    private int inputType;
    private int isDelete;
    @TableField(exist = false)
    private String optionValue;

}
