package io.renren.modules.edu.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.excel.FeeSchoolSundryListener;
import io.renren.modules.edu.service.*;
import io.renren.modules.edu.utils.Query;

import io.renren.modules.edu.vo.*;
import org.apache.http.HttpStatus;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


/**
 * 学杂费收支管理表
 *
 * @author zbl
 * @email
 * @date 2023-07-20 09:55:51
 */
@RestController
@RequestMapping("generator/feeschoolsundry")
public class FeeSchoolSundryController {
    /**
     * 导入参照其他接口仿写
     * 导入规则看群里
     * 导入内容满足一个学生多条学杂费信息 但是身份证 + 缴费学年构成唯一
     *
     * @param entity
     * @return
     */
    @Autowired
    FeeReturnService feeReturnService;
    @Autowired
    FeeSchoolSundryService feeSchoolSundryService;
    @Autowired
    FeeArrearageService feeArrearageService;
    @Autowired
    RedisUtils redis;
    @Autowired
    StuFileService stuFileService;

    @Value("${upload.directory}")
    private String uploadDirectory;

    @PostMapping("/upload")
    public R upload(MultipartFile file){
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    FeeSundryImportVo.class,
                    new FeeSchoolSundryListener(feeSchoolSundryService)).sheet().doRead();
        }catch (IOException e){
            return R.error(e.getMessage());
        }catch (EmptyDataException ee){
            return R.error(ee.getMessage());
        }
        return R.ok();
    }



    @GetMapping("/export")
    public void export(HttpServletResponse response,
                       @Nullable Integer year,
                       @Nullable Long deptId,
                       @Nullable Query query,
                       @Nullable  StuKeyWordDto key,
                       @Nullable @RequestParam("isArrearage") String isArrearage,
                       @Nullable @RequestParam("derateType") String derateType,
                       @Nullable @RequestParam("isAll") Boolean isAll) {
        List<FeeSundryExportVo>  list = null;
        try {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "feeExport";
            response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
            if (isAll) {
                list = feeSchoolSundryService.queryExport(null,year,deptId,key,isArrearage,derateType);
            } else {
                list = feeSchoolSundryService.queryExport(query, year, deptId,key,isArrearage,derateType);
            }
            EasyExcel.write(response.getOutputStream()).head(FeeSundryExportVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("测试数据")
                    .doWrite(list);
        } catch (IOException e) {

        }
    }
    @RequestMapping("/list")
    public R list(@Nullable Integer year,
                  @Nullable Long deptId,
                  Query query,
                  @Nullable  StuKeyWordDto key,
                  @Nullable @RequestParam("isArrearage") String isArrearage,
                  @Nullable @RequestParam("derateType") String derateType
    ) {
        PageUtils page = feeSchoolSundryService.selectStuFeeSundryPage(Query.getPage(query),year,
                deptId,key,isArrearage,derateType);
        return R.ok().put("page", page);
    }


    @RequestMapping("/qMoneyHandle")
    public R qMoneyHandle(@RequestBody FeeSchoolSundryEntity byId){
        FeeArrearageEntity feeArrearageEntity = new FeeArrearageEntity();
        BigDecimal b = new BigDecimal("-1");
//        for (Long id : ids) {
//            if(id!=null) {
//                FeeSchoolSundryEntity byId = feeSchoolSundryService.getById(id);
                byId.setIsArrearage(1);
                BeanUtils.copyProperties(byId, feeArrearageEntity);
                feeArrearageEntity.setYear(byId.getPaySchoolYear());
                feeArrearageEntity.setTrainFee(byId.getTrainFee().subtract(byId.getPayTrainFee()).multiply(b));
                feeArrearageEntity.setBookFee(byId.getBookFee().subtract(byId.getPayBookFee()).multiply(b));
                feeArrearageEntity.setHotelFee(byId.getHotelFee().subtract(byId.getPayHotelFee()).multiply(b));
                feeArrearageEntity.setBedFee(byId.getBedFee().subtract(byId.getPayBedFee()).multiply(b));
                feeArrearageEntity.setClothesFee(byId.getClothesFee().subtract(byId.getPayClothesFee()).multiply(b));
                feeArrearageEntity.setInsuranceFee(byId.getInsuranceFee().subtract(byId.getPayInsuranceFee()).multiply(b));
                feeArrearageEntity.setPublicFee(byId.getPublicFee().subtract(byId.getPayPublicFee()).multiply(b));
                feeArrearageEntity.setCertificateFee(byId.getCertificateFee().subtract(byId.getPayCertificateFee()).multiply(b));
                feeArrearageEntity.setDefenseEduFee(byId.getDefenseEduFee().subtract(byId.getPayDefenseEduFee()).multiply(b));
                feeArrearageEntity.setBodyExamFee(byId.getBodyExamFee().subtract(byId.getPayBodyExamFee()).multiply(b));
                feeArrearageEntity.setFeeNum(byId.getTrainFee().subtract(byId.getPayTrainFee()).
                        add(byId.getClothesFee().subtract(byId.getPayClothesFee()).
                                add(byId.getBookFee().subtract(byId.getPayBookFee()).
                                        add(byId.getHotelFee().subtract(byId.getPayHotelFee()).
                                                add(byId.getBedFee().subtract(byId.getPayBedFee()).add(byId.getInsuranceFee().subtract(byId.getPayInsuranceFee()).
                                                        add(byId.getPublicFee().subtract(byId.getPayPublicFee()).add(byId.getCertificateFee().subtract(byId.getPayCertificateFee())
                                                                .add(byId.getDefenseEduFee().subtract(byId.getPayDefenseEduFee())
                                                                        .add(byId.getBodyExamFee().subtract(byId.getPayBodyExamFee())).add(byId.getDerateMoney()))))))
                                        ))).multiply(b));
                LambdaQueryWrapper<FeeArrearageEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
                lambdaQueryWrapper.eq(FeeArrearageEntity::getYear, byId.getPaySchoolYear());
                lambdaQueryWrapper.eq(FeeArrearageEntity::getStuId, byId.getStuId());
                FeeArrearageEntity one = feeArrearageService.getOne(lambdaQueryWrapper);
                if (one != null) {
                    Long oneId = one.getId();
                    BeanUtils.copyProperties(feeArrearageEntity, one);
                    one.setId(oneId);
                    feeArrearageService.updateById(one);
                } else {
                    feeArrearageService.save(feeArrearageEntity);
                }

               List<FeeSchoolSundryEntity> changeItem = feeSchoolSundryService.list(new QueryWrapper<FeeSchoolSundryEntity>().eq("stu_id",byId.getStuId()));
                for(FeeSchoolSundryEntity item : changeItem){
                    item.setIsArrearage(1);
                    feeSchoolSundryService.updateById(item);
                }

//            }
//        }
        return R.ok();
    }

    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        for (Long id : ids) {
            FeeSchoolSundryEntity byId = feeSchoolSundryService.getById(id);
            byId.setIsDeleted(true);

            LambdaQueryWrapper<FeeReturnEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(FeeReturnEntity::getStuId,byId.getStuId());
            FeeReturnEntity one = feeReturnService.getOne(lambdaQueryWrapper);
            if(null != one){
                one.setIsDeleted(true);

                feeReturnService.updateById(one);
            }
            feeSchoolSundryService.updateById(byId);
        }
        //feeSchoolSundryService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

    @RequestMapping("/infoOne/{id}")
    public R infoOne(@PathVariable("id") Long id){
        FeeSchoolSundryEntity feeSchoolSundry = feeSchoolSundryService.getById(id);
        return R.ok().put("feeSchoolSundry", feeSchoolSundry);
    }

    @RequestMapping("/update")
    public R update(@RequestBody FeeSchoolSundryEntity feeSchoolSundry){
        feeSchoolSundryService.updateById(feeSchoolSundry);
        return R.ok();
    }


    @GetMapping("/getImg")
    public void getImg(HttpServletResponse response,@RequestParam("stuId")Long stuId){
        List<StuFileEntity> list = stuFileService.get(stuId, 1);
        if(list.size() == 0){
            response.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
            return;
        }
        StuFileEntity stuFile = list.get(0);
        Path path = Paths.get(stuFile.getPath());
        if (Files.exists(path) && Files.isReadable(path)) {
            String contentType = getImageContentType(stuFile.getPath());
            response.setContentType(contentType);
            response.setHeader("Content-Disposition", "inline; filename=" + stuFile.getPath());

            try {
                Files.copy(path, response.getOutputStream());
                response.getOutputStream().flush();
            } catch (IOException e) {
                response.setStatus(HttpStatus.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    @PostMapping("/uploadImg")
    public R uploadImg(MultipartFile file,@RequestParam("stuId") Long stuId) {
        if (file.isEmpty()) {
            return R.error("请选择一个文件上传");
        }
        try {
            String originalFilename = file.getOriginalFilename();
            String randomFileName = UUID.randomUUID().toString() + originalFilename.substring(originalFilename.lastIndexOf("."));

            // 构建文件存储路径
            String filePath = uploadDirectory + File.separator + randomFileName;
            File dest = new File(filePath);

            // 保存文件
            file.transferTo(dest);
            stuFileService.addOne(filePath,1,stuId);

        }catch (Exception ioe){
            return R.error("文件保存失败");
        }
        return R.ok();
    }

    //todo ---> zbl
    @RequestMapping("/save")
    public R save(@RequestBody FeeSchoolSundryDto dto) {
        /**
         * 新增和修改一年的学杂费信息
         */
        Integer res = feeSchoolSundryService.saveOrUpdateFeeSchoolSundry(dto);
        if (res == 1) return R.ok();
        else if (res == -1) return R.error("该学生" + dto.getPaySchoolYear() + "年份的学杂费信息已存在");
        else if (res == -2) return R.error("存在多条/不存在学生记录，请核实学生信息");
        else if (res == -3) return R.error(dto.getPaySchoolYear() + "年份与当前学年差距过大，建议修改年份");
        else return R.error("unknown error");
    }

   /* //todo ---> zbl
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        *//**
         * 返回基本信息
         * 返回学杂费信息列表
         *//*
        Map<String, Object> infoMap = feeSchoolSundryService.getStuBaseInfoAndFeeSundry(id);
        return R.ok().put("infoMap",infoMap);
    }*/
    @RequestMapping("/sInfo/{id}")
    public R info(@PathVariable("id") Long id,
                  @Nullable /*@PathVariable("payYear")*/ String payYear,
                  @Nullable/* @PathVariable("payDate")*/ @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date payDate) {
        /**
         * 返回基本信息
         * 返回学杂费信息列表
         */
        try {
            Map<String, Object> infoMap = feeSchoolSundryService.getSingleStuBaseInfoAndFeeSundry(id,payYear,payDate);
            return R.ok().put("infoMap",infoMap);
        }catch (RuntimeException re){
            return R.error(re.getMessage());
        }
    }




    private String getImageContentType(String imageName) {
        String[] parts = imageName.split("\\.");
        if (parts.length > 1) {
            String extension = parts[parts.length - 1].toLowerCase();
            switch (extension) {
                case "jpg":
                case "jpeg":
                    return "image/jpeg";
                case "png":
                    return "image/png";
                case "gif":
                    return "image/gif";
                // 添加其他图片格式的支持
            }
        }
        // 如果无法识别文件格式，默认使用通用的媒体类型
        return "application/octet-stream";
    }
}
