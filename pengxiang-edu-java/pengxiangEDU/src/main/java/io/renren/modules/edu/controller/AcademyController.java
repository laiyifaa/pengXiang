package io.renren.modules.edu.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.vo.AcademySelectVo;
import io.renren.modules.edu.vo.SysDeptVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.AcademyEntity;
import io.renren.modules.edu.service.AcademyService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 *
 *
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2023-07-29 09:55:51
 */
@RestController
@RequestMapping("generator/academy")
public class AcademyController {
    @Autowired
    private AcademyService academyService;

    @Autowired
    private SysDeptService deptService;
    /**
     * 列表
     */
    @RequestMapping("list")
    //@RequiresPermissions("academy:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = academyService.queryPage(params);

        return R.ok().put("page", page);
    }

  @GetMapping("/academyList")
//  //@RequiresPermissions("academy:list")
  public R getAcademyList(){
    List<AcademyEntity> list = academyService.getAcademyList();
    List<AcademySelectVo> collect = list.stream().map(item -> {
      AcademySelectVo academyVo = new AcademySelectVo();
      academyVo.setValue(item.getAcademyId());
      academyVo.setLabel(item.getAcademyInfo());
      return academyVo;
    }).collect(Collectors.toList());
    return R.ok().put("data", collect);
  }


    /**
     * 信息
     */
    @RequestMapping("/info/{academyId}")
//    //@RequiresPermissions("academy:info")
    public R info(@PathVariable("academyId") Integer academyId){
		AcademyEntity academy = academyService.getById(academyId);
        return R.ok().put("academy", academy);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
//    //@RequiresPermissions("academy:save")
    public R save(@RequestBody AcademyEntity academy){
      int result = academyService.saveAcademy(academy);
      if(result==-1){
        return R.error("院校名重复，请核实");
      }else return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("academy:update")
    public R update(@RequestBody AcademyEntity academy){
//		academyService.updateById(academy);
      int result = academyService.updateAcademy(academy);
      if(result==-1)return R.error("未知错误");
      else return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
//    //@RequiresPermissions("academy:delete")
    public R delete(@RequestBody Integer[] academyIds){
        List<AcademyEntity> academyList = academyService.listByIds(Arrays.asList(academyIds));
        for(AcademyEntity academyEntity : academyList){
            List<SysDeptVo> deptList = deptService.listByKey(academyEntity.getAcademyInfo(), 0);
            List<Long> deptIdList = deptList.stream().map(SysDeptVo::getDeptId).collect(Collectors.toList());
            deptService.removeByIds(deptIdList);
        }
        academyService.removeByIds(Arrays.asList(academyIds));

        return R.ok();
    }

}
