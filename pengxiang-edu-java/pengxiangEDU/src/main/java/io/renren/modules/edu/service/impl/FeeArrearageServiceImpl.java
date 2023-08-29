package io.renren.modules.edu.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.dto.DeptdescriptionDto;
import io.renren.modules.edu.dto.FeeArrearageSumDto;
import io.renren.modules.edu.dto.ReturnFeeDto;
import io.renren.modules.edu.dto.qMoneyAndInfoListDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.vo.*;

import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.FeeArrearageDao;
import io.renren.modules.edu.entity.FeeArrearageEntity;
import io.renren.modules.edu.service.FeeArrearageService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Service("feeArrearageService")
public class FeeArrearageServiceImpl extends ServiceImpl<FeeArrearageDao, FeeArrearageEntity> implements FeeArrearageService {

    @Resource
    FeeArrearageDao feeArrearageDao;
    @Resource
    SysDeptDao sysDeptDao;
    @Resource
    SysDeptService sysDeptService;
    @Resource
    StuBaseInfoService stuBaseInfoService;
    @Autowired
    RedisUtils redis;
    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public PageUtils queryPage(HttpServletRequest request,Map<String, Object> params) {
        IPage<FeeArrearageEntity> page = this.page(
                new Query<FeeArrearageEntity>().getPage(params),
                new QueryWrapper<FeeArrearageEntity>()
        );
        Map<Object,String> map = new HashMap();
        List<qMoneyAndInfoListDto> qMoneyAndInfoListDtos = feeArrearageDao.qMoneyAndInfoListDto();
        DeptdescriptionDto deptdescriptionDto2 = new DeptdescriptionDto();
        List<DeptdescriptionDto> deptdescriptionDtos = sysDeptDao.listDesc(deptdescriptionDto2,null);
        for (DeptdescriptionDto deptdescriptionDto : deptdescriptionDtos) {
            map.put(deptdescriptionDto.getAcademyId(),deptdescriptionDto.getAcademyName());
            map.put(deptdescriptionDto.getMajorId(),deptdescriptionDto.getMajorName());
            map.put(deptdescriptionDto.getGradeId(),deptdescriptionDto.getGradeName());
            map.put(deptdescriptionDto.getClassId(),deptdescriptionDto.getClassName());
        }

        List<qMoneyAndInfoListDto> qMoneyAndInfoListDtosNoDelete = new ArrayList<>();
        for (qMoneyAndInfoListDto qMoneyAndInfoListDto :qMoneyAndInfoListDtos){

            qMoneyAndInfoListDto.setMajorName(map.get(qMoneyAndInfoListDto.getMajorId()));

            qMoneyAndInfoListDto.setGradeName(map.get(qMoneyAndInfoListDto.getGradeId()));

            qMoneyAndInfoListDto.setClassName(map.get(qMoneyAndInfoListDto.getClassId()));

            if (!qMoneyAndInfoListDto.getIsDeleted()){
                qMoneyAndInfoListDtosNoDelete.add(qMoneyAndInfoListDto);
            }
        }

        int pageSize = (int)page.getSize();  // 每页显示的数据条数
        int pageNum = (int)page.getCurrent();    // 要显示的页码
        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, qMoneyAndInfoListDtosNoDelete.size());

        List<qMoneyAndInfoListDto> recordsOnPage = qMoneyAndInfoListDtosNoDelete.subList(startIndex, endIndex);
        PageUtils pageUtils = new PageUtils(page);
        pageUtils.setList(recordsOnPage);
        pageUtils.setPageSize(pageSize);
        pageUtils.setTotalCount(qMoneyAndInfoListDtosNoDelete.size());
        pageUtils.setTotalPage((int) Math.ceil((double) qMoneyAndInfoListDtosNoDelete.size() / pageSize));
        pageUtils.setCurrPage(pageNum);


//        IPage<qMoneyAndInfoListDto> page1 = new Page<>();
//        BeanUtils.copyProperties(page,page1);
//        page1.setRecords(qMoneyAndInfoListDtosNoDelete);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        redis.set("qMoneyList"+user.getUserId(),JSON.toJSON(qMoneyAndInfoListDtosNoDelete).toString());
        return pageUtils;
    }

    @Override
    public PageUtils queryPageInConditions(SearchConditionVo searchConditionVo) {
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        String jsonStr = null; // 从 Redis 中获取 JSON 字符串
        jsonStr = redis.get("qMoneyList"+user.getUserId());
        List<qMoneyAndInfoListDto> collect = JSON.parseArray(jsonStr, qMoneyAndInfoListDto.class);

        Map params = new HashMap();
        params.put("limit",searchConditionVo.getLimit());
        params.put("page",searchConditionVo.getPage());
        IPage<qMoneyAndInfoListDto> page = this.page(
                new Query<qMoneyAndInfoListDto>().getPage(params)
        );
        String yearValue = "";
        QueryWrapper<StuBaseInfoEntity> queryWrapper = new QueryWrapper();
        for (pageVo pageVo : searchConditionVo.getSearchConditions()){
            if (pageVo.getOption().equals("year")){
                yearValue = pageVo.getValue();
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
        LambdaQueryWrapper<FeeArrearageEntity> lambdaQueryWrapper = new LambdaQueryWrapper();
        lambdaQueryWrapper.eq(FeeArrearageEntity::getYear,yearValue);
        List<FeeArrearageEntity> list = feeArrearageDao.selectList(lambdaQueryWrapper);
        List<StuBaseInfoEntity> records = stuBaseInfoService.getBaseMapper().selectList(queryWrapper);

        List stuIdList = new ArrayList();
        for (StuBaseInfoEntity record : records) {

            stuIdList.add(record.getStuId());
        }
        List stuIdListInYear = new ArrayList();
        for (FeeArrearageEntity record : list) {

            stuIdListInYear.add(record.getId());
        }
        collect = collect.stream().filter(item -> stuIdList.contains(item.getStuId())).collect(Collectors.toList());
        if (stuIdListInYear.size() != 0){
            collect = collect.stream().filter(item -> stuIdListInYear.contains(item.getId())).collect(Collectors.toList());
        }else if (yearValue == ""){
            page.setRecords(collect);
            return new PageUtils(page);
        }else {
            collect = null;
        }
        page.setRecords(collect);
        return new PageUtils(page);
    }

    @Override
    public qMoneyAndInfoListDto getoneInfo(Long id) {
        qMoneyAndInfoListDto oneListDto = feeArrearageDao.getOneListDto(id);

        return oneListDto;

    }

    @Override
    public List<FeeArrearageEntity> getOneQmoneyListDto(Long stuId) {
        List<FeeArrearageEntity> oneQmoneyListDto = feeArrearageDao.getOneQmoneyListDto(stuId);

        return oneQmoneyListDto;
    }

    @Override
    public PageUtils getListByPid(IPage<qMoneyAndInfoListDto> page, Long pid) {
        List<SysDeptEntity> deptList = sysDeptService.getDeptTreeList();
        List list = new ArrayList();
        List<Long> listByPid = getListByPid(pid, deptList,list);
        listByPid.add(pid);
        Map<Object,String> map = new HashMap();
        List<qMoneyAndInfoListDto> qMoneyAndInfoListDtos = feeArrearageDao.qMoneyAndInfoListDto();
        DeptdescriptionDto deptdescriptionDto2 = new DeptdescriptionDto();
        List<DeptdescriptionDto> deptdescriptionDtos = sysDeptDao.listDesc(deptdescriptionDto2,null);
        for (DeptdescriptionDto deptdescriptionDto : deptdescriptionDtos) {
            map.put(deptdescriptionDto.getAcademyId(),deptdescriptionDto.getAcademyName());
            map.put(deptdescriptionDto.getMajorId(),deptdescriptionDto.getMajorName());
            map.put(deptdescriptionDto.getGradeId(),deptdescriptionDto.getGradeName());
            map.put(deptdescriptionDto.getClassId(),deptdescriptionDto.getClassName());
        }

        for (qMoneyAndInfoListDto qMoneyAndInfoListDto :qMoneyAndInfoListDtos){

            qMoneyAndInfoListDto.setMajorName(map.get(qMoneyAndInfoListDto.getMajorId()));

            qMoneyAndInfoListDto.setGradeName(map.get(qMoneyAndInfoListDto.getGradeId()));

            qMoneyAndInfoListDto.setClassName(map.get(qMoneyAndInfoListDto.getClassId()));
        }
        List<qMoneyAndInfoListDto> collect = qMoneyAndInfoListDtos.stream().filter(item -> listByPid.contains(item.getClassId())).collect(Collectors.toList());
        IPage<qMoneyAndInfoListDto> iPage = page.setRecords(collect);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        redis.set("qMoneyList"+user.getUserId(),JSON.toJSON(collect).toString());
        return new PageUtils(iPage);
    }

    private List<Long> getListByPid(Long pid, List<SysDeptEntity> deptList, List<Long> list) {

        List<DeptListVo> voList = deptList.stream().filter(item -> item.getPid().equals(pid)).map(item -> {
            DeptListVo treeListVo = new DeptListVo();
            list.add(item.getDeptId());
            treeListVo.setId(item.getDeptId());
            treeListVo.setLabel(item.getName());

            treeListVo.setChildren(getListByPid(item.getDeptId(), deptList ,list));
            return treeListVo;
        }).collect(Collectors.toList());

        return list;
    }
}