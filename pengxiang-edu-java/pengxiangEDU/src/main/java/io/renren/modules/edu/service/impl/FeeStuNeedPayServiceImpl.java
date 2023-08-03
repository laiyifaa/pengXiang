/*
package io.renren.modules.edu.service.impl;

import io.renren.modules.edu.dao.*;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.service.FeeStuNeedPayService;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Service("feeStuNeedPayService")
public class FeeStuNeedPayServiceImpl extends ServiceImpl<FeeStuNeedPayDao, FeeStuNeedPayEntity> implements FeeStuNeedPayService {

    @Resource
    StuBaseInfoDao stuBaseInfoDao;

    @Resource
    FeeStuPaidDao stuPaidDao;

    @Resource
    FeeStuNeedPayDao needPayDao;

    @Resource
    FeeStandardDao standardDao;

    @Resource
    ReduceListStipendDao stipendDao;

    @Resource
    ReduceListEcoDao ecoDao;

    @Resource
    StuDetailInfoDao detailInfoDao;
    @Resource
    SysDeptDao deptDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<FeeStuNeedPayEntity> page = this.page(
                new Query<FeeStuNeedPayEntity>().getPage(params),
                new QueryWrapper<FeeStuNeedPayEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional
    public Map<String, List<StuBaseInfoEntity>> generateNeedPayListsByDeptId(Long deptId, Integer type) {

        SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
        //因为上一学年费用未交齐的，不予生成新一学年的学费支付项的学生
        List<StuBaseInfoEntity> failed = new ArrayList();

        //已经生成过的，放置到重复列表
        List<StuBaseInfoEntity> duplicate = new ArrayList();

        //查出下半年没有毕业的学生
        List<StuBaseInfoEntity> stuNotGraduate = stuBaseInfoDao.getNotGraduateStuByDeptLimited(deptId, type, user.getAcademyId());
        if (stuNotGraduate == null || stuNotGraduate.size() == 0) throw new RuntimeException("没有找到符合要求的学生");

        //查出fee_stu_paid没有交完上一年学费的stu_id set存储
        failed = stuPaidDao.findDidntPayClearly(deptId, type, user.getAcademyId(), getEarlierSchoolYearInfoByDate(new Date()));
        //收集set
        Set<Long> didntPayClearlyIds = new HashSet<>();
        if (failed != null && failed.size() > 0) {
            didntPayClearlyIds = failed.stream().map(item -> item.getStuId()).collect(Collectors.toSet());
        }

        //查出今年已经生成支付清单的学生
        duplicate = needPayDao.getAlreadyGenerateStuInfo(deptId, type, user.getAcademyId(), getSchoolYearInfoByDate(new Date()));
        //收集set
        Set<Long> alreadyGenerateStuIds = new HashSet<>();
        if (duplicate != null && duplicate.size() > 0) {
            alreadyGenerateStuIds = duplicate.stream().map(item -> item.getStuId()).collect(Collectors.toSet());
        }

        //将不符合要求的两种学生，从stuNotGraduate去掉，得到compliance列表
        //成功生成新学年学费列表的学生
        Set<Long> finalDidntPayClearlyIds = didntPayClearlyIds;
        Set<Long> finalAlreadyGenerateStuIds = alreadyGenerateStuIds;

//    for (StuBaseInfoEntity entity : stuNotGraduate) {
//      if (didntPayClearlyIds.contains(entity.getStuId()) || alreadyGenerateStuIds.contains(entity.getStuId())){
//        stuNotGraduate.remove(entity);
//      }
//    }
        List<StuBaseInfoEntity> compliance = stuNotGraduate.stream().map(item -> {
            if (finalDidntPayClearlyIds.contains(item.getStuId()) || finalAlreadyGenerateStuIds.contains(item.getStuId()))
                return null;
            else return item;
        }).collect(Collectors.toList());

        compliance.removeIf(Objects::isNull);

        //为符合条件的同学生成下学期支付列表
        if (compliance.size() > 0 && compliance != null) {
            compliance = compliance.stream().map(item -> {
                //获取收费标准和收费减免
                FeeStandardEntity standardEntity = standardDao.findStandardByStuInfo(item.getAcademyId(), item.getMajorId(),
                        item.getGradeId(), item.getSchoolingLength(),
                        item.getCurrentSchoolYear() + 1, item.getClassType());

                //获取stu_detail中的eco_type and stipend_type
                QueryWrapper<StuDetailInfoEntity> detailWrapper = new QueryWrapper<>();
                detailWrapper.eq("stu_id", item.getStuId());
                StuDetailInfoEntity detailInfo = detailInfoDao.selectOne(detailWrapper);

                //获取两种减免标准
                ReduceListStipendEntity stipendList = stipendDao.selectById(detailInfo.getWaiveType());
                ReduceListEcoEntity ecoList = ecoDao.selectById(detailInfo.getDifficultyType());

                FeeStuNeedPayEntity needPayEntity = new FeeStuNeedPayEntity();
                needPayEntity.setStuId(item.getStuId());
                needPayEntity.setSchoolYear(item.getCurrentSchoolYear() + 1);
                needPayEntity.setStipendReduceType(stipendList.getId());
                needPayEntity.setEcoReduceType(ecoList.getId());
                needPayEntity.setStandardId(standardEntity.getId());
                needPayEntity.setSchoolYearInfo(getSchoolYearInfoByDate(new Date()));
                //10 项费用
                needPayEntity.setBodyExamFee(standardEntity.getBodyExamFee().subtract(ecoList.getReduceBodyExamFee().add(stipendList.getReduceBodyExamFee())));
                needPayEntity.setBedFee(standardEntity.getBedFee().subtract(ecoList.getReduceBedFee().add(stipendList.getReduceBedFee())));
                needPayEntity.setBookFee(standardEntity.getBookFee().subtract(ecoList.getReduceBookFee().add(stipendList.getReduceBookFee())));
                needPayEntity.setCertificateFee(standardEntity.getCertificateFee().subtract(ecoList.getReduceCertificateFee().add(stipendList.getReduceCertificateFee())));
                needPayEntity.setClothesFee(standardEntity.getClothesFee().subtract(ecoList.getReduceClothesFee().add(stipendList.getReduceClothesFee())));
                needPayEntity.setDefenseEduFee(standardEntity.getDefenseEduFee().subtract(ecoList.getReduceDefenseEduFee().add(stipendList.getReduceDefenseEduFee())));
                needPayEntity.setHotelFee(standardEntity.getHotelFee().subtract(ecoList.getReduceHotelFee().add(stipendList.getReduceHotelFee())));
                needPayEntity.setInsuranceFee(standardEntity.getInsuranceFee().subtract(ecoList.getReduceInsuranceFee().add(stipendList.getReduceInsuranceFee())));
                needPayEntity.setPublicFee(standardEntity.getPublicFee().subtract(ecoList.getReducePublicFee().add(stipendList.getReducePublicFee())));
                needPayEntity.setTrainFee(standardEntity.getTrainFee().subtract(ecoList.getReduceTrainFee().add(stipendList.getReduceTrainFee())));

                needPayDao.insert(needPayEntity);

                //新建fee_stu_paid表
                FeeStuPaidEntity feeStuPaidEntity = new FeeStuPaidEntity();
                feeStuPaidEntity.setStuId(item.getStuId());
                feeStuPaidEntity.setFeeNeedPayId(needPayEntity.getId());
                feeStuPaidEntity.setAcademyId(item.getAcademyId());
                feeStuPaidEntity.setFeeStandardId(standardEntity.getId());
                feeStuPaidEntity.setBillInfo(getDeptInfoByDeptId(item.getGradeId(),item.getClassType()));
                feeStuPaidEntity.setFeeStatus(801);

                stuPaidDao.insert(feeStuPaidEntity);
                //学年数加一
                item.setCurrentSchoolYear(item.getCurrentSchoolYear() + 1);
                stuBaseInfoDao.updateById(item);
                return item;
            }).collect(Collectors.toList());
        }
        Map<String, List<StuBaseInfoEntity>> resultMap = new HashMap<>();
        resultMap.put("success", compliance);
        resultMap.put("failed", failed);
        resultMap.put("duplicate", duplicate);

        return resultMap;

    }

    private String getSchoolYearInfoByDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int month = calendar.get(Calendar.MONTH);
        String schoolYearInfo = "";
        int year = calendar.get(Calendar.YEAR);
        String currentYear = Integer.toString(year);
        String nextYear = Integer.toString(year + 1);
        schoolYearInfo = currentYear + "-" + nextYear + "学年";
        return schoolYearInfo;
    }

    private String getEarlierSchoolYearInfoByDate(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int month = calendar.get(Calendar.MONTH);
        String schoolYearInfo = "";
        int year = calendar.get(Calendar.YEAR);
        String earlierYear = Integer.toString(year - 1);
        String currentYear = Integer.toString(year);
        schoolYearInfo = earlierYear + "-" + currentYear + "学年";
        return schoolYearInfo;
    }

    private String getDeptInfoByDeptId(Long gradeId,Integer classType) {

        String result = deptDao.getDeptInfoByDeptId(gradeId);
        if(classType == 0){
          result = result+ "(升学)";
        }else result = result + "(就业)";
        log.debug(result);
        return result;
    }

}
*/
