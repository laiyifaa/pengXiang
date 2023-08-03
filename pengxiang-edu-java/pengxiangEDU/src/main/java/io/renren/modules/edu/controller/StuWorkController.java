package io.renren.modules.edu.controller;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import io.renren.modules.edu.entity.InemStuInternshipEntity;
import io.renren.modules.edu.service.InemEmployedStuRecordService;
import io.renren.modules.edu.service.InemStuInternshipService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuEmployedVo;
import io.renren.modules.edu.vo.StuInternshipVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;


/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@RestController
@RequestMapping("generator/stuwork")
public class StuWorkController {
    @Autowired
    private InemStuInternshipService inemStuInternshipService;
    @Autowired
    private InemEmployedStuRecordService inemEmployedStuRecordService;

    @Autowired
    private StuBaseInfoService stuBaseInfoService;
    @Autowired
    private SysDeptService sysDeptService;

    /**
     * 实习列表
     */
    @GetMapping("/internshipList")
//    //@RequiresPermissions("internshipList:list")
    public R internshipList(@RequestParam("key")String key,io.renren.modules.edu.utils.Query query){
        PageUtils page = inemStuInternshipService.internshipList(Query.getPage(query),key);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/internshipInfo/{id}")
//    //@RequiresPermissions("inemstuinternship:info")
    public R internshipInfo(@PathVariable("id") Long id){
        StuInternshipVo vo = inemStuInternshipService.getVoById(id);
        return R.ok().put("inemStuInternship",vo);

    }

  /**
   *
   * @param key
   * @param query
   * @return
   */
    @GetMapping("/employedList")
//    //@RequiresPermissions("employedList:list")
    public R employedList(@RequestParam("key")String key,io.renren.modules.edu.utils.Query query){
        PageUtils page = inemEmployedStuRecordService.employedList(Query.getPage(query),key);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @GetMapping("/employedInfo/{id}")
//    //@RequiresPermissions("inememployedsturecord:info")
    public R employedInfo(@PathVariable("id") Long id){
        InemEmployedStuRecordEntity inemEmployedStuRecord = inemEmployedStuRecordService.getById(id);
        StuEmployedVo stuEmployedVo = inemEmployedStuRecordService.getStuEmployedVoById(id);
        return R.ok().put("inemEmployedStuRecord",stuEmployedVo);
    }



    /**
     * 保存
     */
    @RequestMapping("/save")
//    //@RequiresPermissions("inemstuinternship:save")
    public R save(@RequestBody InemStuInternshipEntity inemStuInternship){
		inemStuInternshipService.save(inemStuInternship);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
//    //@RequiresPermissions("inemstuinternship:update")
    public R update(@RequestBody InemStuInternshipEntity inemStuInternship){
		inemStuInternshipService.updateById(inemStuInternship);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("inemstuinternship:delete")
    public R delete(@RequestBody Integer[] ids){
		inemStuInternshipService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
