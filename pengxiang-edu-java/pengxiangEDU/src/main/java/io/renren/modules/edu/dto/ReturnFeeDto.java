package io.renren.modules.edu.dto;

import com.baomidou.mybatisplus.annotation.TableId;
import io.renren.modules.edu.entity.FeeReturnEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

@Data
public class ReturnFeeDto extends StuBaseInfoEntity{

   /**
    * 主键
    */
   @TableId
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
    * 退费学年
    */
   private Integer returnSchoolYear;
   /**
    * 退费时间
    */
   private Date returnMoneyTime;

   /**
    * 退费金额
    */
   private BigDecimal returnFeeNum;
   /**
    * 退培训费
    */
   private BigDecimal trainFee;
   /**
    * 退服装费
    */
   private BigDecimal clothesFee;
   /**
    * 退教材费
    */
   private BigDecimal bookFee;
   /**
    * 退住宿费
    */
   private BigDecimal hotelFee;
   /**
    * 退被褥费
    */
   private BigDecimal bedFee;
   /**
    * 退保险费
    */
   private BigDecimal insuranceFee;
   /**
    * 退公物押金
    */
   private BigDecimal publicFee;
   /**
    * 退证书费
    */
   private BigDecimal certificateFee;
   /**
    * 退国防教育费
    */
   private BigDecimal defenseEduFee;
   /**
    * 退体检费
    */
   private BigDecimal bodyExamFee;
   /**
    * 退费账户
    */
   private String account;
   /**
    * 退费账号
    */
   private String accountNumber;
   /**
    * 退费开户行
    */
   private String depositBank;

   private String remark;

/*   private byte isDeleted;*/
}
