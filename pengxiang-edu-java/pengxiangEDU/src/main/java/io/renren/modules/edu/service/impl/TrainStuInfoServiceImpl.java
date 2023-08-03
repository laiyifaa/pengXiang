package io.renren.modules.edu.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.TrainStuInfoDao;
import io.renren.modules.edu.entity.TrainStuInfoEntity;
import io.renren.modules.edu.service.TrainStuInfoService;


@Service("trainStuInfoService")
public class TrainStuInfoServiceImpl extends ServiceImpl<TrainStuInfoDao, TrainStuInfoEntity> implements TrainStuInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TrainStuInfoEntity> page = this.page(
                new Query<TrainStuInfoEntity>().getPage(params),
                new QueryWrapper<TrainStuInfoEntity>()
        );

        return new PageUtils(page);
    }

}
