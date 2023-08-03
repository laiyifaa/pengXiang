package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import io.renren.modules.edu.vo.StuEmployedVo;
import io.renren.modules.edu.vo.StuInternshipVo;

import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
public interface InemEmployedStuRecordService extends IService<InemEmployedStuRecordEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils employedList(IPage<StuEmployedVo> page, String key);

  StuEmployedVo getStuEmployedVoById(Long id);
}

