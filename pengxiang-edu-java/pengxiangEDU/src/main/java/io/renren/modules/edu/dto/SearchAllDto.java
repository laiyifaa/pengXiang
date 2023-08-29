package io.renren.modules.edu.dto;

import io.renren.modules.edu.entity.FieldsEntity;
import lombok.Data;

import java.util.List;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/8/28 10:00
 */
@Data
public class SearchAllDto {

    private FieldsEntity item;
    private String value;
    private int searchType;
}
