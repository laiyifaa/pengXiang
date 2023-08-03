package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.EnterTypeListEntity;
import io.renren.modules.edu.vo.EnterTypeListVo;

import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-01-13 18:40:54
 */
public interface EnterTypeListService extends IService<EnterTypeListEntity> {

    PageUtils queryPage(Map<String, Object> params);

  PageUtils selectEnterTypeListPage(IPage<EnterTypeListVo> page, String key);
}

