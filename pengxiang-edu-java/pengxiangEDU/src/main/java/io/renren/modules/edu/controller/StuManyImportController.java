package io.renren.modules.edu.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.excel.util.ListUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.edu.dto.StuBaseInfoEntityDto;
import io.renren.modules.edu.dto.StuDetailInfoEntityDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuDetailInfoEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.entity.constant.FAMILY_HARDSHIP_TYPE;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.StuDetailInfoService;
import io.renren.modules.edu.service.SysDeptService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("StuDetailImport")
public class StuManyImportController {
    @Autowired
    StuDetailInfoService stuDetailInfoService;
    @Autowired
    SysDeptService sysDeptService;
    @Autowired
    StuBaseInfoService stuBaseInfoService;

    @PostMapping("upload")
    @ResponseBody
    public R upload(@RequestParam(value = "file") MultipartFile file) throws IOException {
//        String PATH = "E:\\study_demo\\javawork-spring\\";
//        // 写法1：JDK8+ ,不用额外写一个DemoDataListener
//        // since: 3.0.0-beta1
//        String fileName = PATH + "学生详细信息.xlsx";

        EasyExcel.read(file.getInputStream(), StuDetailInfoEntityDto.class, new ReadListener<StuDetailInfoEntityDto>() {
            /**
             * 单次缓存的数据量
             */
            public static final int BATCH_COUNT = 100;
            /**
             *临时存储
             */
            private List<StuDetailInfoEntityDto> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);


            @Override
            public void invoke(StuDetailInfoEntityDto data, AnalysisContext context) {
                cachedDataList.add(data);
                if (cachedDataList.size() >= BATCH_COUNT) {
                    saveData(cachedDataList);
                    // 存储完成清理 list
                    cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
                }
            }

            @Override
            public void doAfterAllAnalysed(AnalysisContext context) {
                saveData(cachedDataList);
            }

            /**
             * 加上存储数据库
             */
            private void saveData(List<StuDetailInfoEntityDto> cachedDataList) {
                log.info("{}条数据，开始存储数据库！", cachedDataList.size());
                List<StuDetailInfoEntity> list = new ArrayList<>();
                for (StuDetailInfoEntityDto stuDetailInfoEntityDto : cachedDataList) {
                    StuDetailInfoEntity stuDetailInfoEntity = new StuDetailInfoEntity();
                    BeanUtils.copyProperties(stuDetailInfoEntityDto,stuDetailInfoEntity);

                    /*String difficultyType = stuDetailInfoEntityDto.getDifficultyType();
                    Integer code = FAMILY_HARDSHIP_TYPE.getCode(difficultyType);
                    stuDetailInfoEntity.setDifficultyType(code);
*/
                    String totalIncome = stuDetailInfoEntityDto.getTotalIncome();
                    BigDecimal bigDecimal = new BigDecimal(totalIncome);
                    stuDetailInfoEntity.setTotalIncome(bigDecimal);

                    String aveIncome = stuDetailInfoEntityDto.getAveIncome();
                    BigDecimal bigDecimal2 = new BigDecimal(aveIncome);
                    stuDetailInfoEntity.setAveIncome(bigDecimal2);

                    String stuId = stuDetailInfoEntityDto.getStuId();
                    Long a = new Long(stuId);
                    stuDetailInfoEntity.setStuId(a);
                    list.add(stuDetailInfoEntity);
                }
                stuDetailInfoService.saveBatch(list);
                log.info("存储数据库成功！");
            }

        }).sheet().doRead();
         return R.ok("上传成功");
    }

    @PostMapping("upload2")
    @ResponseBody
    public R upload2(@RequestParam(value = "file") MultipartFile file) throws IOException {
//        String PATH = "E:\\study_demo\\javawork-spring\\";
//        // 写法1：JDK8+ ,不用额外写一个DemoDataListener
//        // since: 3.0.0-beta1
//        String fileName = PATH + "学生详细信息.xlsx";

        EasyExcel.read(file.getInputStream(), StuBaseInfoEntityDto.class, new ReadListener<StuBaseInfoEntityDto>() {
            /**
             * 单次缓存的数据量
             */
            public static final int BATCH_COUNT = 100;
            /**
             *临时存储
             */
            private List<StuBaseInfoEntityDto> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);


            @Override
            public void invoke(StuBaseInfoEntityDto data, AnalysisContext context) {
                cachedDataList.add(data);
                if (cachedDataList.size() >= BATCH_COUNT) {
                    saveData(cachedDataList);
                    // 存储完成清理 list
                    cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
                }
            }

            @Override
            public void doAfterAllAnalysed(AnalysisContext context) {
                saveData(cachedDataList);
            }

            /**
             * 加上存储数据库
             */
            @Transactional
            private void saveData(List<StuBaseInfoEntityDto> cachedDataList) {
                log.info("{}条数据，开始存储数据库！", cachedDataList.size());
                cachedDataList.remove(0);
                List<StuBaseInfoEntity> list = new ArrayList<>();
                List<StuDetailInfoEntity> listOnDetail = new ArrayList<>();
                for (StuBaseInfoEntityDto stuBaseInfoEntityDto : cachedDataList) {
                    StuBaseInfoEntity stuBaseInfoEntity = new StuBaseInfoEntity();
                    StuDetailInfoEntity stuDetailInfoEntity = new StuDetailInfoEntity();
                    BeanUtils.copyProperties(stuBaseInfoEntityDto,stuBaseInfoEntity);
                    BeanUtils.copyProperties(stuBaseInfoEntityDto,stuDetailInfoEntity);

                    /*String difficultyType = stuDetailInfoEntityDto.getDifficultyType();
                    Integer code = FAMILY_HARDSHIP_TYPE.getCode(difficultyType);
                    stuDetailInfoEntity.setDifficultyType(code);
*/



                    String stuId = stuBaseInfoEntityDto.getStuId();
                    Long a = Long.parseLong(stuId);
                    stuBaseInfoEntity.setStuId(a);

                    stuDetailInfoEntity.setStuId(a);

                    String admissionDate = stuBaseInfoEntityDto.getAdmissionDate();
                    SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd");
                    String registerDate = stuBaseInfoEntityDto.getRegisterDate();

                    try {
                        Date dateOnAdmission = ft.parse(admissionDate);
                        Date dateOnRegister = ft.parse(registerDate);
                        stuBaseInfoEntity.setAdmissionDate(dateOnAdmission);
                        stuBaseInfoEntity.setRegisterDate(dateOnRegister);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    stuBaseInfoEntity.setAcademyId(34L);
//                    stuBaseInfoEntity.setEntranceStatus(200);
//                    stuBaseInfoEntity.setCurrentSchoolYear(1);
                    stuBaseInfoEntity.setSchoolRollStatus(1);
                    stuBaseInfoEntity.setCurrentStatus(1);
                    stuBaseInfoEntity.setCreateBy(5L);

                    list.add(stuBaseInfoEntity);
                    listOnDetail.add(stuDetailInfoEntity);
                }
                stuBaseInfoService.saveBatch(list);
                stuDetailInfoService.saveBatch(listOnDetail);
                log.info("存储数据库成功！");
            }
        }).sheet().doRead();
        return R.ok("上传成功");
    }
}
