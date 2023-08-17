package io.renren.modules.edu.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.models.auth.In;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class SearchDto {
    private String name;
    private String schoolNumber;
    private String id;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date leaveDate;
    private String employPost;
    private String leaveReason;
    private String postLeader;
    private Short practiceType;
    private String practiceOrg;
    private Integer isPost;
    private Integer isSecondEmploy;
    private int pageNum;
    private int PageSize;
}
