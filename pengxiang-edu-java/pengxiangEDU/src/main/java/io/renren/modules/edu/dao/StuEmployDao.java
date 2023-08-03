package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuEmployVistEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;

import java.util.List;

@Mapper
public interface StuEmployDao extends BaseMapper<StuEmployEntity> {
    @Select("SELECT school_number FROM stu_employ")
    List<String> getAllSchoolNumbers();
}
