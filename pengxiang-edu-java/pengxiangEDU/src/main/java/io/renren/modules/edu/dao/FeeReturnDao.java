package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.dto.ReturnFeeDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.FeeReturnEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.FeeReturnVo;
import io.renren.modules.edu.vo.FeeSchoolSundryVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学生减免退费管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Mapper
public interface FeeReturnDao extends BaseMapper<FeeReturnEntity> {

    List<FeeReturnVo> selectFeeReturnPage(IPage<FeeReturnVo> page, @Param("param") FeeReturnVo feeReturnVo);
    List<ReturnFeeDto> selectReturnFeeDto(IPage<ReturnFeeDto> page, @Param("academyId") Long academyId, @Param("deptId") Long deptId);
    List<ReturnFeeDto> selectReturnFeeDto2( @Param("academyId") Long academyId, @Param("deptId") Long deptId);

    List<Long> getIdList();
}
