package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.entity.StuPracticeEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface StuPracticeDao extends BaseMapper<StuPracticeEntity> {
    @Select("SELECT COUNT(*) FROM stu_practice WHERE school_number = #{schoolNumber}")
    int countPracticeByStudentId(@Param("schoolNumber") String schoolNumber);
}
