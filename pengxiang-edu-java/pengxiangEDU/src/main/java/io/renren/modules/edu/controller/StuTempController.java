package io.renren.modules.edu.controller;

import java.io.IOException;
import java.util.*;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import io.renren.modules.edu.entity.StuTempEntity;
import io.renren.modules.edu.entity.constant.CLASS_TYPE;
import io.renren.modules.edu.entity.constant.STUTEMP_STATUS;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.excel.StuTempInfoListener;
import io.renren.modules.edu.service.StuTempService;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.StuTempVo;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;


import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


/**
 * 招生临时信息
 *
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2023-07-20 16:49:26
 */
@RestController
@RequestMapping("stu/temp")
public class StuTempController {
    @Autowired
    private StuTempService stuTempService;

    @PostMapping("/upload")
    public R upload( @RequestBody MultipartFile file){
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    StuTempVo.class,
                    new StuTempInfoListener(stuTempService)).sheet().doRead();
        }catch (EmptyDataException ee){
            return R.error(ee.getMessage());
        }catch (IOException e){
            e.printStackTrace();
            return R.error(e.getMessage());
        }catch (RuntimeException re){
            re.printStackTrace();
            return R.error(re.getMessage());
        }
        return R.ok();
    }


    @GetMapping("/export")
    public void export(HttpServletResponse response,
                       @Nullable Query query,
                       @Nullable @RequestParam("deptId")Long deptId,
                       @Nullable  StuTempEntity record,
                       @Nullable @RequestParam("isAll") Boolean isAll,
                       @Nullable @RequestParam("classTypeName") String classTypeName,
                       @Nullable @RequestParam("statusName") String statusName){
        try {
            if(null != classTypeName && CLASS_TYPE.isContain(classTypeName)){
                record.setClassType(CLASS_TYPE.getValue(classTypeName));
            }
            List<StuTempVo> list = null;
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "stuTempExport";

            if(null != statusName && STUTEMP_STATUS.isContain(statusName)){
                record.setStatus(STUTEMP_STATUS.getValue(statusName));
            }
            response.setHeader("Content-disposition","attachment;filename=" + fileName +".xlsx");
            if(isAll){
                list = stuTempService.queryExport(null,null,null);
            }else {
                list = stuTempService.queryExport(query, record, deptId);
            }
            EasyExcel.write(response.getOutputStream()).head(StuTempVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("考生列表")
                    .doWrite(list);

        }catch (IOException e){

        }
    }


    /**
     * 列表
     */
    @GetMapping("/list")
    //@RequiresPermissions("generator:stutemp:list")
    public R list(Query query,
                  @Nullable @RequestParam("deptId")Long deptId,
                  @Nullable  StuTempEntity record,
                  @Nullable @RequestParam("classTypeName") String classTypeName,
                  @Nullable @RequestParam("statusName") String statusName){
        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        if(null == deptId || deptId < 0){
            Long academyId = sysUser.getAcademyId();
            deptId = academyId == -1?null:academyId;
        }
        if(null != classTypeName && CLASS_TYPE.isContain(classTypeName)){
            record.setClassType(CLASS_TYPE.getValue(classTypeName));
        }
        if(null != statusName && STUTEMP_STATUS.isContain(statusName)){
            record.setStatus(STUTEMP_STATUS.getValue(statusName));
        }
        PageUtils page = stuTempService.queryPage(query, record,deptId);
        return R.ok().put("page", page);
    }
    /**
     * 信息
     */
    @GetMapping("/info")
    //@RequiresPermissions("generator:stutemp:info")
    public R info(@RequestParam("id") Long id){
        if(null == id || id< 0)
            return R.ok();
        StuTempVo stuTemp = stuTempService.getVoById(id);
        return R.ok().put("info", stuTemp);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    //@RequiresPermissions("generator:stutemp:save")
    public R save(@RequestBody StuTempVo stuTemp){
        try {
            stuTempService.saveTemp(stuTemp);
        }catch (Exception e){
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    //@RequiresPermissions("generator:stutemp:delete")
    public R delete(@RequestBody Long[] ids){
        if(null != ids && 0 != ids.length){
            stuTempService.deleteByIds( ids);
        }
        return R.ok();
    }

    /**
     * 通过
     */
    @PostMapping("/pass")
    //@RequiresPermissions("generator:stutemp:delete")
    public R pass(@RequestBody Long[] ids){
        try {
            stuTempService.pass(ids);
        }catch (Exception e){
            return R.error(e.getMessage());
        }
        return R.ok();
    }
}
