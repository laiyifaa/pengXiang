package io.renren.modules.edu.controller;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.common.utils.Constant;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
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
    @Autowired
    private SysUserService sysUserService;

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
        sysDeptService.updateDept(sysDept);

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
        List<Long> deptIdList = sysUserService.queryDeptIdList(user.getUserId());
        if(deptIdList != null && deptIdList.size() > 0 && user.getUserId() != Constant.SUPER_ADMIN){
            screenDeptTreeListVo(deptIdList,treeListVos);
        }
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
        List<DeptTreeListVo> voList = new LinkedList<>();
        Map<Long,DeptTreeListVo> deptVoMap = new HashMap<>(deptList.size());
        for(SysDeptEntity deptEntity : deptList){
            DeptTreeListVo vo = new DeptTreeListVo();
            vo.setId(deptEntity.getDeptId());
            vo.setLabel(deptEntity.getName());
            vo.setPid(deptEntity.getPid());
            vo.setValue(vo.getId());
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

    private void screenDeptTreeListVo(  List<Long> deptIdList,List<DeptTreeListVo> treeListVos){
        Set<Long> deptIdSet = new LinkedHashSet<>(deptIdList);
        for(int i = 0; i < treeListVos.size();++i){
            //院校
            DeptTreeListVo firstVo = treeListVos.get(i);
            List<DeptTreeListVo> secondList = firstVo.getChildren();
            if(null == secondList || secondList.size() == 0)
                continue;
            Iterator<DeptTreeListVo> secondIterator = secondList.iterator();
            while (secondIterator.hasNext()){
                //年级
                DeptTreeListVo secondVo = secondIterator.next();
                List<DeptTreeListVo> thirdList = secondVo.getChildren();
                if(null == thirdList || thirdList.size() == 0){
                    secondIterator.remove();
                    continue;
                }
                Iterator<DeptTreeListVo> thirdIterator = thirdList.iterator();
                while (thirdIterator.hasNext()){
                    //专业
                    DeptTreeListVo thirdVo = thirdIterator.next();
                    List<DeptTreeListVo> voList = thirdVo.getChildren();
                    if(null == voList || voList.size() == 0){
                        thirdIterator.remove();
                        continue;
                    }
                    Iterator<DeptTreeListVo> voIterator = voList.iterator();
                    while (voIterator.hasNext()){
                        DeptTreeListVo vo = voIterator.next();
                        if(!deptIdSet.contains(vo.getId())){
                            voIterator.remove();
                        }
                    }
                    if(thirdVo.getChildren() == null || thirdVo.getChildren().size() == 0){
                        thirdIterator.remove();
                    }
                }
                if(secondVo.getChildren() == null || secondVo.getChildren().size() == 0){
                    secondIterator.remove();
                }
            }

        }
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


}
