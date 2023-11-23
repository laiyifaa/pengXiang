package io.renren.modules.edu.service.impl;

import io.renren.common.utils.Constant;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.AcademyDao;
import io.renren.modules.edu.entity.AcademyEntity;
import io.renren.modules.edu.service.AcademyService;

import javax.annotation.Resource;


@Service("academyService")
public class AcademyServiceImpl extends ServiceImpl<AcademyDao, AcademyEntity> implements AcademyService {

  @Resource
  SysDeptDao deptDao;

  @Override
  public PageUtils queryPage(Map<String, Object> params) {
    QueryWrapper<AcademyEntity> wrapper = new QueryWrapper<>();
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    wrapper.eq("is_deleted",0);
    if(user.getUserId() != Constant.SUPER_ADMIN){
      SysDeptEntity deptEntity = deptDao.selectById(user.getAcademyId());
      wrapper.eq("academy_info",deptEntity.getName());
    }
    IPage<AcademyEntity> page = this.page(
      new Query<AcademyEntity>().getPage(params),
            wrapper
    );

    return new PageUtils(page);
  }

  @Override
  public List<AcademyEntity> getAcademyList() {

    QueryWrapper<AcademyEntity> wrapper = new QueryWrapper<>();
    List<AcademyEntity> list = baseMapper.selectList(wrapper);
    return list;


  }

  @Override
  public int saveAcademy(AcademyEntity academy) {
    String academyInfo = academy.getAcademyInfo();
    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("name", academyInfo).eq("is_deleted",0);
    SysDeptEntity sysDeptEntity = deptDao.selectOne(queryWrapper);
    if (sysDeptEntity == null) {
      //没有重名的学院，开始添加
      List<AcademyEntity> academyList = new LinkedList<>();
      academyList.add(academy);
      academy.setIsDeleted(false);
      baseMapper.batchInsert(academyList);
      SysDeptEntity deptToSave = new SysDeptEntity();
      deptToSave.setDeptType(0);
      deptToSave.setName(academyInfo);
      deptToSave.setPid(-1L);
      deptToSave.setDescription(academyInfo);
      deptToSave.setIsDeleted(false);
//      deptToSave.setDeptSort(999);
//      deptToSave.setSubCount(0);
      List<SysDeptEntity> deptList = new LinkedList<>();
      deptList.add(deptToSave);
      deptDao.batchInsert(deptList);
      return 1;
    } else return -1;
  }

  @Override
  public int updateAcademy(AcademyEntity academy) {

    //更新学院表
    AcademyEntity academyEntity = baseMapper.selectById(academy.getAcademyId());
    academyEntity.setAcademyInfo(academy.getAcademyInfo());
    int i = baseMapper.updateById(academyEntity);

    //更新部门表
    QueryWrapper<SysDeptEntity> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("name",academy.getAcademyInfo());
    SysDeptEntity deptEntity = deptDao.selectOne(queryWrapper);
    deptEntity.setDescription(academy.getAcademyInfo());
    deptEntity.setName(academy.getAcademyInfo());
    int depRes = deptDao.updateById(deptEntity);
    if(depRes!=-1)return i;
    else return -1;

  }

}
