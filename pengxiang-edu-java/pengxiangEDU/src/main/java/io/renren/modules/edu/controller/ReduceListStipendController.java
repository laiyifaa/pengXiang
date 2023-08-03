package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.EcoListForCheckVo;
import io.renren.modules.edu.vo.StipendListForCheckVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.ReduceListStipendEntity;
import io.renren.modules.edu.service.ReduceListStipendService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;


/**
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-12-05 15:54:19
 */
@RestController
@RequestMapping("generator/reduceliststipend")
public class ReduceListStipendController {
  @Autowired
  private ReduceListStipendService reduceListStipendService;

  /**
   * 列表
   */
  @RequestMapping("/list")
//  //@RequiresPermissions("generator:reduceliststipend:list")
  public R list(@RequestParam String difficultType,io.renren.modules.edu.utils.Query query) {
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    PageUtils page = reduceListStipendService.selectReduceListStipendPage(Query.getPage(query),difficultType,user.getAcademyId());
    return R.ok().put("page", page);
  }


  /**
   * 信息
   */
  @RequestMapping("/info/{id}")
//  //@RequiresPermissions("generator:reduceliststipend:info")
  public R info(@PathVariable("id") Integer id) {
    ReduceListStipendEntity reduceListStipend = reduceListStipendService.getById(id);

    return R.ok().put("reduceListStipend", reduceListStipend);
  }

  /**
   * 保存
   */
  @RequestMapping("/save")
//  //@RequiresPermissions("generator:reduceliststipend:save")
  public R save(@RequestBody ReduceListStipendEntity reduceListStipend) {
    int i = reduceListStipendService.saveReduceListStipend(reduceListStipend);
    if(i!=-1)return R.ok();
    else return R.error("保存减免标准出错");
  }

  /**
   * 修改
   */
  @RequestMapping("/update")
//  //@RequiresPermissions("generator:reduceliststipend:update")
  public R update(@RequestBody ReduceListStipendEntity reduceListStipend) {
    reduceListStipendService.updateById(reduceListStipend);

    return R.ok();
  }

  /**
   * 删除
   */
  @RequestMapping("/delete")
//  //@RequiresPermissions("generator:reduceliststipend:delete")
  public R delete(@RequestBody Integer[] ids) {
    reduceListStipendService.removeByIds(Arrays.asList(ids));

    return R.ok();
  }

  @GetMapping("/stipendList")
  public R getEcoList(@RequestParam("id")Long id){

    List<StipendListForCheckVo> ecoList = reduceListStipendService.getStipendListTempStuId(id);
    return R.ok().put("data",ecoList);

  }
  @GetMapping("/stipendListByAcademyId")
  public R getEcoListByAcademyId(@RequestParam("academyId")Long academyId){
    List<StipendListForCheckVo> stipendList = reduceListStipendService.getStipendListByAcademyId(academyId);
    return R.ok().put("data",stipendList);
  }

}
