package io.renren.modules.edu.dto;

import lombok.Data;

@Data
public class SearchDto {
    private String name;
    private String schoolNumber;
    private String id;
    private int pageNum;
    private int PageSize;
}
