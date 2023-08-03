package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.entity.FeeStuPaidEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

@Mapper
public interface FeeStuPaidDao extends BaseMapper<FeeStuPaidEntity> {
    List<StuBaseInfoEntity> findDidntPayClearly(@Param("deptId")Long deptId, @Param("type")Integer type, @Param("academyId")Long academyId,@Param("schoolYearInfo")String schoolYearInfo);
}
