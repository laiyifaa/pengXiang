package io.renren.modules.edu.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/7/21 16:25
 */
@Data
public class SearchConditionVo {
    private String limit;
    private String page;
    private List<pageVo> searchConditions;
}
