package io.renren.modules.edu.dao;

import io.renren.modules.edu.dto.FeeArrearageSumDto;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.entity.FeeArrearageEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 欠费明细表
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-24 11:26:23
 */
@Mapper
public interface FeeArrearageDao extends BaseMapper<FeeArrearageEntity> {
	List<qMoneyAndInfoListDto> qMoneyAndInfoListDto();
	qMoneyAndInfoListDto getOneListDto(@Param("id")Long id);
	List<FeeArrearageEntity> getOneQmoneyListDto(@Param("stuId")Long stuId);
	FeeArrearageSumDto getOneQmoneyNum(@Param("stuId")Long stuId);
}
