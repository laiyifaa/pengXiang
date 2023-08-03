package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.AcademyEntity;

import java.util.List;
import java.util.Map;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface AcademyService extends IService<AcademyEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<AcademyEntity> getAcademyList();

    int saveAcademy(AcademyEntity academy);

  int updateAcademy(AcademyEntity academy);
}

