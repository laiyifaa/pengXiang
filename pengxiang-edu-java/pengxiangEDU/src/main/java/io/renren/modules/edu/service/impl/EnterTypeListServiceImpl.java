package io.renren.modules.edu.service.impl;

import io.renren.modules.edu.vo.EnterTypeListVo;
import io.renren.modules.edu.vo.StuTempVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.EnterTypeListDao;
import io.renren.modules.edu.entity.EnterTypeListEntity;
import io.renren.modules.edu.service.EnterTypeListService;


@Service("enterTypeListService")
public class EnterTypeListServiceImpl extends ServiceImpl<EnterTypeListDao, EnterTypeListEntity> implements EnterTypeListService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<EnterTypeListEntity> page = this.page(
                new Query<EnterTypeListEntity>().getPage(params),
                new QueryWrapper<EnterTypeListEntity>()
        );

        return new PageUtils(page);
    }

  @Override
  public PageUtils selectEnterTypeListPage(IPage<EnterTypeListVo> page, String key) {

    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    IPage<EnterTypeListVo> iPage = page.setRecords(baseMapper.selectEnterTypeListPage(page, key, user.getAcademyId()));
    return new PageUtils(iPage);

  }

}
