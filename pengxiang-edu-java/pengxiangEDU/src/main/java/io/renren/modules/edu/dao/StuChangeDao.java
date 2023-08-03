package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.entity.StuStatusChangeInfoEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StuChangeDao extends BaseMapper<StuStatusChangeInfoEntity> {

    void addStatusChange(StuStatusChangeInfoEntity StuChange);

}
