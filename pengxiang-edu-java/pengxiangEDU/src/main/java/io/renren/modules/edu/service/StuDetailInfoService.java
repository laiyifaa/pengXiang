package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.StuDetailInfoEntity;

import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface StuDetailInfoService extends IService<StuDetailInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

