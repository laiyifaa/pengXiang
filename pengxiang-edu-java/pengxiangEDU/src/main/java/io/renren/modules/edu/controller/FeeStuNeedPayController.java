/*
package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.FeeStuNeedPayEntity;
import io.renren.modules.edu.service.FeeStuNeedPayService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;


*/
/**
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-29 11:01:51
 *//*

@RestController
@RequestMapping("generator/feestuneedpay")
public class FeeStuNeedPayController {
  @Autowired
  private FeeStuNeedPayService feeStuNeedPayService;

  */
/**
   * 列表
   *//*

  @RequestMapping("/list")
  //@RequiresPermissions("generator:feestuneedpay:list")
  public R list(@RequestParam Map<String, Object> params) {
    PageUtils page = feeStuNeedPayService.queryPage(params);

    return R.ok().put("page", page);
  }


  */
/**
   * 信息
   *//*

  @RequestMapping("/info/{stuId}")
  //@RequiresPermissions("generator:feestuneedpay:info")
  public R info(@PathVariable("stuId") Long stuId) {
    FeeStuNeedPayEntity feeStuNeedPay = feeStuNeedPayService.getById(stuId);

    return R.ok().put("feeStuNeedPay", feeStuNeedPay);
  }

  */
/**
   * 保存
   *//*

  @RequestMapping("/save")
  //@RequiresPermissions("generator:feestuneedpay:save")
  public R save(@RequestBody FeeStuNeedPayEntity feeStuNeedPay) {
    feeStuNeedPayService.save(feeStuNeedPay);

    return R.ok();
  }

  */
/**
   * 修改
   *//*

  @RequestMapping("/update")
  //@RequiresPermissions("generator:feestuneedpay:update")
  public R update(@RequestBody FeeStuNeedPayEntity feeStuNeedPay) {
    feeStuNeedPayService.updateById(feeStuNeedPay);

    return R.ok();
  }

  */
/**
   * 删除
   *//*

  @RequestMapping("/delete")
  //@RequiresPermissions("generator:feestuneedpay:delete")
  public R delete(@RequestBody Long[] stuIds) {
    feeStuNeedPayService.removeByIds(Arrays.asList(stuIds));

    return R.ok();
  }

  @GetMapping("/generateNeedPayListsByDeptId")
  public R generateNeedPayListsByDeptId(@RequestParam("deptId")Long deptId,@RequestParam("type")Integer type){
    try{
      Map<String, List<StuBaseInfoEntity>> resultMap = feeStuNeedPayService.generateNeedPayListsByDeptId(deptId,type);
      return R.ok().put("data",resultMap).put("msg","ok");
    }catch (Exception e){
      e.printStackTrace();
      return R.ok().put("data",null).put("msg",e.getMessage());
    }
  }
}
*/
