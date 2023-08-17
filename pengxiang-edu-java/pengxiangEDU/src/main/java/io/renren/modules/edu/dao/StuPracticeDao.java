package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.entity.StuPracticeEntity;
import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StuPracticeDao extends BaseMapper<StuPracticeEntity> {
    @Select("SELECT COUNT(*) FROM stu_practice WHERE school_number = #{schoolNumber}")
    int countPracticeByStudentId(@Param("schoolNumber") String schoolNumber);

    @Select("SELECT school_number FROM stu_practice")
    List<String> getAllSchoolNumbers();

}
