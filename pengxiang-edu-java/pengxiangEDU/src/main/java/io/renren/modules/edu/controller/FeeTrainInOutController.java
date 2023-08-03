package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.entity.AcademyEntity;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.vo.FeeTrainInOutVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.FeeTrainInOutEntity;
import io.renren.modules.edu.service.FeeTrainInOutService;
import io.renren.common.utils.R;



/**
 * 培训费收支管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@RestController
@RequestMapping("generator/feetraininout")
public class FeeTrainInOutController {
    @Autowired
    private FeeTrainInOutService feeTrainInOutService;

    @Autowired
    private AcademyService academyService;
    /**
     * 列表
     */
    @GetMapping("/list")
//    //@RequiresPermissions("feetraininout:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = feeTrainInOutService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @GetMapping("/info/{id}")
//    //@RequiresPermissions("feetraininout:info")
    public R info(@PathVariable("id") Long id){
		FeeTrainInOutEntity feeTrainInOut = feeTrainInOutService.getById(id);
        FeeTrainInOutVo feeTrainInOutVo = new FeeTrainInOutVo();
        BeanUtils.copyProperties(feeTrainInOut,feeTrainInOutVo);
        AcademyEntity byId = academyService.getById(feeTrainInOut.getAcademyId());
        feeTrainInOutVo.setAcademyInfo(byId.getAcademyInfo());
        return R.ok().put("feeTrainInOut", feeTrainInOutVo);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
//    //@RequiresPermissions("feetraininout:save")
    public R save(@RequestBody FeeTrainInOutEntity feeTrainInOut){
		feeTrainInOutService.save(feeTrainInOut);

        return R.ok();
    }

    /**
     * 修改
     */
    @PostMapping("/update")
    //@RequiresPermissions("feetraininout:update")
    public R update(@RequestBody FeeTrainInOutEntity feeTrainInOut){
		feeTrainInOutService.updateById(feeTrainInOut);

        return R.ok();
    }

    /**
     * 删除
     */
    @GetMapping("/delete")
    //@RequiresPermissions("feetraininout:delete")
    public R delete(@RequestBody Long[] ids){
		feeTrainInOutService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
