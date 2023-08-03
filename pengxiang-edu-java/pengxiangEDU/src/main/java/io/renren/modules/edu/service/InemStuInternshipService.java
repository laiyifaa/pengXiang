package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.InemStuInternshipEntity;
import io.renren.modules.edu.vo.StuInternshipVo;

import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
public interface InemStuInternshipService extends IService<InemStuInternshipEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils internshipList(IPage<StuInternshipVo> page,String key);  //创美伟业子公司 实习查询

  StuInternshipVo getVoById(Long id);
}

