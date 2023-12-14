package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.entity.FeeArrearageEntity;
import io.renren.modules.edu.vo.SearchConditionVo;
import io.renren.modules.edu.vo.SysDeptVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 欠费明细表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-24 11:26:23
 */
public interface FeeArrearageService extends IService<FeeArrearageEntity> {

    PageUtils queryPage(HttpServletRequest request,Map<String, Object> params);

    PageUtils queryPageInConditions(SearchConditionVo searchConditionVo);

    List<qMoneyAndInfoListDto> getoneInfo(Long id);

    List<FeeArrearageEntity> getOneQmoneyListDto(Long stuId);

    PageUtils getListByPid(IPage<qMoneyAndInfoListDto> page, Long pid);
}

