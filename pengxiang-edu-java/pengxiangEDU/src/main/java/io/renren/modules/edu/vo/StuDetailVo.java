package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@EqualsAndHashCode
public class StuDetailVo {
    private StuBaseInfoEntity baseInfo;

    private List<FeeSchoolSundryEntity> feeList;

    private StuEmployEntity employInfo;

    private List<StuEmployVistEntity> visitList;

    private List<StuPracticeEntity>  practiceList;

}
