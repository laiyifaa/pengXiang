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

import io.renren.modules.edu.entity.InemStuInternshipEntity;
import io.renren.modules.edu.service.InemStuInternshipService;
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
@RequestMapping("generator/inemstuinternship")
public class InemStuInternshipController {
    @Autowired
    private InemStuInternshipService inemStuInternshipService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    ////@RequiresPermissions("inemstuinternship:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = inemStuInternshipService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    ////@RequiresPermissions("inemstuinternship:info")
    public R info(@PathVariable("id") Integer id){
		InemStuInternshipEntity inemStuInternship = inemStuInternshipService.getById(id);

        return R.ok().put("inemStuInternship", inemStuInternship);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    ////@RequiresPermissions("inemstuinternship:save")
    public R save(@RequestBody InemStuInternshipEntity inemStuInternship){
		inemStuInternshipService.save(inemStuInternship);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    ////@RequiresPermissions("inemstuinternship:update")
    public R update(@RequestBody InemStuInternshipEntity inemStuInternship){
		inemStuInternshipService.updateById(inemStuInternship);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    ////@RequiresPermissions("inemstuinternship:delete")
    public R delete(@RequestBody Integer[] ids){
		inemStuInternshipService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
