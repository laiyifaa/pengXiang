package io.renren.modules.edu.service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.dao.FeeSchoolSundryDao;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.dto.ReturnFeeDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.excel.EmptyDataException;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.vo.*;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.FeeReturnDao;
import io.renren.modules.edu.service.FeeReturnService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


@Service("feeReturnService")
public class FeeReturnServiceImpl extends ServiceImpl<FeeReturnDao, FeeReturnEntity> implements FeeReturnService {

    @Autowired
    FeeReturnDao feeReturnDao;
    @Autowired
    FeeReturnService feeReturnService;
    @Autowired
    StuBaseInfoDao stuBaseInfoDao;
    @Autowired
    StuBaseInfoService stuBaseInfoService;
    @Autowired
    SysDeptDao sysDeptDao;
    @Autowired
    RedisUtils redis;
    @Override
    public List<ReturnFeeDto> getlist() {
//        List<FeeReturnEntity> feeReturnEntities=feeReturnDao.selectList(null);
//        List<StuBaseInfoEntity> stuBaseInfoEntityList=stuBaseInfoDao.listAll();
//        List<SysDeptEntity> sysDeptEntities=sysDeptDao.listAll();
//        HashMap<Long,String> D_maps=new HashMap<>();
//        for(SysDeptEntity sysDeptEntity:sysDeptEntities){
//            D_maps.put(sysDeptEntity.getDeptId(),sysDeptEntity.getName());
//        }
//        HashMap<String,Object> B_maps=new HashMap<>();
//        for(StuBaseInfoEntity stuBaseInfoEntity: stuBaseInfoEntityList)
//        {
//            B_maps.put(stuBaseInfoEntity.getSchoolNumber(),stuBaseInfoEntity);
//        }
//
//        List<ReturnFeeDto> returnFeeDtoList=new ArrayList<>();
//        for(FeeReturnEntity feeReturn:feeReturnEntities){
//           ReturnFeeDto returnFeeDto=new ReturnFeeDto();
//            Date createTime = feeReturn.getCreateTime();
//            Instant instant = createTime.toInstant();
//            LocalDate localDate = instant.atZone(ZoneId.systemDefault()).toLocalDate();
//            returnFeeDto.setRealTime(localDate);
//           returnFeeDto.setFeeReturnEntity(feeReturn);
//           StuBaseInfoEntity stuBaseInfoEntity= (StuBaseInfoEntity) B_maps.get(feeReturn.getStuId());
//           returnFeeDto.setStuBaseInfoEntity(stuBaseInfoEntity);
//           returnFeeDto.setSchoolNumber(stuBaseInfoEntity.getSchoolNumber());
//           returnFeeDto.setSchool(D_maps.get(stuBaseInfoEntity.getAcademyId()));
//           returnFeeDto.setMajor(D_maps.get(stuBaseInfoEntity.getMajorId()));
//           returnFeeDto.setGrade(D_maps.get(stuBaseInfoEntity.getGradeId()));
//           returnFeeDtoList.add(returnFeeDto);
//        }
//        return returnFeeDtoList;
        return null;
    }


    @Override
    public PageUtils selectStuReturnFeePage(IPage<ReturnFeeDto> page,  Long deptId) {

        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        Long academyId = user.getAcademyId();
        List<ReturnFeeDto> records = feeReturnDao.selectReturnFeeDto(page, academyId, deptId);
        List<ReturnFeeDto> allRecords = feeReturnDao.selectReturnFeeDto2(academyId, deptId);


        // 手动进行分页
        int pageSize = (int)page.getSize();  // 每页显示的数据条数
        int pageNum = (int)page.getCurrent();    // 要显示的页码
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, allRecords.size());

        List<ReturnFeeDto> recordsOnPage = allRecords.subList(startIndex, endIndex);



// 创建分页信息对象
        PageUtils pageUtils = new PageUtils(page);
        pageUtils.setList(recordsOnPage);
        pageUtils.setPageSize(pageSize);
        pageUtils.setTotalCount(allRecords.size());
        pageUtils.setTotalPage((int) Math.ceil((double) allRecords.size() / pageSize));
        pageUtils.setCurrPage(pageNum);



//        page.setRecords(records2);
//        PageUtils pageUtils = new PageUtils(page);
        SysUserEntity user2 = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        redis.set("returnFeeList"+user2.getUserId(), JSON.toJSON(allRecords).toString());
        return pageUtils;

    }

    @Override
    public Integer saveFeeReturnSundry(ReturnFeeDto dto) {
        QueryWrapper<StuBaseInfoEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("stu_name",dto.getStuName());
        wrapper.eq("id_number",dto.getIdNumber());
        List<StuBaseInfoEntity> students = stuBaseInfoService.list(wrapper);
        if(students.size()==1){

            int year = getSchoolYearInfoByDate(new Date());
            Integer feeYear = dto.getReturnSchoolYear();

            //与当前学年差距过大，建议修改年份
            if(feeYear<year-5&&feeYear>year+5)return -3;

            //查询是不是存在当前年份的记录
            QueryWrapper<FeeReturnEntity> feeWrapper = new QueryWrapper<>();
            feeWrapper.eq("return_school_year", feeYear);
            feeWrapper.eq("stu_id",students.get(0).getStuId());
            FeeReturnEntity entity = baseMapper.selectOne(feeWrapper);
            if(entity==null){
                //不存在，可以插入记录
                FeeReturnEntity save = new FeeReturnEntity();
                BeanUtils.copyProperties(dto,save);
                save.setStuId(students.get(0).getStuId());
                save.setAcademyId(students.get(0).getAcademyId());
                save.setIsDeleted(false);
                this.baseMapper.insert(save);
                return 1;
            }else {
                //已经存在，报错
                return -1;
            }
        }else {
            //存在多条或不存在学生记录，建议检查学生信息录入是否有误
            return -2;
        }
    }

    @Override
    public void importByList(List<returnFeeImportVo> cachedDataList, AnalysisContext context) {
        if(null == cachedDataList || cachedDataList.isEmpty())
            return ;
        //来自excel的身份证列表
        List<String> cacheIdNumberList = new ArrayList<>(cachedDataList.size());
        List<Long> cacheStuIdList = new ArrayList<>(cachedDataList.size());
        for(returnFeeImportVo entity : cachedDataList){
            LambdaQueryWrapper<StuBaseInfoEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();

            lambdaQueryWrapper.eq(StuBaseInfoEntity::getIdNumber,entity.getIdNumber());
//            lambdaQueryWrapper.eq(StuBaseInfoEntity::getSchoolNumber,entity.getSchoolNumber());
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getStuName,entity.getStuName());
            StuBaseInfoEntity one = stuBaseInfoService.getOne(lambdaQueryWrapper);
            if (one != null){
                cacheIdNumberList.add(entity.getIdNumber());
                entity.setStuId(one.getStuId());
                continue;
            }
            throw new EmptyDataException("学生不存在，请检查学生信息，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        //查询数据库 是否有这些 身份证(关键词)
        List<Long> idList = baseMapper.getIdList();


        SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        for(returnFeeImportVo entity : cachedDataList){
/*            StuTempEntity temp = new StuTempEntity();
            BeanUtils.copyProperties(entity,temp);*/
            if(cacheIdNumberList.contains(entity.getIdNumber())){
                LambdaQueryWrapper<FeeReturnEntity> queryWrapper = new LambdaQueryWrapper<>();
                if (idList.contains(entity.getStuId())){
                    queryWrapper.eq(FeeReturnEntity::getStuId,entity.getStuId());
                    FeeReturnEntity feeReturnEntity = feeReturnDao.selectOne(queryWrapper);
                    entity.setId(feeReturnEntity.getId());
                    FeeReturnEntity feeReturnEntity1 = new FeeReturnEntity();
                    BeanUtils.copyProperties(entity,feeReturnEntity1);
                    feeReturnDao.updateById(feeReturnEntity1);
                }else {
                    LambdaQueryWrapper<StuBaseInfoEntity> queryWrapper2 = new LambdaQueryWrapper<>();
                    queryWrapper2.eq(StuBaseInfoEntity::getStuId,entity.getStuId());
                    FeeReturnEntity feeReturnEntity1 = new FeeReturnEntity();
                    BeanUtils.copyProperties(entity,feeReturnEntity1);
                    feeReturnService.save(feeReturnEntity1);
                }
            }

        }
    }


    private int getSchoolYearInfoByDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);

        return year;
    }
    @Override
    public PageUtils queryPageInConditions(SearchConditionVo searchConditionVo) {
        if (!searchConditionVo.getStart().before(searchConditionVo.getEnd())){
            throw new RuntimeException("时间段选择错误，起始时间大于结束时间");
        }
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("returnFeeList"+user.getUserId());
        List<ReturnFeeDto> collect = JSON.parseArray(jsonStr, ReturnFeeDto.class);
        Map params = new HashMap();
        params.put("limit",searchConditionVo.getLimit());
        params.put("page",searchConditionVo.getPage());
        IPage<ReturnFeeDto> page = this.page(
                new Query<ReturnFeeDto>().getPage(params)
        );
        LambdaQueryWrapper<FeeReturnEntity> lambdaQueryWrapper = new LambdaQueryWrapper();
        QueryWrapper<StuBaseInfoEntity> queryWrapper = new QueryWrapper();
        for (io.renren.modules.edu.vo.pageVo pageVo : searchConditionVo.getSearchConditions()){
            if (pageVo.getOption().equals("returnSchoolYear")){
                lambdaQueryWrapper.eq(FeeReturnEntity::getReturnSchoolYear,pageVo.getValue());
                continue;
            }
            if (pageVo.getOption().equals("residence_type")){
                int a = 2;
                if (pageVo.getValue().equals("农业户口")){
                    a = 1;
                }else if (pageVo.getValue().equals("非农户口")){
                    a = 0;
                }else {
                    throw new RuntimeException("户口类型格式错误，请填农业户口/非农户口");
                }
                queryWrapper.eq(pageVo.getOption(),a);
                continue;
            }
            queryWrapper.like(pageVo.getOption(),pageVo.getValue());
        }

        if (searchConditionVo.getTimeIf()){
            lambdaQueryWrapper.between(FeeReturnEntity::getReturnMoneyTime,searchConditionVo.getStart(),searchConditionVo.getEnd());
        }
        List<FeeReturnEntity> list = feeReturnDao.selectList(lambdaQueryWrapper);
        List<StuBaseInfoEntity> records = stuBaseInfoService.getBaseMapper().selectList(queryWrapper);

        List stuIdList = new ArrayList();
        for (StuBaseInfoEntity record : records) {

            stuIdList.add(record.getStuId());
        }
        List feestuIdList = new ArrayList();
        for (FeeReturnEntity record : list) {

            feestuIdList.add(record.getStuId());
        }
        collect = collect.stream().filter(item -> stuIdList.contains(item.getStuId())).collect(Collectors.toList());
        collect = collect.stream().filter(item -> feestuIdList.contains(item.getStuId())).collect(Collectors.toList());

        page.setRecords(collect);
        return new PageUtils(page);
    }
    @Override
    public int update(FeeReturnEntity feeReturn) {
        return  feeReturnDao.updateById(feeReturn);

    }


}
