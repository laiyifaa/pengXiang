package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.FeeTrainInOutEntity;
import io.renren.modules.edu.vo.FeeTrainInOutVo;

import java.util.Map;

/**
 * 培训费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
public interface FeeTrainInOutService extends IService<FeeTrainInOutEntity> {

    PageUtils queryPage(Map<String, Object> params);


}

