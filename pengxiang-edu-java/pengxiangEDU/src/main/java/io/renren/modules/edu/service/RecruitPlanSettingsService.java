package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.RecruitPlanSettingsEntity;

import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
public interface RecruitPlanSettingsService extends IService<RecruitPlanSettingsEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

