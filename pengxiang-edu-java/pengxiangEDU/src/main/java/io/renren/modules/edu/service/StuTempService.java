package io.renren.modules.edu.service;


import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.StuTempEntity;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuTempVo;

import java.util.List;

/**
 * 招生临时信息
 *
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2023-07-20 16:49:26
 */
public interface StuTempService extends IService<StuTempEntity> {

    PageUtils queryPage(Query query,StuTempEntity record,Long deptId);

    List<StuTempVo> queryExport(Query query,StuTempEntity record,Long deptId);

    void importByList(List<StuTempVo> cachedDataList) throws RuntimeException ;

    void deleteByIds(Long[] ids);

    StuTempVo getVoById(Long id);

    void saveTemp(StuTempVo temp) throws Exception;

    void pass(Long[] ids) throws Exception;

}

