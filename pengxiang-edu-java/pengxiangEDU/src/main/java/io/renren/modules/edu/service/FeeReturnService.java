package io.renren.modules.edu.service;

import com.alibaba.excel.context.AnalysisContext;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.ReturnFeeDto;
import io.renren.modules.edu.entity.FeeReturnEntity;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import io.renren.modules.edu.vo.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 学生减免退费管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
public interface FeeReturnService  extends IService<FeeReturnEntity>{
     public List<ReturnFeeDto> getlist();
     public int update(FeeReturnEntity feeReturn);
     public PageUtils selectStuReturnFeePage(IPage<ReturnFeeDto> page, Long deptId);

     Integer saveFeeReturnSundry(ReturnFeeDto dto);

     void importByList(List<returnFeeImportVo> cachedDataList, AnalysisContext context) ;
     PageUtils queryPageInConditions(SearchConditionVo searchConditionVo);
}

