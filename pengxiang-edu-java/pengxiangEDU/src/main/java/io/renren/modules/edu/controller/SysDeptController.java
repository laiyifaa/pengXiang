package io.renren.modules.edu.controller;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.utils.Methods;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;


/**
 * 部门
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@RestController
@RequestMapping("generator/sysdept")
public class SysDeptController {
    @Autowired
    private SysDeptService sysDeptService;

    /**
     * 列表
     */
//  @RequestMapping("/list")
//    //@RequiresPermissions("sysdept:list")
//  public R list(@RequestParam Map<String, Object> params) {
//    PageUtils page = sysDeptService.queryPage(params);
//
//    return R.ok().put("page", page);
//  }

    /**
     * 自定义分页
     */
    @RequestMapping("/list")
    public R page(String key, Query query) {
        IPage<SysDeptVo> sysDeptVoIPage = sysDeptService.selectSysDeptPage(Query.getPage(query), key);
        PageUtils pageUtils = new PageUtils(sysDeptVoIPage);
        return R.ok().put("page", pageUtils);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{deptId}")
//  //@RequiresPermissions("sysdept:info")
    public R info(@PathVariable("deptId") Long deptId) {
        SysDeptEntity sysDept = sysDeptService.getById(deptId);

        return R.ok().put("sysDept", sysDept);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
//  //@RequiresPermissions("sysdept:save")
    public R save(@RequestBody SysDeptEntity sysDept) {
        if(null == sysDept.getPid() || sysDept.getPid() <= 0){
            return R.error("上级部门不能为空");
        }
        if(StringUtils.isEmpty(sysDept.getName())){
            return R.error("部门名称不能为空");
        }
        sysDeptService.saveDept(sysDept);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
//  //@RequiresPermissions("sysdept:update")
    public R update(@RequestBody SysDeptEntity sysDept) {
        sysDeptService.updateById(sysDept);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
//  //@RequiresPermissions("sysdept:delete")
    public R delete(@RequestBody Long[] deptIds) {
        sysDeptService.removeByIds(Arrays.asList(deptIds));

        return R.ok();
    }

    @GetMapping("/getDeptTreeList")
    public R getDeptTreeList() {
        List<SysDeptEntity> deptList = sysDeptService.getDeptTreeList();
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        List<DeptTreeListVo> treeListVos = getVoListByPid(user.getAcademyId(), deptList);
/*        //如果不是超级管理员，最后查一次院校部门，作为根节点
        if (user.getAcademyId() != -1) {
            SysDeptEntity academy = sysDeptService.getBaseMapper().selectById(user.getAcademyId());
            DeptTreeListVo academyNode = new DeptTreeListVo();
            academyNode.setId(academy.getDeptId());
            academyNode.setLabel(academy.getName());
            academyNode.setChildren(treeListVos);
            List<DeptTreeListVo> withAcademyRoot= new ArrayList<>();
            withAcademyRoot.add(academyNode);
            return R.ok().put("data", withAcademyRoot);
        }*/
        return R.ok().put("data", treeListVos);
    }

    //只获取前三层
    @GetMapping("/getDeptTreeList3Level")
    public R getDeptTreeList3Level() {
        List<SysDeptEntity> deptList = sysDeptService.getDeptTreeList();
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        List<DeptTreeListVo> treeListVos = getVoListByPid3Level(user.getAcademyId(), deptList);

        return R.ok().put("data", treeListVos);
    }

    @GetMapping("/getParentDeptName/{pid}")
    public R getParentDeptName(@PathVariable Long pid) {
        String parentName = sysDeptService.getParentDeptName(pid);
        return R.ok().put("data", parentName);
    }

//  @GetMapping("/getDeptTreeListForCheck")
//  public R getDeptTreeListForCheck() {
//    List<SysDeptEntity> deptList = sysDeptService.getDeptTreeList();
//
//    List<DeptTreeListForCheckVo> forCheck = getForCheckVoListByPid(-1L, deptList);
//
//    return R.ok().put("data", forCheck);
//  }


//  @GetMapping("/getSubDeptsByPid/{pid}")
//  public R getSubDeptsByPid(@PathVariable Long pid) {
//    List<SysDeptEntity> deptList = sysDeptService.getDeptTreeList();
//    Set<SysDeptEntity> results = new HashSet<>();
//    getEntityListByPid(pid, deptList,results);
//    List<SysDeptEntity> collect = results.stream().sorted().collect(Collectors.toList());
//    List<SysDeptVo> sysDeptVos = Methods.fommatDeptEntityToVo(collect);
//    return R.ok().put("data",sysDeptVos);
//
//  }


    //查询当前层级和下一层的dept
    @GetMapping("/getSubDeptsByPid/{pid}")
    public R getSubDeptsByPid(@PathVariable Long pid, Query query) {
        PageUtils pageUtils = sysDeptService.getNextLevelDepts(Query.getPage(query), pid);
        return R.ok().put("page", pageUtils);
    }

    //查询下一层的dept
    @GetMapping("/getDeptsByPid")
    public R getDeptsByPid(@RequestParam("pid") Long pid) {
        List<MajorSelectVo> majorSelectVos = sysDeptService.getDeptsByPid(pid);
        return R.ok().put("data", majorSelectVos);
    }

    @GetMapping("/majorList")
    public R getMajorList(@RequestParam("id") Long tempStuId) {
        List<MajorSelectVo> vos = sysDeptService.getMajorListByTempStuId(tempStuId);
        return R.ok().put("data", vos);
    }

    @GetMapping("/academyList")
    public R getAcademyList() {
        List<AcademySelectVo> vos = sysDeptService.getAcademyList();
        return R.ok().put("data", vos);
    }

    @GetMapping("/getDeptById")
    public R getDeptById(Long id) {
        SysDeptEntity dept = sysDeptService.getOne(new QueryWrapper<SysDeptEntity>().eq("dept_id", id));
        return R.ok().put("data", dept);
    }

    private List<DeptTreeListVo> getVoListByPid(Long pid, List<SysDeptEntity> deptList) {
/*       List<DeptTreeListVo> voList = deptList.stream().filter(item -> item.getPid() == pid).map(item -> {
            DeptTreeListVo treeListVo = new DeptTreeListVo();
            treeListVo.setId(item.getDeptId());
            treeListVo.setLabel(item.getName());
            treeListVo.setChildren(getVoListByPid(item.getDeptId(), deptList));
            return treeListVo;
        }).collect(Collectors.toList());*/
        List<DeptTreeListVo> voList = new LinkedList<>();
        DeptTreeListVo curDept = null;
        Map<Long,DeptTreeListVo> deptVoMap = new HashMap<>(deptList.size());
        for(SysDeptEntity deptEntity : deptList){
            DeptTreeListVo vo = new DeptTreeListVo();
            vo.setId(deptEntity.getDeptId());
            vo.setLabel(deptEntity.getName());
            vo.setPid(deptEntity.getPid());
            deptVoMap.put(deptEntity.getDeptId(),vo);
        }
        if(pid != -1){
            voList.add(deptVoMap.get(pid));
        }
        for(SysDeptEntity deptEntity : deptList){
            DeptTreeListVo parentDeptVo = deptVoMap.get(deptEntity.getPid());
            DeptTreeListVo childDeptVo = deptVoMap.get(deptEntity.getDeptId());
            if(pid == -1 && pid.equals(childDeptVo.getPid()) ){
                voList.add(childDeptVo);
                continue;
            }
            if(null != parentDeptVo){
                if( null == parentDeptVo.getChildren()){
                    List<DeptTreeListVo> childList = new LinkedList<>();
                    parentDeptVo.setChildren(childList);
                    childList.add(childDeptVo);
                }else {
                    parentDeptVo.getChildren().add(childDeptVo);
                }
            }
        }
        return voList;
    }

    //只获取前三层
    private List<DeptTreeListVo> getVoListByPid3Level(Long pid, List<SysDeptEntity> deptList) {

        List<DeptTreeListVo> voList = deptList.stream().filter(item -> item.getPid() == pid).map(item -> {
            DeptTreeListVo treeListVo = new DeptTreeListVo();
            treeListVo.setId(item.getDeptId());
            treeListVo.setLabel(item.getName());
            if (item.getDeptType() != 2) {
                treeListVo.setChildren(getVoListByPid3Level(item.getDeptId(), deptList));
            }
            return treeListVo;
        }).collect(Collectors.toList());
        return voList;
    }

/*
    private Set<SysDeptEntity> getEntityListByPid(Long pid, List<SysDeptEntity> deptList, Set<SysDeptEntity> results) {

        List<SysDeptEntity> collect = deptList.stream().filter(item -> {
            if (item.getDeptId() == pid) results.add(item);
            return item.getPid() == pid;
        }).collect(Collectors.toList());
        for (SysDeptEntity item : collect) {
            getEntityListByPid(item.getDeptId(), deptList, results);
            results.add(item);
        }
        return results;

    }*/

   /* private List<DeptTreeListVo> getDeptTreeByPid(Long pid, Map<Long, List<SysDeptEntity>> map) {
        List<SysDeptEntity> deptEntityList = map.get(pid);
        List<DeptTreeListVo> result = deptEntityList.stream().map(item -> {
            DeptTreeListVo deptTreeListVo = new DeptTreeListVo();
            deptTreeListVo.setLabel(item.getName());
            deptTreeListVo.setId(item.getDeptId());
            deptTreeListVo.setChildren(getDeptTreeByPid(item.getDeptId(), map));
            return deptTreeListVo;
        }).collect(Collectors.toList());
        return result;
    }*/

}
