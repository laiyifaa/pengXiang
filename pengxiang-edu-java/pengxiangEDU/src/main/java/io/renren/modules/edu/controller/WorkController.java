package io.renren.modules.edu.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import io.renren.common.utils.R;
import io.renren.modules.edu.dto.StuEmployDto;
import io.renren.modules.edu.dto.StuWorkDto;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuPracticeEntity;
import io.renren.modules.edu.excel.StuEmployInfoListener;
import io.renren.modules.edu.excel.StuPracticeListener;
import io.renren.modules.edu.service.impl.WorkServiceImpl;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/stuWork")
public class WorkController {
    @Autowired
    public WorkServiceImpl workService;
    @RequestMapping("/getList")
    public R getList(int pageNum,int pageSize){
        SysUserEntity sysUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;
       return R.ok().put("workDtos",workService.getList(pageNum,pageSize,academyId));
    }
    @RequestMapping("/getPractice")
    public R getPractice(){
        List<StuPracticeEntity> practiceEntities =workService.getPractice();
        return R.ok().put("prEntities",practiceEntities);
    }
    @RequestMapping("/changePractice")
    public R changePractice(@RequestBody StuPracticeEntity stuPracticeEntity){
        return R.ok().put("result",workService.changePractice(stuPracticeEntity));
    }
    @RequestMapping("/addPractice")
    public R addPractice(@RequestBody StuPracticeEntity stuPracticeEntity){
        return R.ok().put("result",workService.addPractice(stuPracticeEntity));
    }
    @RequestMapping("/treeSearch")
    public R handleTreeSearch(String id,String pageNum,String pageSize){
        SysUserEntity sysUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;
        return R.ok().put("workDtos",workService.handleTreeSearch(Integer.parseInt(id),Integer.parseInt(pageNum),Integer.parseInt(pageSize),academyId));
    }
    @RequestMapping("/search")
    public R search(SearchDto searchDto){
        SysUserEntity sysUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;
        return R.ok().put("workDtos",workService.search(searchDto,academyId));
    }

    @RequestMapping("/upload")
    public R upload(@RequestBody MultipartFile file){

        try {
            EasyExcel.read(
                    file.getInputStream(),
                    StuPracticeEntity.class,
                    new StuPracticeListener(workService)).sheet().doRead();
        }catch (IOException e){
            return R.error(e.getMessage());
        }
        return R.ok();
    }



    @GetMapping("/export")
    public void export(HttpServletResponse response, SearchDto searchDto){

        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        Long academyId = sysUser.getAcademyId();
        academyId =  academyId == -1?null:academyId;
        List<StuWorkDto> list = null;
        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "stuWorkExport";
            response.setHeader("Content-disposition","attachment;filename=" + fileName +".xlsx");
            list = workService.queryExport(searchDto,academyId);
            EasyExcel.write(response.getOutputStream()).head(StuWorkDto.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);
        }catch (IOException e){

        }
    }
}
