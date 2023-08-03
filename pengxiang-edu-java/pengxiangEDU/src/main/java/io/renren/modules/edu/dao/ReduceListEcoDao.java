package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.ReduceListEcoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListEcoVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
@Mapper
public interface ReduceListEcoDao extends BaseMapper<ReduceListEcoEntity> {

    List<ReduceListEcoVo> selectReduceListEcoPage(IPage<ReduceListEcoVo> page, @Param("difficultType")String difficultType, @Param("academyId") Long academyId);

  List<EcoListForCheckVo> getEcoListForCheckVosByTempStuId(@Param("tempStuId") Long tempStuId);

    List<EcoListForCheckVo> getEcoListByAcademyId(@Param("academyId") Long academyId);
}
