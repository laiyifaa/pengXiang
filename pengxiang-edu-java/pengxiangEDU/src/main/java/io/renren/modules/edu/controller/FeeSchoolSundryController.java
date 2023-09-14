package io.renren.modules.edu.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dto.FeeSchoolSundryDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.excel.FeeSchoolSundryListener;
import io.renren.modules.edu.service.*;
import io.renren.modules.edu.utils.Query;

import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.http.HttpStatus;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
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
    @RequestMapping("/export")
    public void export(@RequestBody Long[] ids, HttpServletResponse response){
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = redis.get("feeList"+user.getUserId());
        List<FeeSchoolSundryVo> collect = JSON.parseArray(jsonStr, FeeSchoolSundryVo.class);
        List<Long> idList = new ArrayList<>(Arrays.asList(ids));
        if(idList.size() == 0)throw new RuntimeException("未选择需要导出的学生数据，请返回进行选择");
        List<FeeSchoolSundryVo> collect1 = collect.stream().filter(item -> idList.contains(item.getId())).collect(Collectors.toList());

        List<FeeSundryExportVo> list = new ArrayList<>();
        for (FeeSchoolSundryVo dto : collect1) {
            FeeSundryExportVo exportVo = new FeeSundryExportVo();
            BeanUtils.copyProperties(dto, exportVo);
            exportVo.setIsArrearage(dto.getIsArrearage() == 1? "是" : "否");
            //if (dto.getDerateType() != null)exportVo.setDerate(dto.getDerateType() == 1? "贫困生" : "非贫困");
            if (dto.getPaySchoolDate() != null)exportVo.setPaySchoolDate(dto.getPaySchoolDate());
            if (dto.getReturnFeeTime() != null)exportVo.setReturnFeeTime(dto.getReturnFeeTime().toString());

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
            EasyExcel.write(outputStream, FeeSundryExportVo.class)
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
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = redis.get("feeList"+user.getUserId());
        List<FeeSchoolSundryVo> collect = JSON.parseArray(jsonStr, FeeSchoolSundryVo.class);

        List<FeeSundryExportVo> list = new ArrayList<>();
        for (FeeSchoolSundryVo dto : collect) {
            FeeSundryExportVo exportVo = new FeeSundryExportVo();
            BeanUtils.copyProperties(dto, exportVo);
            if (dto.getIsArrearage() != null){
                exportVo.setIsArrearage(dto.getIsArrearage() == 1? "是" : "否");
            }
            //if (dto.getDerateType() != null)exportVo.setDerate(dto.getDerateType() == 1? "贫困生" : "非贫困");
            if (dto.getPaySchoolDate() != null)exportVo.setPaySchoolDate(dto.getPaySchoolDate());
            if (dto.getReturnFeeTime() != null)exportVo.setReturnFeeTime(dto.getReturnFeeTime().toString());
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
            EasyExcel.write(outputStream, FeeSundryExportVo.class)
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
        PageUtils page = feeSchoolSundryService.queryPageInConditions(searchConditionVo);

        return R.ok().put("page", page);
    }


    @RequestMapping("/qMoneyHandle")
    public R qMoneyHandle(@RequestBody Long[] ids){
        FeeArrearageEntity feeArrearageEntity = new FeeArrearageEntity();
        BigDecimal b = new BigDecimal("-1");
        for (Long id : ids) {
            FeeSchoolSundryEntity byId = feeSchoolSundryService.getById(id);
            byId.setIsArrearage(1);
            BeanUtils.copyProperties(byId,feeArrearageEntity);
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
                                    .add(byId.getBodyExamFee().subtract(byId.getPayBodyExamFee())))))))
                    ))).multiply(b));
            LambdaQueryWrapper<FeeArrearageEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(FeeArrearageEntity::getYear,byId.getPaySchoolYear());
            lambdaQueryWrapper.eq(FeeArrearageEntity::getStuId,byId.getStuId());
            FeeArrearageEntity one = feeArrearageService.getOne(lambdaQueryWrapper);
            if (one != null){
                Long oneId = one.getId();
                BeanUtils.copyProperties(feeArrearageEntity,one);
                one.setId(oneId);
                feeArrearageService.updateById(one);
            }else {
                feeArrearageService.save(feeArrearageEntity);
            }
            feeSchoolSundryService.updateById(byId);
        }


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
            one.setIsDeleted(true);

            feeReturnService.updateById(one);
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

    @RequestMapping("/list")
    public R list(@Nullable Integer year,
                  @Nullable Long deptId,
                  Query query,
                  @Nullable  StuKeyWordDto key
                  ) {
        PageUtils page = feeSchoolSundryService.selectStuFeeSundryPage(Query.getPage(query),year,deptId,key);
        return R.ok().put("page", page);
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

    //todo ---> zbl
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        /**
         * 返回基本信息
         * 返回学杂费信息列表
         */
        Map<String, Object> infoMap = feeSchoolSundryService.getStuBaseInfoAndFeeSundry(id);
//        res.put("stuInfo",vos.get(0));
//        res.put("feeInfo",sundryEntity);
        return R.ok().put("infoMap",infoMap);
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
