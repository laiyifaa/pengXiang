package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.FeeStandardEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.FeeStandardVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 收费标准设置表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Mapper
public interface FeeStandardDao extends BaseMapper<FeeStandardEntity> {

    List<FeeStandardVo> selectStuTempPage(IPage<FeeStandardVo> page, @Param("param") FeeStandardVo feeStandardVo);

    List<FeeStandardVo> selectStuFeePage();

    FeeStandardEntity findStandardByStuInfo( @Param("academyId")Long academyId,@Param("majorId") Long majorId, @Param("gradeId")Long gradeId, @Param("schoolingLength")Integer schoolingLength,@Param("currentSchoolYear") Integer currentSchoolYear,@Param("classType") Integer classType);
}
