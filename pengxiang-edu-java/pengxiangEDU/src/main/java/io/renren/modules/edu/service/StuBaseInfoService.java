package io.renren.modules.edu.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.StuBaseInfoEntity;

import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuClassVo;
import io.renren.modules.edu.vo.StuDetailVo;

import java.util.List;

/**
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
public interface StuBaseInfoService extends IService<StuBaseInfoEntity> {

  StuBaseInfoEntity getBaseInfoById(Long stuId) throws Exception;

  List<StuBaseInfoEntity> queryExport(Query query, StuBaseInfoEntity record, Long deptId);

  PageUtils selectStuClassPage(IPage<StuClassVo> page, StuClassVo stuClassVo,String key);

  StuBaseInfoEntity getBySchoolNumber(String schoolNumber);

 /* void bindClass(StuBaseInfoEntity stuBaseInfo);*/

  /*void updateClass(StuBaseInfoEntity stuBaseInfo);

  void unbundlingClass(List<Long> stuIds);*/

  PageUtils selectStuBaseInfo(IPage<StuBaseInfoEntity> page, StuBaseInfoEntity key,Long deptId);

  void importByList(List<StuBaseInfoEntity> cachedDataList);

  void deleteByIds(Long[] ids);

  StuDetailVo detailById(Long stuId);

  void saveBaseInfo(StuBaseInfoEntity temp) throws Exception;

}

