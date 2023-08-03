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

import io.renren.modules.edu.entity.RecruitAdmissionPaymentUselessEntity;
import io.renren.modules.edu.service.RecruitAdmissionPaymentUselessService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



*/
/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 *//*

@RestController
@RequestMapping("generator/recruitadmissionpaymentuseless")
public class RecruitAdmissionPaymentUselessController {
    @Autowired
    private RecruitAdmissionPaymentUselessService recruitAdmissionPaymentUselessService;

    */
/**
     * 列表
     *//*

    @RequestMapping("/list")
    //@RequiresPermissions("recruitadmissionpaymentuseless:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = recruitAdmissionPaymentUselessService.queryPage(params);

        return R.ok().put("page", page);
    }


    */
/**
     * 信息
     *//*

    @RequestMapping("/info/{id}")
    //@RequiresPermissions("recruitadmissionpaymentuseless:info")
    public R info(@PathVariable("id") Integer id){
		RecruitAdmissionPaymentUselessEntity recruitAdmissionPaymentUseless = recruitAdmissionPaymentUselessService.getById(id);

        return R.ok().put("recruitAdmissionPaymentUseless", recruitAdmissionPaymentUseless);
    }

    */
/**
     * 保存
     *//*

    @RequestMapping("/save")
    //@RequiresPermissions("recruitadmissionpaymentuseless:save")
    public R save(@RequestBody RecruitAdmissionPaymentUselessEntity recruitAdmissionPaymentUseless){
		recruitAdmissionPaymentUselessService.save(recruitAdmissionPaymentUseless);

        return R.ok();
    }

    */
/**
     * 修改
     *//*

    @RequestMapping("/update")
    //@RequiresPermissions("recruitadmissionpaymentuseless:update")
    public R update(@RequestBody RecruitAdmissionPaymentUselessEntity recruitAdmissionPaymentUseless){
		recruitAdmissionPaymentUselessService.updateById(recruitAdmissionPaymentUseless);

        return R.ok();
    }

    */
/**
     * 删除
     *//*

    @RequestMapping("/delete")
    //@RequiresPermissions("recruitadmissionpaymentuseless:delete")
    public R delete(@RequestBody Integer[] ids){
		recruitAdmissionPaymentUselessService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
*/
