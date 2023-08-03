package io.renren.modules.edu.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.app.utils.JwtUtils;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.dto.DeptdescriptionDto;
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
        List<DeptdescriptionDto> deptdescriptionDtos = sysDeptDao.listDesc(deptdescriptionDto2);
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
        IPage<qMoneyAndInfoListDto> page1 = new Page<>();
        BeanUtils.copyProperties(page,page1);
        page1.setRecords(qMoneyAndInfoListDtos);
        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();

        redis.set("qMoneyList"+user.getUserId(),JSON.toJSON(qMoneyAndInfoListDtos).toString());
        return new PageUtils(page1);
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
        List<DeptdescriptionDto> deptdescriptionDtos = sysDeptDao.listDesc(deptdescriptionDto2);
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