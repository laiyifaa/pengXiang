package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import io.renren.modules.edu.vo.StuClassVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Mapper
public interface StuBaseInfoDao extends BaseMapper<StuBaseInfoEntity> {




    @Select("SELECT school_number FROM stu_base_info")
    List<String> getAllSchoolNumbers();

    @Select("SELECT id_number FROM stu_base_info")
    List<String> getAllIdNumber();
    /**
     * 查询所有学生
     * @return
     */
    List<StuBaseInfoEntity> listAll();

    /**
     * 查询所有学生的关键词信息
     * @return
     */
    List<StuKeyWordDto> listAllKey(@Param("keyList") List<String>keyList,@Param("keyType") Integer keyType);

    /**
     * 批量插入
     * @param stuList
     * @return
     */
    int insertBatch(@Param("stuList") List<StuBaseInfoEntity>   stuList);

    int updateBatch(@Param("stuList") List<StuBaseInfoEntity>   stuList);

    List<StuClassVo> selectStuClassPage(IPage<StuClassVo> page, @Param("param") StuClassVo stuClassVo, @Param("key") String key);

    void unbundlingClass(@Param("stuId") Long stuId);

    List<StuBaseInfoEntity> selectStuBaseInfo(IPage<StuBaseInfoEntity> page,
                                              @Param("stuId")Long stuId,
                                              @Param("key") StuBaseInfoEntity key,
                                              @Param("academyId") Long academyId,
                                              @Param("deptId")Long deptId,
                                              @Param("isExcel") Integer isExcel,
                                              @Param("deptIdList") List<Long> deptIdList,
                                              @Param("stuIdList")List<Long> stuIdList);

    Integer deleteByIds(@Param("idList")List<Long> idList );

    List<StuBaseInfoEntity> getNotGraduateStuByDeptLimited(@Param("deptId")Long deptId, @Param("type")Integer type, @Param("academyId")Long academyId);
}
