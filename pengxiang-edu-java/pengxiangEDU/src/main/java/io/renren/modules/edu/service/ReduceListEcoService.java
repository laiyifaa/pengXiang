package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.ReduceListEcoEntity;
import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListEcoVo;

import java.util.List;
import java.util.Map;

/**
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
public interface ReduceListEcoService extends IService<ReduceListEcoEntity> {

  PageUtils queryPage(Map<String, Object> params);

  int saveReduceListEco(ReduceListEcoEntity reduceListEco);

  PageUtils selectReduceListEcoPage(IPage<ReduceListEcoVo> page, String difficultType,Long academyId);

  List<EcoListForCheckVo> getEcoListTempStuId(Long tempStuId);

  List<EcoListForCheckVo> getEcoListByAcademyId(Long academyId);
}

