package io.renren.modules.edu.controller;

/**
 * @author augus
 * @create 2022-11-28-11:30
 */

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.ClassVo;
import io.renren.modules.edu.vo.StuClassSaveVo;
import io.renren.modules.edu.vo.StuClassVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;


/**
 * @ClassName:StuClassInfoController
 * @Description:TODO
 * @author Augus
 * @date 2022/11/28 11:30
 * @Version 1.0
 **/
@RestController
@RequestMapping("generator/stuclassinfo")
public class StuClassInfoController {

    @Autowired
    private StuBaseInfoService stuBaseInfoService;

    @Autowired
    private SysDeptService sysDeptService;

    /**
     * 根据学号查可选班级列表
     * @param schoolNumber
     * @return
     */
    @RequestMapping("/getClassListBySchoolNumber/{schoolNumber}")
    public R getClassList(@PathVariable("schoolNumber") String schoolNumber){
        if(schoolNumber != null){
            StuBaseInfoEntity stuBaseInfoEntity = stuBaseInfoService.getBySchoolNumber(schoolNumber);
            if(stuBaseInfoEntity != null){
                List<ClassVo> classList = sysDeptService.getClassListByGradeId(stuBaseInfoEntity.getGradeId());
                return R.ok().put("classList", classList);
            }
            return R.error("没有这个学号的学生");
        }
        return R.error("请输入学号");
    }

    /**
     * 可分配班级的学生列表
     * 流程状态为200/300/400的学生
     */
    @RequestMapping("/list")
    //@RequiresPermissions("stuclassinfo:list")
    public R page(StuClassVo stuClassVo, Query query,@RequestParam("key") String key){
        System.out.println(key);
        PageUtils stuClassVoIPage = stuBaseInfoService.selectStuClassPage(Query.getPage(query), stuClassVo,key);
        List<StuClassVo> list = (List<StuClassVo>) stuClassVoIPage.getList();
        List<StuClassSaveVo> result = list.stream().map(item -> {
            StuClassSaveVo stuClassSaveVo = new StuClassSaveVo();
            BeanUtils.copyProperties(item, stuClassSaveVo);
            stuClassSaveVo.setMajorInfo(item.getMajorName());
            stuClassSaveVo.setClassInfo(item.getClassName());
            stuClassSaveVo.setGradeInfo(item.getGradeName());
            stuClassSaveVo.setAcademyInfo(item.getAcademyName());
            return stuClassSaveVo;
        }).collect(Collectors.toList());
        stuClassVoIPage.setList(result);
        return R.ok().put("page", stuClassVoIPage);
    }
//    /**
//     * 根据deptid 和 班级分配状态
//     */
//    @RequestMapping("/listByCondition")
//    //@RequiresPermissions("stuclassinfo:list")
//    public R listByCondition(StuClassVo stuClassVo, Query query){
//        PageUtils stuClassVoIPage = stuBaseInfoService.selectStuClassPage(Query.getPage(query), stuClassVo);
//        return R.ok().put("page", stuClassVoIPage);
//    }

    /**
     * 信息
     */
    @RequestMapping("/info/{stuId}")
    //@RequiresPermissions("stuclassinfo:info")
    public R info(@PathVariable("stuId") Long stuId){
        StuBaseInfoEntity stuBaseInfo = stuBaseInfoService.getById(stuId);
        StuClassVo stuClassInfo = sysDeptService.getStuClassInfoByClassId(stuBaseInfo.getClassId());
        stuClassInfo.setStuId(stuId);
        stuClassInfo.setSchoolNumber(stuBaseInfo.getSchoolNumber());
        stuClassInfo.setStuName(stuBaseInfo.getStuName());
        return R.ok().put("stuClassInfo", stuClassInfo);
    }

    /**
     * 分配班级
     *//*
    @RequestMapping("/save")
    //@RequiresPermissions("stuclassinfo:save")
    public R save(@RequestBody StuBaseInfoEntity stuBaseInfo){
        String schoolNumber = stuBaseInfo.getSchoolNumber();
        StuBaseInfoEntity baseInfoEntity = stuBaseInfoService.getBySchoolNumber(schoolNumber);
        if(baseInfoEntity.getEntranceStatus() != 200){
            return R.error();
        }
        stuBaseInfoService.bindClass(stuBaseInfo);
        return R.ok();
    }
*/

 /*   *//**
     * 修改
     *//*
    @RequestMapping("/update")
    //@RequiresPermissions("stuclassinfo:update")
    public R update(@RequestBody StuBaseInfoEntity stuBaseInfo){
        stuBaseInfoService.updateClass(stuBaseInfo);
        return R.ok();
    }*/

    /**
     * 删除
     */
 /*   @RequestMapping("/delete")
    //@RequiresPermissions("stuclassinfo:delete")
    public R delete(@RequestBody Long[] stuIds){
//        stuBaseInfoService.removeByIds(Arrays.asList(stuIds));
        stuBaseInfoService.unbundlingClass(Arrays.asList(stuIds));
        return R.ok();
    }*/
}
