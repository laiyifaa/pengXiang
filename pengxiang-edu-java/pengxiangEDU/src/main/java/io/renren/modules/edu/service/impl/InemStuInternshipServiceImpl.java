package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.edu.entity.AcademyEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.vo.StuInternshipVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.InemStuInternshipDao;
import io.renren.modules.edu.entity.InemStuInternshipEntity;
import io.renren.modules.edu.service.InemStuInternshipService;

import javax.annotation.Resource;


@Service("inemStuInternshipService")
public class InemStuInternshipServiceImpl extends ServiceImpl<InemStuInternshipDao, InemStuInternshipEntity> implements InemStuInternshipService {

    @Resource
    private StuBaseInfoService stuBaseInfoService;
    @Resource
    private SysDeptService sysDeptService;
    @Resource
    InemStuInternshipDao internshipDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<InemStuInternshipEntity> page = this.page(
                new Query<InemStuInternshipEntity>().getPage(params),
                new QueryWrapper<InemStuInternshipEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils internshipList(IPage<StuInternshipVo> page, String key) {

      SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
      IPage<StuInternshipVo> iPage = page.setRecords(internshipDao.selectInernshipList(page,key,user.getAcademyId()));
      return new PageUtils(iPage);
    }

  @Override
  public StuInternshipVo getVoById(Long id) {

    StuInternshipVo vo = baseMapper.getStuInternshipVoById(id);
    return vo;

  }

//  @Override
//  public PageUtils internshipList(Map<String, Object> params) {
//    return null;
//  }

  //    public PageUtils internshipList(Map<String, Object> params) {
//        IPage<InemStuInternshipEntity> page = this.page(
//                new Query<InemStuInternshipEntity>().getPage(params),
//                new QueryWrapper<InemStuInternshipEntity>()
//        );
//        List<InemStuInternshipEntity> records = page.getRecords();
//        List<StuInternshipVo> vos = new ArrayList<>();
//        for (InemStuInternshipEntity record : records) {
//            StuInternshipVo stuInternshipVo = new StuInternshipVo();
//            BeanUtils.copyProperties(record,stuInternshipVo);
//            Integer stuId = record.getStuId();
//            StuBaseInfoEntity byId = stuBaseInfoService.getById(stuId);
//            if (byId != null){
//                SysDeptEntity major = sysDeptService.getById(byId.getMajorId());
//                SysDeptEntity dept = sysDeptService.getById(byId.getDeptId());
//                SysDeptEntity grade = sysDeptService.getById(byId.getGradeId());
//                SysDeptEntity className = sysDeptService.getById(byId.getClassId());
//                stuInternshipVo.setSchoolNumber(byId.getSchoolNumber());
//                stuInternshipVo.setStuName(byId.getStuName());
//                stuInternshipVo.setDept(dept.getName());
//                stuInternshipVo.setMajor(major.getName());
//                stuInternshipVo.setGrade(grade.getName());
//                stuInternshipVo.setClassName(className.getName());
//                stuInternshipVo.setStudyIn(byId.getStudyIn());
//                stuInternshipVo.setStatusSchool(byId.getStatusSchool());
//            }
//            vos.add(stuInternshipVo);
//        }
//        Page<StuInternshipVo> voPage = new Page<>();
//        BeanUtils.copyProperties(page,voPage);
//        voPage.setRecords(vos);
//        return new PageUtils(voPage);
//    }

}
