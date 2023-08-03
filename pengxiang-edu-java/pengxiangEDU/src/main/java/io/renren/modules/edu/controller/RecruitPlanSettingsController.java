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

import io.renren.modules.edu.entity.RecruitPlanSettingsEntity;
import io.renren.modules.edu.service.RecruitPlanSettingsService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@RestController
@RequestMapping("generator/recruitplansettings")
public class RecruitPlanSettingsController {
    @Autowired
    private RecruitPlanSettingsService recruitPlanSettingsService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("recruitplansettings:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = recruitPlanSettingsService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("recruitplansettings:info")
    public R info(@PathVariable("id") Long id){
		RecruitPlanSettingsEntity recruitPlanSettings = recruitPlanSettingsService.getById(id);

        return R.ok().put("recruitPlanSettings", recruitPlanSettings);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("recruitplansettings:save")
    public R save(@RequestBody RecruitPlanSettingsEntity recruitPlanSettings){
		recruitPlanSettingsService.save(recruitPlanSettings);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("recruitplansettings:update")
    public R update(@RequestBody RecruitPlanSettingsEntity recruitPlanSettings){
		recruitPlanSettingsService.updateById(recruitPlanSettings);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("recruitplansettings:delete")
    public R delete(@RequestBody Long[] ids){
		recruitPlanSettingsService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
