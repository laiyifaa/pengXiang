package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.FeeStandardEntity;
import io.renren.modules.edu.vo.FeeStandardVo;

import java.util.List;
import java.util.Map;

/**
 * 收费标准设置表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface FeeStandardService extends IService<FeeStandardEntity> {

    void saveFeeStandard(FeeStandardVo vo);

    PageUtils queryPage(Map<String, Object> params);


    PageUtils selectStuFeePage(Map<String, Object> params);

    List<FeeStandardVo> selectAll();

    PageUtils getFeeStandListVo(Map<String, Object> params,Long pid);
    List<Long> getSonListVo(Long pid);
}

