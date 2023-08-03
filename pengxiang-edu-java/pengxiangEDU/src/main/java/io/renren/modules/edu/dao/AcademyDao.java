package io.renren.modules.edu.dao;

import io.renren.modules.edu.entity.AcademyEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Mapper
public interface AcademyDao extends BaseMapper<AcademyEntity> {

    void batchInsert(@Param("aList") List<AcademyEntity> deptList);
}
