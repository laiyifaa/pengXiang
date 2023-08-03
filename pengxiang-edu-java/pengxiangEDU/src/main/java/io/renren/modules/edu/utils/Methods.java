package io.renren.modules.edu.utils;

import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.vo.FeeStandardVo;
import io.renren.modules.edu.vo.SysDeptVo;
import org.springframework.beans.BeanUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Methods {
    public static double BigDecimalSum(List<BigDecimal> list){
        BigDecimal res = new BigDecimal(0);
        for (BigDecimal bigDecimal : list) {
            if (bigDecimal != null){
                res= res.add(bigDecimal);
            }

        }
        return res.doubleValue();
    }

    public static List<BigDecimal> getBigDecimalList(FeeStandardVo standardVo){
        BigDecimal trainFee = standardVo.getTrainFee();
        BigDecimal clothesFee = standardVo.getClothesFee();
        BigDecimal bookFee = standardVo.getBookFee();
        BigDecimal hotelFee = standardVo.getHotelFee();
        BigDecimal bedFee = standardVo.getBedFee();
        BigDecimal insuranceFee = standardVo.getInsuranceFee();
        BigDecimal publicFee = standardVo.getPublicFee();
        BigDecimal certificateFee = standardVo.getCertificateFee();
        BigDecimal defenseEduFee = standardVo.getDefenseEduFee();
        BigDecimal bodyExamFee = standardVo.getBodyExamFee();

        List<BigDecimal> list = new ArrayList<>();
        list.add(trainFee);
        list.add(clothesFee);
        list.add(bookFee);
        list.add(hotelFee);
        list.add(bedFee);
        list.add(insuranceFee);
        list.add(publicFee);
        list.add(certificateFee);
        list.add(defenseEduFee);
        list.add(bodyExamFee);

        return list;
    }

    public static List<SysDeptVo> fommatDeptEntityToVo(List<SysDeptEntity> list){

      List<SysDeptVo> collect = list.stream().map(entity -> {
        SysDeptVo sysDeptVo = new SysDeptVo();
        BeanUtils.copyProperties(entity, sysDeptVo);
        sysDeptVo.setDeptTypeInfo(DeptTypeArray.TYPEARRAY[entity.getDeptType()]);
        return sysDeptVo;
      }).collect(Collectors.toList());
      return collect;

    }
}
