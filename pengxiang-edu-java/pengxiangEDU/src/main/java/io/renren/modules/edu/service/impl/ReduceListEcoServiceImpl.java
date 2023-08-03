package io.renren.modules.edu.service.impl;

import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListEcoVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.ReduceListEcoDao;
import io.renren.modules.edu.entity.ReduceListEcoEntity;
import io.renren.modules.edu.service.ReduceListEcoService;


@Service("reduceListEcoService")
public class ReduceListEcoServiceImpl extends ServiceImpl<ReduceListEcoDao, ReduceListEcoEntity> implements ReduceListEcoService {

  @Override
  public PageUtils queryPage(Map<String, Object> params) {
    IPage<ReduceListEcoEntity> page = this.page(
      new Query<ReduceListEcoEntity>().getPage(params),
      new QueryWrapper<ReduceListEcoEntity>()
    );
    return new PageUtils(page);
  }

  @Override
  public int saveReduceListEco(ReduceListEcoEntity reduceListEco) {
    //如果为null，说明是院校自己的财务管理员负责
    if (reduceListEco.getAcademyId() == null) {
      SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
      reduceListEco.setAcademyId(user.getAcademyId());
    }
    int insert = baseMapper.insert(reduceListEco);
    return insert;

  }

  @Override
  public PageUtils selectReduceListEcoPage(IPage<ReduceListEcoVo> page, String difficultType, Long academyId) {

    IPage<ReduceListEcoVo> iPage = page.setRecords(baseMapper.selectReduceListEcoPage(page, difficultType, academyId));
    return new PageUtils(iPage);

  }

  @Override
  public List<EcoListForCheckVo> getEcoListTempStuId(Long tempStuId) {

    List<EcoListForCheckVo> ecoList = baseMapper.getEcoListForCheckVosByTempStuId(tempStuId);
    return ecoList;
  }

    @Override
    public List<EcoListForCheckVo> getEcoListByAcademyId(Long academyId) {

      List<EcoListForCheckVo> ecoList = baseMapper.getEcoListByAcademyId(academyId);
      return ecoList;

    }
}
