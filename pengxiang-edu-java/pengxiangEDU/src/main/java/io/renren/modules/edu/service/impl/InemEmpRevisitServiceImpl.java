package io.renren.modules.edu.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.InemEmpRevisitDao;
import io.renren.modules.edu.entity.InemEmpRevisitEntity;
import io.renren.modules.edu.service.InemEmpRevisitService;


@Service("inemEmpRevisitService")
public class InemEmpRevisitServiceImpl extends ServiceImpl<InemEmpRevisitDao, InemEmpRevisitEntity> implements InemEmpRevisitService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<InemEmpRevisitEntity> page = this.page(
                new Query<InemEmpRevisitEntity>().getPage(params),
                new QueryWrapper<InemEmpRevisitEntity>()
        );

        return new PageUtils(page);
    }

}
