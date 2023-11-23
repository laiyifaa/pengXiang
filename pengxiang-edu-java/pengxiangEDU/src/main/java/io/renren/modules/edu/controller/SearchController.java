package io.renren.modules.edu.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dto.SearchAllDto;
import io.renren.modules.edu.entity.StuDetailInfoEntity;
import io.renren.modules.edu.service.SearchService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.utils.Query;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/search")
public class SearchController {
    @Autowired
    private SearchService searchService;
    @Autowired
    RedisUtils redisUtils;

    @Autowired
    private StuBaseInfoService stuBaseInfoService;
    @RequestMapping("/getData")
    public R getDate(){
        return R.ok().put("Dto",searchService.getDate());
    }

    @PostMapping("/search")
    public R search(
            Query query,
            @RequestBody() List<SearchAllDto> searchConditions
    ){

        List<Long> list = searchService.search(searchConditions);
        PageUtils result = stuBaseInfoService.selectStuBaseInfo(Query.getPage(query), null, null, list);
        if (list == null){
            result.setList(new ArrayList<>());
        }
        return R.ok().put("result",result);
    }
}
