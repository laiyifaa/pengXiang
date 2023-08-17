package io.renren.modules.edu.controller;

import java.io.IOException;
import java.util.List;


import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import io.renren.modules.edu.entity.constant.CLASS_TYPE;
import io.renren.modules.edu.entity.constant.CURRENT_STATUS;
import io.renren.modules.edu.entity.constant.RESIDENCE_TYPE;
import io.renren.modules.edu.entity.constant.SCHOOL_ROLL_STATUS;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.excel.StuBaseInfoListener;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


/**
 * @author ischen
 * @email
 * @date 2023-07-20 09:55:50
 */
@RestController
@RequestMapping("stu/baseInfo")
public class StuBaseInfoController {
    @Autowired
    private StuBaseInfoService stuBaseInfoService;


    @PostMapping("/upload")
    public R upload(MultipartFile file) {
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    StuBaseInfoEntity.class,
                    new StuBaseInfoListener(stuBaseInfoService)).sheet().doRead();
        } catch (IOException e) {
            return R.error(e.getMessage());
        } catch (EmptyDataException ee) {
            return R.error(ee.getMessage());
        }catch (RuntimeException re){
            return R.error(re.getMessage());
        }
        return R.ok();
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response,
                       @Nullable StuBaseInfoEntity record,
                       @Nullable @RequestParam("deptId") Long deptId,
                       @Nullable @RequestParam("classTypeName") String classTypeName,
                       @Nullable Query query,
                       @Nullable @RequestParam("isAll") Boolean isAll) {
        List<StuBaseInfoEntity> list = null;
        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "stuExport";
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            setListOrExport(record,classTypeName);
            if (isAll) {
                list = stuBaseInfoService.queryExport(null, null, null);
            } else {
                list = stuBaseInfoService.queryExport(query, record, deptId);
            }
            EasyExcel.write(response.getOutputStream()).head(StuBaseInfoEntity.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);
        } catch (IOException e) {

        }
    }

    /**
     * 列表
     */
    @GetMapping("/list")
    ////@RequiresPermissions("stubaseinfo:list")
    public R list(@Nullable StuBaseInfoEntity record,
                  @Nullable @RequestParam("deptId") Long deptId,
                  @Nullable @RequestParam("classTypeName") String classTypeName,
                  Query query) {
        /**
         * service method add SysUser used to check deptId
         */
        setListOrExport(record,classTypeName);
        PageUtils page = stuBaseInfoService.selectStuBaseInfo(Query.getPage(query), record, deptId);
        return R.ok().put("page", page);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    ////@RequiresPermissions("stubaseinfo:save")
    public R save(@RequestBody StuBaseInfoEntity stuBaseInfo) {
        try {
            stuBaseInfoService.saveBaseInfo(stuBaseInfo);
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    @GetMapping("/detail")
    public R detail(@RequestParam("id") Long id) {
        if (null == id || id <= 0)
            return R.error();
        StuDetailVo detail = stuBaseInfoService.detailById(id);
        return R.ok().put("detail", detail);
    }

    @GetMapping("/info")
    public R base(@RequestParam("id") Long id) {
        if (null == id || id <= 0)
            return R.error();
        try {
            StuBaseInfoEntity baseInfo = stuBaseInfoService.getBaseInfoById(id);
            return R.ok().put("baseInfo", baseInfo);
        } catch (Exception e) {
            return R.error();
        }

    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    ////@RequiresPermissions("stubaseinfo:delete")
    public R delete(@RequestBody Long[] ids) {
        if (null != ids && 0 != ids.length) {
            stuBaseInfoService.deleteByIds(ids);
        }
        return R.ok();
    }
    private void setListOrExport(StuBaseInfoEntity record,String classTypeName){
        if (null != classTypeName && CLASS_TYPE.isContain(classTypeName)) {
            record.setClassType(CLASS_TYPE.getValue(classTypeName));
        }
        if(null != record.getCurrentStatusName() && CURRENT_STATUS.isContain(record.getCurrentStatusName())){
            record.setCurrentStatus(CURRENT_STATUS.getValue(record.getCurrentStatusName()));
        }
        if(null != record.getResidenceTypeName() && RESIDENCE_TYPE.isContain(record.getResidenceTypeName())){
            record.setResidenceType(RESIDENCE_TYPE.getValue(record.getResidenceTypeName()));
        }
        if(null != record.getSchoolRollStatusName() && SCHOOL_ROLL_STATUS.isContain(record.getSchoolRollStatusName())){
            record.setSchoolRollStatus(SCHOOL_ROLL_STATUS.getValue(record.getSchoolRollStatusName()));
        }
    }
}
