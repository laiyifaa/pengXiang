package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.ReduceListStipendEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListStipendVo;
import io.renren.modules.edu.vo.StipendListForCheckVo;
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
public interface ReduceListStipendDao extends BaseMapper<ReduceListStipendEntity> {

    List<ReduceListStipendVo> selectReduceListStipendPage(IPage<ReduceListStipendVo> page, @Param("difficultType")String difficultType, @Param("academyId") Long academyId);

    List<StipendListForCheckVo> getStipendListForCheckVosByTempStuId(@Param("tempStuId") Long tempStuId);

    List<StipendListForCheckVo> getStipendListByAcademyId(@Param("academyId") Long academyId);
}
