package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.RecruitPlanSettingsDao;
import io.renren.modules.edu.entity.RecruitPlanSettingsEntity;
import io.renren.modules.edu.service.RecruitPlanSettingsService;


@Service("recruitPlanSettingsService")
public class RecruitPlanSettingsServiceImpl extends ServiceImpl<RecruitPlanSettingsDao, RecruitPlanSettingsEntity> implements RecruitPlanSettingsService {

    @Autowired
    SysDeptService sysDeptService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RecruitPlanSettingsEntity> page = this.page(
                new Query<RecruitPlanSettingsEntity>().getPage(params),
                new QueryWrapper<RecruitPlanSettingsEntity>()
        );

        List<RecruitPlanSettingsEntity> records = page.getRecords();
        for (RecruitPlanSettingsEntity record : records) {
            Long majorId = record.getMajorId();
            LambdaQueryWrapper<SysDeptEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(SysDeptEntity::getDeptId,majorId);
            SysDeptEntity one = sysDeptService.getOne(lambdaQueryWrapper);
            record.setSpecialized(one.getName());
        }
        return new PageUtils(page);
    }

}
