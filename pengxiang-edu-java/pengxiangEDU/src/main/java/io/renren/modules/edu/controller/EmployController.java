package io.renren.modules.edu.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import io.renren.common.utils.R;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.dto.StuEmployDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuEmployVistEntity;
import io.renren.modules.edu.excel.StuBaseInfoListener;
import io.renren.modules.edu.excel.StuEmployInfoListener;
import io.renren.modules.edu.service.*;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/stu")
public class EmployController {
    @Autowired
    private EmployService employService;
    @RequestMapping("/getEmployList")
    public R getEmployList(int pageNum,int pageSize){
        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;
        return  R.ok().put("listDto",employService.getStuListDto(pageNum,pageSize,academyId));
    }
    @RequestMapping("/getVisitList")
    public R getVisitList(){
        List<StuEmployVistEntity> visitList=employService.getVisitList();
        Map<String,List> map  = new HashMap<>(2);
        map.put("visitList",visitList);
        return R.ok().put("visitList",visitList);
    }
    @RequestMapping("/changeEmployDetail")
    public R subMitEmploy(@RequestBody StuEmployEntity stuEmployEntity){
       int result= employService.changeEmployHandle(stuEmployEntity);
       return R.ok().put("result",result);
    }
    @RequestMapping("/changeVisitDetail")
    public R subMitVisit(@RequestBody StuEmployVistEntity stuEmployVistEntity){
        return R.ok().put("result",employService.changeVisitHandle(stuEmployVistEntity));
    }
    @RequestMapping("/addVisitDetail")
    public R addVisitDetail(@RequestBody StuEmployVistEntity stuEmployVistEntity){
        return R.ok().put("result",employService.addVisitHandle(stuEmployVistEntity));
    }
    @RequestMapping("/upload")
    public R upload(@RequestBody MultipartFile file){
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    StuEmployEntity.class,
                    new StuEmployInfoListener(employService)).sheet().doRead();
        }catch (IOException e){
            return R.error(e.getMessage());
        }
        return R.ok();
    }
    @RequestMapping("/search")
    public R handleSearch(SearchDto searchDto) {
        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;

        return  R.ok().put("listDto",employService.search(searchDto,academyId));
    }
    @RequestMapping("/treeSearch")
    public R handlerTreeSearch(String id,String pageNum,String pageSize){
        return R.ok().put("listDto",employService.treeSearch(Integer.parseInt(id),Integer.parseInt(pageNum),Integer.parseInt(pageSize)));
    }
    @GetMapping("/export")
    public void export(HttpServletResponse response,SearchDto searchDto){

        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;

        List<StuEmployDto> list = null;
        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "stuEmployExport";
            response.setHeader("Content-disposition","attachment;filename=" + fileName +".xlsx");
                list = employService.queryExport(searchDto,academyId);
            EasyExcel.write(response.getOutputStream()).head(StuEmployDto.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);
        }catch (IOException e){

        }
    }
}
