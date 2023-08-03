package io.renren.modules.edu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.SearchConditionVo;
import io.renren.modules.edu.vo.qMoneyExportVo;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.FeeArrearageEntity;
import io.renren.modules.edu.service.FeeArrearageService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 欠费明细表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-24 11:26:23
 */
@RestController
@RequestMapping("generator/feearrearage")
public class FeeArrearageController {
    @Autowired
    private FeeArrearageService feeArrearageService;
    @Autowired
    RedisUtils redis;
    /**
     * 列表
     */
    @RequestMapping("/list")
   // @RequiresPermissions("generator:feearrearage:list")
    public R list(HttpServletRequest request,@RequestParam Map<String, Object> params){
        PageUtils page = feeArrearageService.queryPage(request,params);
        return R.ok().put("page", page);
    }


    /**
     * 搜索
     */
    @PostMapping("/search")
    // @RequiresPermissions("generator:feearrearage:list")
    public R list(@RequestBody SearchConditionVo searchConditionVo){
        PageUtils page = feeArrearageService.queryPageInConditions(searchConditionVo);

        return R.ok().put("page", page);
    }

    //查询当前层级和下一层的dept
    @GetMapping("/getListByPid/{pid}")
    public R getListByPid(@PathVariable Long pid, Query query) {
        PageUtils pageUtils = feeArrearageService.getListByPid(Query.getPage(query), pid);
        return R.ok().put("page", pageUtils);
    }

    /**
     * 基础信息
     */
    @RequestMapping("/info/{id}")
  //  @RequiresPermissions("generator:feearrearage:info")
    public R info(@PathVariable("id") Long id){
		//FeeArrearageEntity feeArrearage = feeArrearageService.getById(id);

        qMoneyAndInfoListDto getone = feeArrearageService.getoneInfo(id);
        return R.ok().put("feeArrearage", getone);
    }

    /**
     * 欠费信息
     */
    @RequestMapping("/qMoneyinfo/{id}")
    //  @RequiresPermissions("generator:feearrearage:info")
    public R qMoneyinfo(@PathVariable("id") Long id){

        LambdaQueryWrapper<FeeArrearageEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(FeeArrearageEntity::getId,id);
        FeeArrearageEntity getone = feeArrearageService.getOne(queryWrapper);
        List<FeeArrearageEntity> list = feeArrearageService.getOneQmoneyListDto(getone.getStuId());

        return R.ok().put("qMoneyinfo", list);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
  //  @RequiresPermissions("generator:feearrearage:save")
    public R save(@RequestBody FeeArrearageEntity feeArrearage){
		feeArrearageService.save(feeArrearage);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
   // @RequiresPermissions("generator:feearrearage:update")
    public R update(@RequestBody FeeArrearageEntity feeArrearage){
		feeArrearageService.updateById(feeArrearage);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
  //  @RequiresPermissions("generator:feearrearage:delete")
    public R delete(@RequestBody Long[] ids){
        for (Long id : ids) {
            FeeArrearageEntity byId = feeArrearageService.getById(id);
            byId.setIsDeleted(true);
            feeArrearageService.updateById(byId);
        }

        return R.ok();
    }

    @RequestMapping("/export")
    public void export(@RequestBody Long[] ids, HttpServletResponse response) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = redis.get("qMoneyList"+user.getUserId());
        List<qMoneyAndInfoListDto> collect = JSON.parseArray(jsonStr, qMoneyAndInfoListDto.class);
        List<Long> idList = new ArrayList<>(Arrays.asList(ids));
        List<qMoneyAndInfoListDto> collect1 = collect.stream().filter(item -> idList.contains(item.getId())).collect(Collectors.toList());

        List<qMoneyExportVo> list = new ArrayList<>();
        for (qMoneyAndInfoListDto dto : collect1) {
            qMoneyExportVo exportVo = new qMoneyExportVo();
            BeanUtils.copyProperties(dto, exportVo);
            list.add(exportVo);
        }

        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "text";
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");

            // 创建新的OutputStream用于写入Excel数据
            ServletOutputStream outputStream = response.getOutputStream();

            // 使用outputStream写入Excel数据
            EasyExcel.write(outputStream, qMoneyExportVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);

            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            // 如果需要，处理异常
        }
    }

    @RequestMapping("/exportInAll")
    public void export(HttpServletResponse response) {
        String jsonStr = redis.get("qMoneyList");
        List<qMoneyAndInfoListDto> collect = JSON.parseArray(jsonStr, qMoneyAndInfoListDto.class);

        List<qMoneyExportVo> list = new ArrayList<>();
        for (qMoneyAndInfoListDto dto : collect) {
            qMoneyExportVo exportVo = new qMoneyExportVo();
            BeanUtils.copyProperties(dto, exportVo);
            list.add(exportVo);
        }

        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "text";
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");

            // 创建新的OutputStream用于写入Excel数据
            ServletOutputStream outputStream = response.getOutputStream();

            // 使用outputStream写入Excel数据
            EasyExcel.write(outputStream, qMoneyExportVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);

            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            // 如果需要，处理异常
        }
    }
}
