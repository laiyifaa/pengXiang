package io.renren.modules.edu.controller;

import java.io.IOException;
import java.util.List;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.support.ExcelTypeEnum;
import io.renren.common.utils.PageUtils;
import io.renren.modules.edu.excel.CertificateExcelVoListener;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.utils.Query;
import io.renren.modules.edu.vo.CertificateDetailVo;
import io.renren.modules.edu.vo.CertificateVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.edu.entity.EduCertificateEntity;
import io.renren.modules.edu.service.EduCertificateService;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;


/**
 *
 *
 * @author ischen
 * @email sunlightcs@gmail.com
 * @date 2023-07-29 09:55:51
 */
@RestController
@RequestMapping("edu/certificate")
@Slf4j
public class EduCertificateController {

    @Autowired
    private EduCertificateService eduCertificateService;

    @PostMapping("/upload")
    public R upload( @RequestBody MultipartFile file){
        try {
            EasyExcel.read(
                    file.getInputStream(),
                    CertificateVo.class,
                    new CertificateExcelVoListener(eduCertificateService)).sheet().doRead();
        }catch (EmptyDataException ee){
            return R.error(ee.getMessage());
        }catch (IOException e){
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response,
                       @Nullable Query query,
                       @Nullable @RequestParam("deptId")Long deptId,
                       @Nullable  CertificateVo record,
                       @Nullable @RequestParam("isAll") Boolean isAll){
        try {
            List<CertificateVo> list = null;
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            String fileName = "stuTempExport";
            response.setHeader("Content-disposition","attachment;filename=" + fileName +".xlsx");
            if(isAll){
                list = eduCertificateService.queryExport(null,null,null);
            }else {
                list = eduCertificateService.queryExport(query, record, deptId);
            }
            EasyExcel.write(response.getOutputStream()).head(CertificateVo.class)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet("证书列表")
                    .doWrite(list);

        }catch (IOException e){

        }
    }

    /**
     * 列表
     */
    @GetMapping("/list")
    //@RequiresPermissions("educertificate:list")
    public R list(@Nullable Query query,
                  @Nullable @RequestParam("deptId")Long deptId,
                  @Nullable  CertificateVo record){
        /*PageUtils page = eduCertificateService.queryPage(params);*/
        /**
         * sysUser 在service 方法里
         */
        PageUtils page = eduCertificateService.queryPage(Query.getPage(query),record,deptId);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @GetMapping("/info")
    //@RequiresPermissions("educertificate:info")
    public R info(@RequestParam("id") Long id){
        if(null == id || id< 0)
            return R.error();
		CertificateDetailVo detailVo = eduCertificateService.detailById(id);
		if(detailVo == null)
		    return R.error();
        return R.ok().put("info", detailVo);
    }

    /**
     * 新增or保存
     */
    @PostMapping("/save")
    //@RequiresPermissions("educertificate:save")
    public R save(@RequestBody EduCertificateEntity eduCertificate){
        try {
            if(null == eduCertificate)
                return R.error();
            eduCertificateService.saveCertificateInfo(eduCertificate);
        }catch (Exception e){
            log.error(e.getMessage());
            return R.error(e.getMessage());
        }
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/delete")
    //@RequiresPermissions("educertificate:delete")
    public R delete(@RequestBody Long[] ids){
        if(null != ids && 0 != ids.length){
            eduCertificateService.deleteByIds( ids);
        }
        return R.ok();
    }

}
