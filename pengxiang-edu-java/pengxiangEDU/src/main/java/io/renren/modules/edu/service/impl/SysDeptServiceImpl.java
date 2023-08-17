package io.renren.modules.edu.service.impl;

import io.renren.common.utils.Constant;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.utils.DeptTypeArray;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.SysDeptService;


@Service("sysDeptService")
public class SysDeptServiceImpl extends ServiceImpl<SysDeptDao, SysDeptEntity> implements SysDeptService {

  @Override
  public PageUtils queryPage(Map<String, Object> params) {
    IPage<SysDeptEntity> page = this.page(
      new Query<SysDeptEntity>().getPage(params),
      new QueryWrapper<SysDeptEntity>()
    );

    return new PageUtils(page);
  }

  @Override
  public List<SysDeptEntity> getDeptTreeList() {

    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
    List<SysDeptEntity> deptEntityList = baseMapper.selectList(queryWrapper.eq("is_deleted",0));

    return deptEntityList;

  }

  @Override
  public String getParentDeptName(Long pid) {
    if (pid != -1) {
      QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
      queryWrapper.eq("dept_id", pid);
      SysDeptEntity sysDeptEntity = baseMapper.selectOne(queryWrapper);
      return sysDeptEntity.getName();
    } else return null;

  }

  @Override
  public void updateDept(SysDeptEntity sysDept) {
    //先查出父部门
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    sysDept.setUpdateBy(user.getUserId());
    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("dept_id", sysDept.getPid());
    sysDept.setUpdateTime(new Date());

    SysDeptEntity father = baseMapper.selectOne(queryWrapper);
    sysDept.setDescription(father.getDescription()+sysDept.getName());
    sysDept.setIsDeleted(false);
    baseMapper.updateById(sysDept);

  }

  public void saveDept(SysDeptEntity sysDept) {
    //先查出父部门
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("dept_id", sysDept.getPid());
    SysDeptEntity father = baseMapper.selectOne(queryWrapper);
    sysDept.setDescription(father.getDescription()+sysDept.getName());
    sysDept.setIsDeleted(false);
    sysDept.setCreateTime(new Date());
    sysDept.setCreateBy(user.getUserId());
    List<SysDeptEntity> deptList = new LinkedList<>();
    deptList.add(sysDept);
    baseMapper.batchInsert(deptList );
  }

  @Override
  public IPage<SysDeptVo> selectSysDeptPage(IPage<SysDeptVo> page, String key) {
    //page.setRecords(baseMapper.selectStuTempPage(page, stuTempVo));

    IPage<SysDeptVo> sysDeptVoIPage = page.setRecords(baseMapper.selectSysDeptPage(page, key,null));
    List<SysDeptVo> records = sysDeptVoIPage.getRecords();

    for (SysDeptVo record : records) {
      record.setDeptTypeInfo(DeptTypeArray.TYPEARRAY[record.getDeptType()]);
    }
    return page.setRecords(records);

  }

  @Override
  public List<ClassVo> getClassListByGradeId(Long gradeId) {
    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<SysDeptEntity>().eq("pid", gradeId);
    List<SysDeptEntity> deptEntityList = baseMapper.selectList(queryWrapper);
    List<ClassVo> collect = deptEntityList.stream().map(item -> {
      ClassVo classVo = new ClassVo();
      classVo.setValue(item.getDeptId());
      classVo.setLabel(item.getName());
      return classVo;
    }).collect(Collectors.toList());
    return collect;

  }

  @Override
  public StuClassVo getStuClassInfoByClassId(Long classId) {
    SysDeptEntity sysDeptEntity = this.baseMapper.selectById(classId);
    StuClassVo stuClassVo = new StuClassVo();
    stuClassVo.setClassId(classId);
    stuClassVo.setClassName(sysDeptEntity.getName());
    return stuClassVo;
  }

  @Override
  public PageUtils getNextLevelDepts(IPage<SysDeptVo> page, Long pid) {
    List<SysDeptVo> entities = baseMapper.getNextLevelDepts(page, pid);
    IPage<SysDeptVo> iPage = page.setRecords(entities);
    return new PageUtils(iPage);
  }

  @Override
  public List<MajorSelectVo> getMajorListByTempStuId(Long tempStuId) {

    List<MajorSelectVo> majorVos = baseMapper.getMajorListByTempStuId(tempStuId);
    return majorVos;

  }

  @Override
  public List<AcademySelectVo> getAcademyList() {
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    List<AcademySelectVo> vos= baseMapper.getAcademyList(user.getAcademyId());
    if(user.getUserId() == Constant.SUPER_ADMIN){
      AcademySelectVo vo = new AcademySelectVo();
      vo.setLabel("所有院校");
      vo.setValue(-1);
      vos.add(vo);
    }
    return vos;

  }

  @Override
  public List<MajorSelectVo> getDeptsByPid(Long pid) {
    List<SysDeptEntity> depts = this.baseMapper.selectList(new QueryWrapper<SysDeptEntity>().eq("pid", pid).eq("is_deleted",0));
    //将depts封装成vo
    List<MajorSelectVo> majorSelectVos = depts.stream().map(item -> {
      MajorSelectVo majorSelectVo = new MajorSelectVo();
      majorSelectVo.setLabel(item.getName());
      majorSelectVo.setValue(item.getDeptId());
      return majorSelectVo;
    }).collect(Collectors.toList());
    return majorSelectVos;
  }

  @Override
  public List<DeptdescriptionDto> listDescription(DeptdescriptionDto record) {
    record.setDeptId(record.getMajorId());
    record.setMajorId(record.getDeptId());
    return this.baseMapper.listDesc(record);
  }

  @Override
  public List<SysDeptVo> listByKey(String key,Integer deptType) {
    return this.baseMapper.selectSysDeptPage(null,key,0);
  }
}
