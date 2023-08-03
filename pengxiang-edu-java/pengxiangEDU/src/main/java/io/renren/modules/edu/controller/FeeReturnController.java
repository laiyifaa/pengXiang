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
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.ReturnFeeDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.entity.FeeArrearageEntity;
import io.renren.modules.edu.entity.FeeSchoolSundryEntity;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.excel.FeeReturnListener;
import io.renren.modules.edu.excel.FeeSchoolSundryListener;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.FeeReturnEntity;
import io.renren.modules.edu.service.FeeReturnService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


/**
 * 学生减免退费管理表
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@RestController
@RequestMapping("generator/feereturn")
public class FeeReturnController {
    @Resource
    FeeReturnService feeReturnService;
    @Autowired
    RedisUtils redis;
//    @RequestMapping("/getList")
//    public R getList(){
//       return R.ok().put("list",feeReturnService.getlist()) ;
//    }
//    @RequestMapping("/update")
//    public R update(@RequestBody FeeReturnEntity feeReturn){
//
//        return R.ok().put("result",feeReturnService.update(feeReturn));
//    }

    @PostMapping("/upload")
    public R upload(MultipartFile file){
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    FeeReturnExportVo.class,
                    new FeeReturnListener(feeReturnService)).sheet().doRead();
        }catch (IOException e){
            return R.error(e.getMessage());
        }catch (EmptyDataException ee){
            return R.error(ee.getMessage());
        }
        return R.ok();
    }
    @RequestMapping("/export")
    public void export(@RequestBody Long[] ids, HttpServletResponse response){
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("returnFeeList"+user.getUserId());
        List<ReturnFeeDto> collect = JSON.parseArray(jsonStr, ReturnFeeDto.class);
        List<Long> idList = new ArrayList<>(Arrays.asList(ids));
        if(idList.size() == 0)throw new RuntimeException("未选择需要导出的学生数据，请返回进行选择");
        List<ReturnFeeDto> collect1 = collect.stream().filter(item -> idList.contains(item.getId())).collect(Collectors.toList());

        List<returnFeeExportVo> list = new ArrayList<>();
        for (ReturnFeeDto dto : collect1) {
            returnFeeExportVo exportVo = new returnFeeExportVo();
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
            EasyExcel.write(outputStream, returnFeeExportVo.class)
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
    public void export(HttpServletResponse response){
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("returnFeeList"+user.getUserId());
        List<ReturnFeeDto> collect = JSON.parseArray(jsonStr, ReturnFeeDto.class);
        List<returnFeeExportVo> list = new ArrayList<>();
        for (ReturnFeeDto dto : collect) {
            returnFeeExportVo exportVo = new returnFeeExportVo();
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
            EasyExcel.write(outputStream, returnFeeExportVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);

            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            // 如果需要，处理异常
        }
    }

    @PostMapping("/search")
    // @RequiresPermissions("generator:feearrearage:list")
    public R list(@RequestBody SearchConditionVo searchConditionVo){
        PageUtils page = feeReturnService.queryPageInConditions(searchConditionVo);

        return R.ok().put("page", page);
    }

    @RequestMapping("/list")
    public R list(
                  @Nullable Long deptId,
                  Query query
                  ) {
        PageUtils page = feeReturnService.selectStuReturnFeePage(Query.getPage(query),deptId);
        return R.ok().put("page", page);
    }

    /**
     * 单个信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        //FeeArrearageEntity feeArrearage = feeArrearageService.getById(id);

        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("returnFeeList"+user.getUserId());
        List<ReturnFeeDto> collect = JSON.parseArray(jsonStr, ReturnFeeDto.class);

        for (ReturnFeeDto returnFeeDto : collect) {
            if (returnFeeDto.getId().equals(id)){
                return R.ok().put("returnFeeDto", returnFeeDto);
            }
        }
        return R.error("联系管理员！");
    }

    @RequestMapping("/infoOne/{id}")
    public R infoOne(@PathVariable("id") Long id){
        FeeReturnEntity feeReturnEntity = feeReturnService.getById(id);

        return R.ok().put("feeReturn", feeReturnEntity);
    }

    @RequestMapping("/update")
    public R update(@RequestBody FeeReturnEntity feeReturnEntity){
        feeReturnService.updateById(feeReturnEntity);

        return R.ok();
    }

    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        for (Long id : ids) {
            FeeReturnEntity byId = feeReturnService.getById(id);
            byId.setIsDeleted(true);
            feeReturnService.updateById(byId);
        }
        //feeSchoolSundryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    @RequestMapping("/save")
    public R save(@RequestBody ReturnFeeDto dto) {
        /**
         * 新增和修改一年的学杂费信息
         */
        Integer res = feeReturnService.saveFeeReturnSundry(dto);
        if (res == 1) return R.ok();
        else if (res == -1) return R.error("该学生" + dto.getReturnSchoolYear() + "年份的学杂费信息已存在");
        else if (res == -2) return R.error("存在多条/不存在学生记录，请核实学生信息");
        else if (res == -3) return R.error(dto.getReturnSchoolYear() + "年份与当前学年差距过大，建议修改年份");
        else return R.error("unknown error");
    }
}
