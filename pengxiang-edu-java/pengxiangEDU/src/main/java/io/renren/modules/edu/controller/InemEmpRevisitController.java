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

import io.renren.modules.edu.entity.InemEmpRevisitEntity;
import io.renren.modules.edu.service.InemEmpRevisitService;
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
@RequestMapping("generator/inememprevisit")
public class InemEmpRevisitController {
    @Autowired
    private InemEmpRevisitService inemEmpRevisitService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("inememprevisit:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = inemEmpRevisitService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{wa}")
    //@RequiresPermissions("inememprevisit:info")
    public R info(@PathVariable("wa") Long wa){
		InemEmpRevisitEntity inemEmpRevisit = inemEmpRevisitService.getById(wa);

        return R.ok().put("inemEmpRevisit", inemEmpRevisit);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("inememprevisit:save")
    public R save(@RequestBody InemEmpRevisitEntity inemEmpRevisit){
		inemEmpRevisitService.save(inemEmpRevisit);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("inememprevisit:update")
    public R update(@RequestBody InemEmpRevisitEntity inemEmpRevisit){
		inemEmpRevisitService.updateById(inemEmpRevisit);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("inememprevisit:delete")
    public R delete(@RequestBody Long[] was){
		inemEmpRevisitService.removeByIds(Arrays.asList(was));

        return R.ok();
    }

}
