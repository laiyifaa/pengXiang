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

import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import io.renren.modules.edu.service.InemEmployedStuRecordService;
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
@RequestMapping("generator/inememployedsturecord")
public class InemEmployedStuRecordController {
    @Autowired
    private InemEmployedStuRecordService inemEmployedStuRecordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("inememployedsturecord:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = inemEmployedStuRecordService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("inememployedsturecord:info")
    public R info(@PathVariable("id") Long id){
		InemEmployedStuRecordEntity inemEmployedStuRecord = inemEmployedStuRecordService.getById(id);

        return R.ok().put("inemEmployedStuRecord", inemEmployedStuRecord);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("inememployedsturecord:save")
    public R save(@RequestBody InemEmployedStuRecordEntity inemEmployedStuRecord){
		inemEmployedStuRecordService.save(inemEmployedStuRecord);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    ////@RequiresPermissions("inememployedsturecord:update")
    public R update(@RequestBody InemEmployedStuRecordEntity inemEmployedStuRecord){
		inemEmployedStuRecordService.updateById(inemEmployedStuRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("inememployedsturecord:delete")
    public R delete(@RequestBody Long[] ids){
		inemEmployedStuRecordService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
