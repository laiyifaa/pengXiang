package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.modules.edu.utils.Query;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.edu.entity.EnterTypeListEntity;
import io.renren.modules.edu.service.EnterTypeListService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-01-13 18:40:54
 */
@RestController
@RequestMapping("generator/entertypelist")
public class EnterTypeListController {
    @Autowired
    private EnterTypeListService enterTypeListService;

    /**
     * 列表
     */
    @RequestMapping("/list")
//    //@RequiresPermissions("generator:entertypelist:list")
    public R list(@RequestParam("key") String key,io.renren.modules.edu.utils.Query query){
//        PageUtils page = enterTypeListService.queryPage(params);

      PageUtils EnterTypeVoIPage = enterTypeListService.selectEnterTypeListPage(Query.getPage(query), key);

        return R.ok().put("page", EnterTypeVoIPage);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{typeId}")
//    //@RequiresPermissions("generator:entertypelist:info")
    public R info(@PathVariable("typeId") Long typeId){
		EnterTypeListEntity enterTypeList = enterTypeListService.getById(typeId);

        return R.ok().put("enterTypeList", enterTypeList);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
//    //@RequiresPermissions("generator:entertypelist:save")
    public R save(@RequestBody EnterTypeListEntity enterTypeList){
		enterTypeListService.save(enterTypeList);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
//    //@RequiresPermissions("generator:entertypelist:update")
    public R update(@RequestBody EnterTypeListEntity enterTypeList){
		enterTypeListService.updateById(enterTypeList);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
//    //@RequiresPermissions("generator:entertypelist:delete")
    public R delete(@RequestBody Long[] typeIds){
		enterTypeListService.removeByIds(Arrays.asList(typeIds));
        return R.ok();
    }

}
