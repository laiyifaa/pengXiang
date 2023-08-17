package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.FeeSchoolSundryVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 学杂费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-27 09:15:34
 */
@Mapper
public interface FeeSchoolSundryDao extends BaseMapper<FeeSchoolSundryEntity> {

    List<FeeSchoolSundryVo> selectFeeSundryVo(IPage<FeeSchoolSundryVo> page, @Param("academyId") Long academyId, @Param("year") Integer year, @Param("deptId") Long deptId, @Param("key") StuKeyWordDto key);
    List<FeeSchoolSundryVo> selectFeeSundryVo2( @Param("academyId") Long academyId, @Param("year") Integer year, @Param("deptId") Long deptId, @Param("key") StuKeyWordDto key);

    List<Long> getIdList();
}
