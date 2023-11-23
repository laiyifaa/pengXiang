package io.renren.modules.edu.vo;

import io.renren.modules.edu.entity.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.Map;

@Getter
@Setter
@EqualsAndHashCode
public class StuDetailVo {
    /**
     * 就业信息
     */
    private StuBaseInfoEntity baseInfo;

    /**
     * 学杂费
     */
    private Map<String,List<FeeSchoolSundryEntity>>  feeList;
    /**
     * 就业
     */
    private StuEmployEntity employInfo;

    /**
     * 回访
     */
    private List<StuEmployVistEntity> visitList;

    /**
     * 实习列表
     */
    private List<StuPracticeEntity>  practiceList;

    /**
     *证书
     */
    private CertificateDetailVo certificateDetail;

    /**
     * 退费
     */
    private List<FeeReturnEntity> feeReturnList;

    /**
     *
     * 欠费
     */
    private List<FeeArrearageEntity> feeArrearageList;

    /**
     * 招生
     */
    private StuTempEntity tempInfo;


}
