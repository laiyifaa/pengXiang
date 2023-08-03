package io.renren.modules.edu.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.StuDetailInfoDao;
import io.renren.modules.edu.entity.StuDetailInfoEntity;
import io.renren.modules.edu.service.StuDetailInfoService;


@Service("stuDetailInfoService")
public class StuDetailInfoServiceImpl extends ServiceImpl<StuDetailInfoDao, StuDetailInfoEntity> implements StuDetailInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StuDetailInfoEntity> page = this.page(
                new Query<StuDetailInfoEntity>().getPage(params),
                new QueryWrapper<StuDetailInfoEntity>()
        );

        return new PageUtils(page);
    }

}
