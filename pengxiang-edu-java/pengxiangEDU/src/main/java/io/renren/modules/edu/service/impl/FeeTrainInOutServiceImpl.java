package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.edu.entity.AcademyEntity;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.vo.FeeTrainInOutVo;
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

import io.renren.modules.edu.dao.FeeTrainInOutDao;
import io.renren.modules.edu.entity.FeeTrainInOutEntity;
import io.renren.modules.edu.service.FeeTrainInOutService;


@Service("feeTrainInOutService")
public class FeeTrainInOutServiceImpl extends ServiceImpl<FeeTrainInOutDao, FeeTrainInOutEntity> implements FeeTrainInOutService {
    @Autowired
    private AcademyService academyService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FeeTrainInOutEntity> page = this.page(
                new Query<FeeTrainInOutEntity>().getPage(params),
                new QueryWrapper<FeeTrainInOutEntity>()
        );
        List<FeeTrainInOutEntity> records = page.getRecords();
        List<FeeTrainInOutVo> vos = new ArrayList<>();
        for (FeeTrainInOutEntity record : records) {
            FeeTrainInOutVo feeTrainInOutVo = new FeeTrainInOutVo();
            BeanUtils.copyProperties(record,feeTrainInOutVo);
            AcademyEntity byId = academyService.getById(record.getAcademyId());
            feeTrainInOutVo.setAcademyInfo(byId.getAcademyInfo());
            vos.add(feeTrainInOutVo);
        }
        IPage<FeeTrainInOutVo> voIPage = new Page<>();
        BeanUtils.copyProperties(page,voIPage);
        voIPage.setRecords(vos);
        return new PageUtils(voIPage);
    }

}
