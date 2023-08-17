package io.renren.modules.edu.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
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
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date end;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date start;
    private boolean timeIf;
    private List<pageVo> searchConditions;


    public Boolean getTimeIf() {
        return timeIf;
    }

    public void setTimeIf(Boolean timeIf) {
        this.timeIf = timeIf;
    }


}
