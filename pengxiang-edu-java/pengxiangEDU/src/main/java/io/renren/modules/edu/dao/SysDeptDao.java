package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.entity.SysDeptEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.AcademySelectVo;
import io.renren.modules.edu.vo.MajorSelectVo;
import io.renren.modules.edu.vo.SysDeptVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Mapper
public interface SysDeptDao extends BaseMapper<SysDeptEntity> {


    void batchInsert(@Param("deptList") List<SysDeptEntity>   deptList);

    List<SysDeptVo> selectSysDeptPage(IPage<SysDeptVo> page, @Param("key")String key,@Param("deptType")Integer deptType);

    List<SysDeptVo> getNextLevelDepts(IPage<SysDeptVo> page, @Param("pid")Long pid);

    List<MajorSelectVo> getMajorListByTempStuId(@Param("tempStuId") Long tempStuId);

    List<AcademySelectVo> getAcademyList(@Param("adminAcademyId")Long adminAcademyId);

    String getDeptInfoByDeptId(@Param("gradeId")Long gradeId);

    List<SysDeptEntity> listAll();

    List<DeptdescriptionDto> listDesc( DeptdescriptionDto record);

    List<DeptdescriptionDto> listStuTempDesc(DeptdescriptionDto record);
}
