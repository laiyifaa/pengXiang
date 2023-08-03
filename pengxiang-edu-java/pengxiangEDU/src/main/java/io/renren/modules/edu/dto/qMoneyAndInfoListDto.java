package io.renren.modules.edu.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/7/24 16:30
 */
@Data
public class qMoneyAndInfoListDto extends StuBaseInfoEntity implements Serializable {

    private String name;

    private Long id;
    /**
     * 学生id
     */
    private Long stuId;
    /**
     * 院校id
     */
    private Long academyId;
    /**
     *
     */
    private Long deptId;
    /**
     * 年份
     */
    private Integer year;
    /**
     * 欠培训费
     */
    private BigDecimal trainFee;
    /**
     * 欠服装费
     */
    private BigDecimal clothesFee;
    /**
     * 欠教材费
     */
    private BigDecimal bookFee;
    /**
     * 欠住宿费
     */
    private BigDecimal hotelFee;
    /**
     * 欠被褥费
     */
    private BigDecimal bedFee;
    /**
     * 欠保险费
     */
    private BigDecimal insuranceFee;
    /**
     * 欠公物押金
     */
    private BigDecimal publicFee;
    /**
     * 欠证书费
     */
    private BigDecimal certificateFee;
    /**
     * 欠国防教育费
     */
    private BigDecimal defenseEduFee;
    /**
     * 欠体检费
     */
    private BigDecimal bodyExamFee;
    /**
     * 欠费合计
     */
    private BigDecimal feeNum;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 创建人
     */
    private Long createBy;
    /**
     * 修改人
     */
    private Long updateBy;
    /**
     * 是否删除
     */
    private Boolean isDeleted;

}
