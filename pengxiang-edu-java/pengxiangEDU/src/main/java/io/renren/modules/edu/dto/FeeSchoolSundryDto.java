package io.renren.modules.edu.dto;

import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import lombok.Data;

@Data
public class FeeSchoolSundryDto extends FeeSchoolSundryEntity{

    private String stuName;
    private String IfQMoney;
    private String idNumber;

}
