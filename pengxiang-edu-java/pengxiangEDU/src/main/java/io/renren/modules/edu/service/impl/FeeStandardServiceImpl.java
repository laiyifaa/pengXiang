package io.renren.modules.edu.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.renren.common.utils.R;
import io.renren.common.utils.RedisUtils;
import io.renren.modules.edu.entity.ReduceListEcoEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.AcademyService;
import io.renren.modules.edu.service.SysDeptService;
import io.renren.modules.edu.utils.Methods;
import io.renren.modules.edu.vo.FeeStandardVo;
import io.renren.modules.sys.entity.SysUserEntity;
import io.swagger.models.auth.In;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.FeeStandardDao;
import io.renren.modules.edu.entity.FeeStandardEntity;
import io.renren.modules.edu.service.FeeStandardService;


@Service("feeStandardService")
public class FeeStandardServiceImpl extends ServiceImpl<FeeStandardDao, FeeStandardEntity> implements FeeStandardService {
    @Autowired
    private AcademyService academyService;
    @Autowired
    private SysDeptService sysDeptService;
    @Autowired
    private RedisTemplate redisTemplate;

  @Override
  public void saveFeeStandard(FeeStandardVo vo) {
    QueryWrapper<FeeStandardEntity> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("academy_id",vo.getAcademyId());
    queryWrapper.eq("grade_id",vo.getGradeId());
    queryWrapper.eq("major_id",vo.getMajorId());
    queryWrapper.eq("class_type",vo.getClassType());
    queryWrapper.eq("school_system",vo.getSchoolSystem());
    queryWrapper.eq("school_year",vo.getSchoolYear());
    FeeStandardEntity entity = baseMapper.selectOne(queryWrapper);
    if(entity==null){
      FeeStandardEntity feeStandardEntity = new FeeStandardEntity();

      BeanUtils.copyProperties(vo,feeStandardEntity);
      baseMapper.insert(feeStandardEntity);
    }else throw new RuntimeException("该收费标准已存在，请核实相关条件");
  }

  @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FeeStandardEntity> page = this.page(
                new Query<FeeStandardEntity>().getPage(params),
                new QueryWrapper<FeeStandardEntity>()
        );

        return new PageUtils(page);
    }


    @Override
    public PageUtils selectStuFeePage(Map<String, Object> params) {

      SysUserEntity userEntity = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
      List<FeeStandardVo> feeStandardVos2 = baseMapper.selectStuFeePage();
        List<FeeStandardVo> feeStandardVos = new ArrayList<>();
      if (userEntity.getAcademyId()!=-1L){
         feeStandardVos = feeStandardVos2.stream().filter(item -> {
              return userEntity.getAcademyId().equals(item.getAcademyId());
          }).collect(Collectors.toList());
      }else {
          feeStandardVos = feeStandardVos2;
      }


        String key = params.get("key").toString();
        if (!key.isEmpty()){
            List<FeeStandardVo> collect = feeStandardVos.stream().filter(item -> {
                return key.contains(item.getMajor());
            }).collect(Collectors.toList());

            feeStandardVos = collect;
        }
        for (FeeStandardVo standardVo : feeStandardVos) {
            List<BigDecimal> list = Methods.getBigDecimalList(standardVo);
            BigDecimal sum = BigDecimal.valueOf(Methods.BigDecimalSum(list));
            standardVo.setSum(sum);
        }
        IPage page1 = new Page<FeeStandardVo>(Long.parseLong(params.get("page").toString()),Long.parseLong(params.get("limit").toString()));
        feeStandardVos = feeStandardVos.stream().map(item->{
          if(item.getClassType()==0)item.setClassTypeName("升学");
          else item.setClassTypeName("就业");
          return item;
        }).collect(Collectors.toList());
        page1.setRecords(feeStandardVos);
        page1.setTotal(feeStandardVos.size());
        return new PageUtils(page1);
    }

    @Override
    public List<FeeStandardVo> selectAll() {
        List<FeeStandardVo> feeStandardVos = baseMapper.selectStuFeePage();
        return feeStandardVos;
    }


    @Override
    public List<Long> getSonListVo(Long pid) {
        List<Long> departIds = new ArrayList<>();
        departIds.add(pid);
        List<SysDeptEntity> list = sysDeptService.list();
        Map<Long,SysDeptEntity> map = new HashMap<>();
        for (SysDeptEntity sysDeptEntity : list) {
            map.put(sysDeptEntity.getDeptId(),sysDeptEntity);
        }
        List<Long> depts = getDeptsById(departIds,list,map);
        return depts;
    }

    public List<Long> getDeptsById(List<Long> ids,List<SysDeptEntity> list,Map<Long,SysDeptEntity> sysDeptMap){
        List<Long> newIds = new ArrayList<>();
        if(sysDeptMap.get(ids.get(0)).getDeptType().equals(2)){
            return ids;
        }
        for (Long id : ids) {
            for (SysDeptEntity sysDeptEntity : list) {
                if(sysDeptEntity.getPid().equals(id)){
                    newIds.add(sysDeptEntity.getDeptId());
                }
            }
        }
        return getDeptsById(newIds,list,sysDeptMap);
    }


    @Override
    public PageUtils getFeeStandListVo(Map<String, Object> params,Long pid) {
        List<Long> feeStandListVoAC = getSonListVo(pid);


        List<FeeStandardVo> list1 = baseMapper.selectStuFeePage();
        List<FeeStandardVo> result = list1.stream().filter(item -> {
          item.setClassTypeName(item.getClassType()==0?"升学":"就业");
          return feeStandListVoAC.contains(item.getGradeId());
        }).collect(Collectors.toList());
        for (FeeStandardVo standardVo : result) {
            List<BigDecimal> list = Methods.getBigDecimalList(standardVo);
            BigDecimal sum = BigDecimal.valueOf(Methods.BigDecimalSum(list));
            standardVo.setSum(sum);
        }
        IPage page1 = new Page<FeeStandardVo>(Long.parseLong(params.get("page").toString()),Long.parseLong(params.get("limit").toString()));
        page1.setRecords(result);
        page1.setTotal(result.size());

        return new PageUtils(page1);

    }}
