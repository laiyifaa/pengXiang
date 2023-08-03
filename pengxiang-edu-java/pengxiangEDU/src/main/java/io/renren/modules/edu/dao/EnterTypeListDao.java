package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.EnterTypeListEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.EnterTypeListSelectVo;
import io.renren.modules.edu.vo.EnterTypeListVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-01-13 18:40:54
 */
@Mapper
public interface EnterTypeListDao extends BaseMapper<EnterTypeListEntity> {

    List<EnterTypeListVo> selectEnterTypeListPage(IPage<EnterTypeListVo> page, @Param("key")String key, @Param("academyId")Long academyId);

    List<EnterTypeListSelectVo> selectEnterTypeListSelectVo(@Param("academyId") Long academyId);
}
