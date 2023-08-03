package io.renren.modules.edu.dao;

import io.renren.modules.edu.entity.FeeStuNeedPayEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-29 11:01:51
 */
@Mapper
public interface FeeStuNeedPayDao extends BaseMapper<FeeStuNeedPayEntity> {

    List<StuBaseInfoEntity> getAlreadyGenerateStuInfo(@Param("deptId")Long deptId, @Param("type")Integer type, @Param("academyId")Long academyId,@Param("schoolYearInfo")String schoolYEarInfo);
}
