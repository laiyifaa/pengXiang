package io.renren.modules.edu.service;

import com.alibaba.excel.context.AnalysisContext;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * 学杂费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface FeeSchoolSundryService extends IService<FeeSchoolSundryEntity> {


    Integer saveOrUpdateFeeSchoolSundry(FeeSchoolSundryDto dto);


    /*Map<String, Object> getStuBaseInfoAndFeeSundry(Long id);*/

    Map<String, Object> getSingleStuBaseInfoAndFeeSundry(Long stuId, String payYea, Date payDate);

    void importByList(List<FeeSundryImportVo> cachedDataList, AnalysisContext context) ;

    PageUtils selectStuFeeSundryPage(IPage<FeeSchoolSundryVo> page, Integer year, Long deptId, StuKeyWordDto key
    ,String isArrearage,String derateType);


    List<FeeSundryExportVo> queryExport(Query query, Integer year, Long deptId, StuKeyWordDto key
            , String isArrearage, String derateType);

    /**
     * 年份的形式
     * @return
     */
    TreeMap<String,List<FeeSchoolSundryEntity>> getFeeByStuId(Long stuId);
}

