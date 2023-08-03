package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.List;

import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.entity.ReduceListEcoEntity;
import io.renren.modules.edu.service.ReduceListEcoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;


/**
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
@RestController
@RequestMapping("generator/reducelisteco")
public class ReduceListEcoController {
  @Autowired
  private ReduceListEcoService reduceListEcoService;


//  @RequestMapping("/list")
//  // //@RequiresPermissions("generator:reducelisteco:list")
//  public R list(@RequestParam Map<String, Object> params) {
//    PageUtils page = reduceListEcoService.queryPage(params);
//    return R.ok().put("page", page);
//  }
  /**
   * 列表
   */
  @RequestMapping("/list")
  // //@RequiresPermissions("generator:reducelisteco:list")
  public R list(@RequestParam String difficultType,io.renren.modules.edu.utils.Query query) {
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    PageUtils page = reduceListEcoService.selectReduceListEcoPage(Query.getPage(query),difficultType,user.getAcademyId());
    return R.ok().put("page", page);
  }


  /**
   * 信息
   */
  @RequestMapping("/info/{id}")
  // //@RequiresPermissions("generator:reducelisteco:info")
  public R info(@PathVariable("id") Integer id) {
    ReduceListEcoEntity reduceListEco = reduceListEcoService.getById(id);

    return R.ok().put("reduceListEco", reduceListEco);
  }

  /**
   * 保存
   */
  @RequestMapping("/save")
  // //@RequiresPermissions("generator:reducelisteco:save")
  public R save(@RequestBody ReduceListEcoEntity reduceListEco) {
    int i = reduceListEcoService.saveReduceListEco(reduceListEco);
    if(i!=-1)return R.ok();
    else return R.error("免学费申请出错");
  }

  /**
   * 修改
   */
  @RequestMapping("/update")
  // //@RequiresPermissions("generator:reducelisteco:update")
  public R update(@RequestBody ReduceListEcoEntity reduceListEco) {
    reduceListEcoService.updateById(reduceListEco);
    return R.ok();
  }

  /**
   * 删除
   */
  @RequestMapping("/delete")
  // //@RequiresPermissions("generator:reducelisteco:delete")
  public R delete(@RequestBody Integer[] ids) {
    reduceListEcoService.removeByIds(Arrays.asList(ids));

    return R.ok();
  }

  @GetMapping("/ecoList")
  public R getEcoList(@RequestParam("id")Long id){

    List<EcoListForCheckVo> ecoList = reduceListEcoService.getEcoListTempStuId(id);
    return R.ok().put("data",ecoList);

  }

  @GetMapping("/ecoListByAcademyId")
  public R getEcoListByAcademyId(@RequestParam("academyId")Long academyId){
    List<EcoListForCheckVo> ecoList = reduceListEcoService.getEcoListByAcademyId(academyId);
    return R.ok().put("data",ecoList);
  }


}
