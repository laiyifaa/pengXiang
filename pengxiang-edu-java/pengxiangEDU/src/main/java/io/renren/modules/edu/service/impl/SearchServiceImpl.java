package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.edu.dao.FieldsDao;
import io.renren.modules.edu.dao.StuEmployDao;
import io.renren.modules.edu.dao.StuEmployVistDao;
import io.renren.modules.edu.dao.StuPracticeDao;
import io.renren.modules.edu.dto.SearchAllDto;
import io.renren.modules.edu.dto.SearchListDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.service.*;
import io.renren.modules.edu.utils.DateUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    private FieldsDao fieldsDao;
    @Resource
    private StuBaseInfoService stuBaseInfoService;
    @Resource
    private StuTempService stuTempService;
    @Resource
    private StuEmployVistDao stuEmployVistDao;
    @Resource
    private StuEmployDao stuEmployDao;
    @Resource
    private StuPracticeDao stuPracticeDao;
    @Resource
    private EmployService employService;
    @Resource
    private FeeSchoolSundryService feeSchoolSundryService;
    @Resource
    private FeeReturnService feeReturnService;
    @Resource
    private FeeArrearageService feeArrearageService;
    @Resource
    private EduCertificateService eduCertificateService;


    @Override
    public SearchListDto getDate() {
        SearchListDto searchListDto=new SearchListDto();
        searchListDto.setList1(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","1")));
        searchListDto.setList2(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","2")));
        searchListDto.setList3(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","3")));
        searchListDto.setList4(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","4")));
        searchListDto.setList5(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","5")));
        searchListDto.setList6(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","6")));
        searchListDto.setList7(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","7")));
        searchListDto.setList8(fieldsDao.selectList(new QueryWrapper<FieldsEntity>().eq("plate_type","8")));
        return searchListDto;
    }



    @Override
    public List<Long> search(List<SearchAllDto> list) {

        QueryWrapper<StuBaseInfoEntity> StuBaseInfoqueryWrapper = new QueryWrapper<>();
        QueryWrapper<StuTempEntity> StuTempqueryWrapper = new QueryWrapper<>();
        QueryWrapper<StuEmployEntity> StuEmployqueryWrapper = new QueryWrapper<>();
        QueryWrapper<StuPracticeEntity> StuPracticequeryWrapper = new QueryWrapper<>();
        QueryWrapper<FeeSchoolSundryEntity> FeeSchoolSundryQueryWrapper = new QueryWrapper<>();
        QueryWrapper<FeeReturnEntity> FeeReturnQueryWrapper = new QueryWrapper<>();
        QueryWrapper<FeeArrearageEntity> FeeArrearageQueryWrapper = new QueryWrapper<>();
        QueryWrapper<EduCertificateEntity> EduCertificateQueryWrapper = new QueryWrapper<>();
        QueryWrapper<StuEmployVistEntity> stuEmployVistEntityQueryWrapper = new QueryWrapper<>();
        StuBaseInfoqueryWrapper.eq("is_deleted",0);
        StuTempqueryWrapper.eq("is_deleted",0);
        EduCertificateQueryWrapper.eq("is_deleted",0);
        FeeSchoolSundryQueryWrapper.eq("is_deleted",0);
        EduCertificateQueryWrapper.eq("is_deleted",0);
        for (SearchAllDto searchAllDto : list) {
            if (searchAllDto.getItem().getInputType() == 2){
                String value = searchAllDto.getValue();
                String s = DateUtils.dealDateFormat(value);
                searchAllDto.setValue(s);
            }
            if (searchAllDto.getSearchType() == 0){
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    if (searchAllDto.getItem().getInputType()==46 || searchAllDto.getItem().getInputType()==47 ||searchAllDto.getItem().getInputType()==48){
                        stuEmployVistEntityQueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                        stuEmployVistDao.selectList(stuEmployVistEntityQueryWrapper);
                    }else {
                        StuEmployqueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                        stuEmployDao.selectList(StuEmployqueryWrapper);
                    }
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.like(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }else if (searchAllDto.getSearchType() == 2){
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    StuEmployqueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuEmployDao.selectList(StuEmployqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.le(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }else if (searchAllDto.getSearchType() == 3){
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    StuEmployqueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuEmployDao.selectList(StuEmployqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.ge(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }else if (searchAllDto.getSearchType() == 4){
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    StuEmployqueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuEmployDao.selectList(StuEmployqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.gt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }else if (searchAllDto.getSearchType() == 5){
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    StuEmployqueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuEmployDao.selectList(StuEmployqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.lt(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }
            else {
                if (searchAllDto.getItem().getPlateType()==1){
                    StuBaseInfoqueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuBaseInfoService.list(StuBaseInfoqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 2){
                    StuTempqueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuTempService.list(StuTempqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 3){
                    StuEmployqueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuEmployDao.selectList(StuEmployqueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 4){
                    StuPracticequeryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    stuPracticeDao.selectList(StuPracticequeryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 5){
                    FeeSchoolSundryQueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 6){
                    FeeReturnQueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeReturnService.list(FeeReturnQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 7){
                    FeeArrearageQueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    feeArrearageService.list(FeeArrearageQueryWrapper);
                }
                else if (searchAllDto.getItem().getPlateType() == 8){
                    EduCertificateQueryWrapper.eq(searchAllDto.getItem().getFieldsDatabaseName(),searchAllDto.getValue());
                    eduCertificateService.list(EduCertificateQueryWrapper);
                }
            }
        }
        List<StuBaseInfoEntity> StuBaseInfoList = new ArrayList<>();
        if (StuBaseInfoqueryWrapper.getParamNameValuePairs().size() != 0){
            StuBaseInfoList = stuBaseInfoService.list(StuBaseInfoqueryWrapper);
        }
        List<StuTempEntity> stuTempEntityList = new ArrayList<>();
        if (StuTempqueryWrapper.getParamNameValuePairs().size() != 0){
            stuTempEntityList = stuTempService.list(StuTempqueryWrapper);
        }
        List<FeeSchoolSundryEntity> feeSchoolSundryEntityList = new ArrayList<>();
        if (FeeSchoolSundryQueryWrapper.getParamNameValuePairs().size() != 0){
            feeSchoolSundryEntityList = feeSchoolSundryService.list(FeeSchoolSundryQueryWrapper);
        }
        List<FeeReturnEntity> feeReturnEntityList = new ArrayList<>();
        if (FeeReturnQueryWrapper.getParamNameValuePairs().size() != 0){
            feeReturnEntityList = feeReturnService.list(FeeReturnQueryWrapper);
        }
        List<FeeArrearageEntity> feeArrearageEntityList = new ArrayList<>();
        if (FeeArrearageQueryWrapper.getParamNameValuePairs().size() != 0){
            feeArrearageEntityList = feeArrearageService.list(FeeArrearageQueryWrapper);
        }
        List<EduCertificateEntity> eduCertificateEntityList = new ArrayList<>();
        if (EduCertificateQueryWrapper.getParamNameValuePairs().size() != 0){
            eduCertificateEntityList = eduCertificateService.list(EduCertificateQueryWrapper);
        }
        List<StuEmployEntity> stuEmployEntities= new ArrayList<>();
        if (StuEmployqueryWrapper.getParamNameValuePairs().size() != 0){
             stuEmployEntities = stuEmployDao.selectList(StuEmployqueryWrapper);
        }

        List<StuEmployVistEntity> stuEmployVistEntityList = new ArrayList<>();
        if (stuEmployVistEntityQueryWrapper.isEmptyOfEntity()){
            stuEmployVistEntityList = stuEmployVistDao.selectList(stuEmployVistEntityQueryWrapper);
        }

        List<StuPracticeEntity> stuPracticeEntities = new ArrayList<>();
        if (StuPracticequeryWrapper.getParamNameValuePairs().size() != 0){
             stuPracticeEntities = stuPracticeDao.selectList(StuPracticequeryWrapper);
        }
        List<List<Long>> IdList = new ArrayList<>();

        List<Long> IdListVisit = new ArrayList<>();
        for (StuEmployVistEntity stuEmployVistEntity : stuEmployVistEntityList) {
            if (!IdListVisit.contains(stuEmployVistEntity.getStuId())){
                IdListVisit.add(stuEmployVistEntity.getStuId());
            }
        }

        List<Long> IdList1 = new ArrayList<>();
        for (StuEmployEntity stuEmployEntity : stuEmployEntities) {

            if (!IdList1.contains(stuEmployEntity.getStuId())){
                IdList1.add(stuEmployEntity.getStuId());
            }
        }
        List<Long> IdList2 = new ArrayList<>();
        for (StuPracticeEntity stuPracticeEntity : stuPracticeEntities) {

            if (!IdList2.contains(stuPracticeEntity.getStuId())){
                IdList2.add(stuPracticeEntity.getStuId());
            }
        }
        List<Long> IdList3 = new ArrayList<>();
        for (StuBaseInfoEntity stuBaseInfoEntity : StuBaseInfoList) {

            if (!IdList3.contains(stuBaseInfoEntity.getStuId())){
                IdList3.add(stuBaseInfoEntity.getStuId());
            }
        }
        List<Long> IdList4 = new ArrayList<>();
        for (StuTempEntity stuTempEntity : stuTempEntityList) {
            LambdaQueryWrapper<StuBaseInfoEntity> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(StuBaseInfoEntity::getIdNumber,stuTempEntity.getIdNumber());
            StuBaseInfoEntity one = stuBaseInfoService.getOne(lambdaQueryWrapper);
            if (one != null){
                if (!IdList4.contains(one.getStuId())){
                    IdList4.add(one.getStuId());
                }
            }
        }
        List<Long> IdList5 = new ArrayList<>();
        for (FeeSchoolSundryEntity feeSchoolSundryEntity : feeSchoolSundryEntityList) {
            if (!IdList5.contains(feeSchoolSundryEntity.getStuId())){
                IdList5.add(feeSchoolSundryEntity.getStuId());
            }
        }
        List<Long> IdList6 = new ArrayList<>();
        for (FeeReturnEntity feeReturnEntity : feeReturnEntityList) {
            if (!IdList6.contains(feeReturnEntity.getStuId())){
                IdList6.add(feeReturnEntity.getStuId());
            }
        }
        List<Long> IdList7 = new ArrayList<>();
        for (FeeArrearageEntity feeArrearageEntity : feeArrearageEntityList) {
            if (!IdList7.contains(feeArrearageEntity.getStuId())){
                IdList7.add(feeArrearageEntity.getStuId());
            }
        }
        List<Long> IdList8 = new ArrayList<>();
        for (EduCertificateEntity eduCertificateEntity : eduCertificateEntityList) {
            if (!IdList8.contains(eduCertificateEntity.getStuId())){
                IdList8.add(eduCertificateEntity.getStuId());
            }
        }
        IdList.add(IdList1);
        IdList.add(IdList2);
        IdList.add(IdList3);
        IdList.add(IdList4);
        IdList.add(IdList5);
        IdList.add(IdList6);
        IdList.add(IdList7);
        IdList.add(IdList8);
        IdList.add(IdListVisit);
        List<Long> intersection = getIntersection(IdList);
        return intersection;
    }
    public static List<Long> getIntersection(List<List<Long>> lists) {
        if(lists == null || lists.size() == 0){
            return null;
        }
        ArrayList<List<Long>> arrayList = new ArrayList<>(lists);
        for (int i = 0; i < arrayList.size(); i++) {
            List<Long> list = arrayList.get(i);
            // 去除空集合
            if (list == null || list.size() == 0) {
                arrayList.remove(list);
                i-- ;
            }
        }
        // 都是空集合，返回null
        if(arrayList.size() == 0){
            return null;
        }
        List<Long> intersection = arrayList.get(0) ;
        // 只有一个非空集合，结果就是它本身
        if(arrayList.size() == 1){
            return intersection;
        }
        // 有多个非空集合，直接挨个求交集
        for (int i = 1; i < arrayList.size(); i++) {
            intersection.retainAll(arrayList.get(i));
        }
        return intersection;
    }
}
