package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.FeeTrainInOutEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.FeeTrainInOutVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 培训费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Mapper
public interface FeeTrainInOutDao extends BaseMapper<FeeTrainInOutEntity> {



}
