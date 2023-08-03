package io.renren.modules.edu.service.impl;

import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListEcoVo;
import io.renren.modules.edu.vo.ReduceListStipendVo;
import io.renren.modules.edu.vo.StipendListForCheckVo;
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

import io.renren.modules.edu.dao.ReduceListStipendDao;
import io.renren.modules.edu.entity.ReduceListStipendEntity;
import io.renren.modules.edu.service.ReduceListStipendService;


@Service("reduceListStipendService")
public class ReduceListStipendServiceImpl extends ServiceImpl<ReduceListStipendDao, ReduceListStipendEntity> implements ReduceListStipendService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ReduceListStipendEntity> page = this.page(
                new Query<ReduceListStipendEntity>().getPage(params),
                new QueryWrapper<ReduceListStipendEntity>()
        );

        return new PageUtils(page);
    }

  @Override
  public int saveReduceListStipend(ReduceListStipendEntity reduceListStipend) {
    if(reduceListStipend.getAcademyId()==null){
      SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
      reduceListStipend.setAcademyId(user.getAcademyId());
    }
    int insert = baseMapper.insert(reduceListStipend);
    return insert;
  }

    @Override
    public PageUtils selectReduceListStipendPage(IPage<ReduceListStipendVo> page, String difficultType, Long academyId) {
        IPage<ReduceListStipendVo> iPage = page.setRecords(baseMapper.selectReduceListStipendPage(page,difficultType, academyId));
        return new PageUtils(iPage);

    }

    @Override
    public List<StipendListForCheckVo> getStipendListTempStuId(Long tempStuId){
      List<StipendListForCheckVo> stipendList = baseMapper.getStipendListForCheckVosByTempStuId(tempStuId);
      return stipendList;
    }

  @Override
  public List<StipendListForCheckVo> getStipendListByAcademyId(Long academyId) {

    List<StipendListForCheckVo> stipendList = baseMapper.getStipendListByAcademyId(academyId);
    return stipendList;
  }
}
