package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.vo.*;

import java.util.List;
import java.util.Map;

/**
 * 部门
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface SysDeptService extends IService<SysDeptEntity> {


  List<SysDeptVo> listByKey(String key,Integer deptType);

  PageUtils queryPage(Map<String, Object> params);

  List<SysDeptEntity> getDeptTreeList();

  String getParentDeptName(Long pid);

  void saveDept(SysDeptEntity sysDept);

  void updateDept(SysDeptEntity sysDept);

  IPage<SysDeptVo> selectSysDeptPage(IPage<SysDeptVo> page, String key);

  List<ClassVo> getClassListByGradeId(Long gradeId);

  StuClassVo getStuClassInfoByClassId(Long classId);

  PageUtils getNextLevelDepts(IPage<SysDeptVo> page,Long pid);

  List<MajorSelectVo> getMajorListByTempStuId(Long tempStuId);

  List<AcademySelectVo> getAcademyList();

  List<MajorSelectVo> getDeptsByPid(Long pid);

  List<DeptdescriptionDto> listDescription(DeptdescriptionDto record);

}

