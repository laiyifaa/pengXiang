package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.ReduceListStipendEntity;
import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.ReduceListStipendVo;
import io.renren.modules.edu.vo.StipendListForCheckVo;

import java.util.List;
import java.util.Map;

/**
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
public interface ReduceListStipendService extends IService<ReduceListStipendEntity> {

    PageUtils queryPage(Map<String, Object> params);

    int saveReduceListStipend(ReduceListStipendEntity reduceListStipend);

    PageUtils selectReduceListStipendPage(IPage<ReduceListStipendVo> page, String difficultType, Long academyId);

    List<StipendListForCheckVo> getStipendListTempStuId(Long id);

    List<StipendListForCheckVo> getStipendListByAcademyId(Long academyId);
}

