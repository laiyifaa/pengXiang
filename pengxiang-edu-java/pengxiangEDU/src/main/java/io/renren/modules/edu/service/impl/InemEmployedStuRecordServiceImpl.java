package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.edu.entity.InemStuInternshipEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.vo.StuEmployedVo;
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

import io.renren.modules.edu.dao.InemEmployedStuRecordDao;
import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import io.renren.modules.edu.service.InemEmployedStuRecordService;


@Service("inemEmployedStuRecordService")
public class InemEmployedStuRecordServiceImpl extends ServiceImpl<InemEmployedStuRecordDao, InemEmployedStuRecordEntity> implements InemEmployedStuRecordService {

    @Autowired
    private StuBaseInfoService stuBaseInfoService;
    @Autowired
    private SysDeptService sysDeptService;
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<InemEmployedStuRecordEntity> page = this.page(
                new Query<InemEmployedStuRecordEntity>().getPage(params),
                new QueryWrapper<InemEmployedStuRecordEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils employedList(IPage<StuEmployedVo> page,String key) {
      SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
      IPage<StuEmployedVo> iPage = page.setRecords(baseMapper.selectEmployedList(page,key,user.getAcademyId()));
      return new PageUtils(iPage);
    }

  @Override
  public StuEmployedVo getStuEmployedVoById(Long id) {

      return baseMapper.getStuEmployedVoById(id);

  }

}
