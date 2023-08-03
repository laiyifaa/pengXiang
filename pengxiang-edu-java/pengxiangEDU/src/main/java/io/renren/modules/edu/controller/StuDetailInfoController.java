package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.edu.entity.StuDetailInfoEntity;
import io.renren.modules.edu.service.StuDetailInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@RestController
@RequestMapping("generator/studetailinfo")
public class StuDetailInfoController {
    @Autowired
    private StuDetailInfoService stuDetailInfoService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("studetailinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = stuDetailInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{stuId}")
    //@RequiresPermissions("studetailinfo:info")
    public R info(@PathVariable("stuId") Long stuId){
		StuDetailInfoEntity stuDetailInfo = stuDetailInfoService.getById(stuId);

        return R.ok().put("stuDetailInfo", stuDetailInfo);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("studetailinfo:save")
    public R save(@RequestBody StuDetailInfoEntity stuDetailInfo){
		stuDetailInfoService.save(stuDetailInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("studetailinfo:update")
    public R update(@RequestBody StuDetailInfoEntity stuDetailInfo){
		stuDetailInfoService.updateById(stuDetailInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("studetailinfo:delete")
    public R delete(@RequestBody Long[] stuIds){
		stuDetailInfoService.removeByIds(Arrays.asList(stuIds));

        return R.ok();
    }

}
