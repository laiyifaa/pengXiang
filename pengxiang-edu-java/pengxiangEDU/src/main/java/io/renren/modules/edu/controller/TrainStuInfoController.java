/*
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

import io.renren.modules.edu.entity.TrainStuInfoEntity;
import io.renren.modules.edu.service.TrainStuInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



*/
/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 *//*

@RestController
@RequestMapping("generator/trainstuinfo")
public class TrainStuInfoController {
    @Autowired
    private TrainStuInfoService trainStuInfoService;

    */
/**
     * 列表
     *//*

    @RequestMapping("/list")
    //@RequiresPermissions("trainstuinfo:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = trainStuInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    */
/**
     * 信息
     *//*

    @RequestMapping("/info/{id}")
    //@RequiresPermissions("trainstuinfo:info")
    public R info(@PathVariable("id") Long id){
		TrainStuInfoEntity trainStuInfo = trainStuInfoService.getById(id);

        return R.ok().put("trainStuInfo", trainStuInfo);
    }

    */
/**
     * 保存
     *//*

    @RequestMapping("/save")
    //@RequiresPermissions("trainstuinfo:save")
    public R save(@RequestBody TrainStuInfoEntity trainStuInfo){
		trainStuInfoService.save(trainStuInfo);

        return R.ok();
    }

    */
/**
     * 修改
     *//*

    @RequestMapping("/update")
    //@RequiresPermissions("trainstuinfo:update")
    public R update(@RequestBody TrainStuInfoEntity trainStuInfo){
		trainStuInfoService.updateById(trainStuInfo);

        return R.ok();
    }

    */
/**
     * 删除
     *//*

    @RequestMapping("/delete")
    //@RequiresPermissions("trainstuinfo:delete")
    public R delete(@RequestBody Long[] ids){
		trainStuInfoService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
*/
