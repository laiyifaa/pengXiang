package io.renren.modules.edu.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.edu.dao.*;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.dto.StuEmployByPageDto;
import io.renren.modules.edu.dto.StuEmployDto;
import io.renren.modules.edu.entity.*;
import io.renren.modules.edu.service.EmployService;
import io.renren.modules.edu.utils.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service("EmployService")
public class EmployServiceImpl implements EmployService {
    @Resource
    private StuEmployDao stuEmployDao;
    @Resource
    private StuInfoDao stuInfoDao;
    @Resource
    private SysDeptDao sysDeptDao;
    @Resource
    private StuEmployVistDao stuEmployVistDao;
    @Resource
    private StuBaseInfoDao stuBaseInfoDao;

    @Override
    public StuEmployByPageDto getStuListDto(int pageNum, int pageSize,Long academyId) {
        Page<StuInfoEntity> page = new Page<>(pageNum, pageSize);
        if(null != academyId){
            stuInfoDao.selectPage(page, new QueryWrapper<StuInfoEntity>().eq("is_deleted",0).eq("academy_id",academyId));
        }else {
            stuInfoDao.selectPage(page, new QueryWrapper<StuInfoEntity>().eq("is_deleted",0));
        }

        List<StuEmployDto> stuEmployDtoList = new ArrayList<>();
        QueryWrapper<StuEmployEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("school_number", page.getRecords().stream().map(StuInfoEntity::getSchoolNumber).collect(Collectors.toList()));
        List<StuEmployEntity> stuEmployList = stuEmployDao.selectList(queryWrapper);
        Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));

        List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
        Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
        for (SysDeptEntity sysDeptEntity : sysDeptList) {
            sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
        }

        for (StuInfoEntity stuInfoEntity : page.getRecords()) {
            StuEmployDto stuEmployDto = new StuEmployDto();
            stuEmployDto.setName(stuInfoEntity.getStuName());
            stuEmployDto.setPhone(stuInfoEntity.getPhone());
            stuEmployDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
            stuEmployDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
            stuEmployDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
            stuEmployDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
            stuEmployDto.setSerNum(stuInfoEntity.getStuId());
            stuEmployDto.setAge(stuInfoEntity.getBirthday());
            stuEmployDto.setEmail(stuInfoEntity.getEmail());
            stuEmployDto.setGender(stuInfoEntity.getGender());
            stuEmployDto.setIdNumber(stuEmployDto.getIdNumber());
            stuEmployDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
            stuEmployDto.setNation(stuInfoEntity.getNation());
            stuEmployDto.setNativePlace(stuInfoEntity.getNativePlace());
            stuEmployDto.setClassType(stuInfoEntity.getClassType());
            stuEmployDto.setResidenceType(stuInfoEntity.getResidenceType());
            stuEmployDto.setIdNumber(stuInfoEntity.getIdNumber());

            Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
            Long deptId = Long.valueOf(stuInfoEntity.getDeptId());
            Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
            Long classId = Long.valueOf(stuInfoEntity.getClassId());

            stuEmployDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
            stuEmployDto.setDeptName(sysDeptMap.getOrDefault(deptId, ""));
            stuEmployDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
            stuEmployDto.setClassName(sysDeptMap.getOrDefault(classId, ""));

            StuEmployEntity stuEmployEntity = stuEmployMap.get(stuInfoEntity.getSchoolNumber());
            if (stuEmployEntity == null) {
                stuEmployDto.setFormalIncome(null);
                stuEmployDto.setLeaveDate(null);
                stuEmployDto.setLeaveReason(null);
                stuEmployDto.setProbationIncome(null);
                stuEmployDto.setEmployOrg(null);
                stuEmployDto.setEmployPost(null);
                stuEmployDto.setPostLeader(null);

            } else {
                stuEmployDto.setFormalIncome(stuEmployEntity.getFormalIncome());
                stuEmployDto.setLeaveDate(stuEmployEntity.getLeaveDate());
                stuEmployDto.setLeaveReason(stuEmployEntity.getLeaveReason());
                stuEmployDto.setProbationIncome(stuEmployEntity.getProbationIncome());
                stuEmployDto.setEmployOrg(stuEmployEntity.getEmployOrg());
                stuEmployDto.setEmployPost(stuEmployEntity.getEmployPost());
                stuEmployDto.setPostLeader(stuEmployEntity.getPostLeader());
            }

            stuEmployDtoList.add(stuEmployDto);
        }
        StuEmployByPageDto stuEmployByPageDto = new StuEmployByPageDto();
        stuEmployByPageDto.setList(stuEmployDtoList);
        stuEmployByPageDto.setTotal(page.getTotal());

        return stuEmployByPageDto;
    }

    @Override
    public List<StuEmployVistEntity> getVisitList() {
        return stuEmployVistDao.selectList(null);
    }


    @Override
    public int changeEmployHandle(StuEmployEntity employEntity) {
        UpdateWrapper<StuEmployEntity> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("school_number", employEntity.getSchoolNumber());
        int result = stuEmployDao.update(employEntity, updateWrapper);
        return result;
    }

    @Override
    public int changeVisitHandle(StuEmployVistEntity stuEmployVistEntity) {
        return stuEmployVistDao.updateById(stuEmployVistEntity);
    }

    @Override
    public int addVisitHandle(StuEmployVistEntity stuEmployVistEntity) {
        return stuEmployVistDao.insert(stuEmployVistEntity);
    }

    @Override
    public void importByList(List<StuEmployEntity> entities) {
        List<String> B_idNumbers = stuBaseInfoDao.getAllIdNumber();
        List<String> E_idNumbers = stuEmployDao.getAllIdNumbers();
        Boolean E_result = false;
        Boolean B_result = false;
        for (StuEmployEntity stuEmployEntity : entities) {
            for (String str : B_idNumbers) {
                if (str != null && str.equals(stuEmployEntity.getIdNumber())){
                    B_result = true;
                }
            }
            if (B_result) {
                for (String str : E_idNumbers) {
                    if (str.equals(stuEmployEntity.getIdNumber())) {
                        E_result = true;
                    }
                }
                if (E_result) {
                    QueryWrapper<StuEmployEntity> wrapper = new QueryWrapper<>();
//                    wrapper.eq("school_number", stuEmployEntity.getSchoolNumber());
                    wrapper.eq("id_Number",stuEmployEntity.getIdNumber());
                    stuEmployDao.update(stuEmployEntity, wrapper);
                } else {
                    stuEmployDao.insert(stuEmployEntity);
                }
            }
        }
    }

    @Override
    public StuEmployByPageDto treeSearch(int id, int pageNum, int pageSize,Long academyId) {
        Page<StuInfoEntity> page=new Page<>(pageNum,pageSize);

        QueryWrapper<StuInfoEntity> wrapper=new QueryWrapper<>();
        if(null != academyId){
            wrapper.eq("is_deleted",0).eq("academy_id",academyId);
        }else {
            wrapper.eq("is_deleted",0);
        }

        wrapper.and(w -> w.eq("academy_id", id)
                .or()
                .eq("class_id", id)
                .or()
                .eq("major_id", id)
                .or()
                .eq("grade_id", id));

        stuInfoDao.selectPage(page,wrapper);
        if (page.getRecords().size() != 0) {
            List<StuEmployDto> stuEmployDtoList = new ArrayList<>();
            QueryWrapper<StuEmployEntity> queryWrapper = new QueryWrapper<>();
            queryWrapper.in("school_number", page.getRecords().stream().map(StuInfoEntity::getSchoolNumber).collect(Collectors.toList()));
            List<StuEmployEntity> stuEmployList = stuEmployDao.selectList(queryWrapper);
            Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));

            List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
            Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
            for (SysDeptEntity sysDeptEntity : sysDeptList) {
                sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
            }

            for (StuInfoEntity stuInfoEntity : page.getRecords()) {
                StuEmployDto stuEmployDto = new StuEmployDto();
                stuEmployDto.setName(stuInfoEntity.getStuName());
                stuEmployDto.setPhone(stuInfoEntity.getPhone());
                stuEmployDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                stuEmployDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                stuEmployDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                stuEmployDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                stuEmployDto.setSerNum(stuInfoEntity.getStuId());
                stuEmployDto.setAge(stuInfoEntity.getBirthday());
                stuEmployDto.setEmail(stuInfoEntity.getEmail());
                stuEmployDto.setGender(stuInfoEntity.getGender());
                stuEmployDto.setIdNumber(stuEmployDto.getIdNumber());
                stuEmployDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                stuEmployDto.setNation(stuInfoEntity.getNation());
                stuEmployDto.setNativePlace(stuInfoEntity.getNativePlace());
                stuEmployDto.setClassType(stuInfoEntity.getClassType());
                stuEmployDto.setResidenceType(stuInfoEntity.getResidenceType());
                stuEmployDto.setIdNumber(stuInfoEntity.getIdNumber());

                Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                Long deptId = Long.valueOf(stuInfoEntity.getDeptId());
                Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                Long classId = Long.valueOf(stuInfoEntity.getClassId());

                stuEmployDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                stuEmployDto.setDeptName(sysDeptMap.getOrDefault(deptId, ""));
                stuEmployDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                stuEmployDto.setClassName(sysDeptMap.getOrDefault(classId, ""));

                StuEmployEntity stuEmployEntity = stuEmployMap.get(stuInfoEntity.getSchoolNumber());
                if (stuEmployEntity == null) {
                    stuEmployDto.setFormalIncome(null);
                    stuEmployDto.setLeaveDate(null);
                    stuEmployDto.setLeaveReason(null);
                    stuEmployDto.setProbationIncome(null);
                    stuEmployDto.setEmployOrg(null);
                    stuEmployDto.setEmployPost(null);
                    stuEmployDto.setPostLeader(null);

                } else {
                    stuEmployDto.setFormalIncome(stuEmployEntity.getFormalIncome());
                    stuEmployDto.setLeaveDate(stuEmployEntity.getLeaveDate());
                    stuEmployDto.setLeaveReason(stuEmployEntity.getLeaveReason());
                    stuEmployDto.setProbationIncome(stuEmployEntity.getProbationIncome());
                    stuEmployDto.setEmployOrg(stuEmployEntity.getEmployOrg());
                    stuEmployDto.setEmployPost(stuEmployEntity.getEmployPost());
                    stuEmployDto.setPostLeader(stuEmployEntity.getPostLeader());
                }

                stuEmployDtoList.add(stuEmployDto);
            }

            StuEmployByPageDto stuEmployByPageDto = new StuEmployByPageDto();
            stuEmployByPageDto.setList(stuEmployDtoList);
            stuEmployByPageDto.setTotal(page.getTotal());


            return stuEmployByPageDto;

        }
        return null;
    }

    @Override
    public StuEmployByPageDto search(SearchDto searchDto,Long academyId) throws ParseException {
        QueryWrapper<StuInfoEntity> wrapper = new QueryWrapper<>();


        if(null != academyId){
            wrapper.eq("is_deleted",0).eq("academy_id",academyId);
        }else {
            wrapper.eq("is_deleted",0);
        }


        if (searchDto.getId() != null) {
            int id = Integer.parseInt(searchDto.getId());
            wrapper.and(w -> w.eq("academy_id", id)
                            .or()
                            .eq("class_id", id)
                            .or()
                            .eq("major_id", id)
                            .or()
                            .eq("grade_id", id));
            if(searchDto.getName()!=null||searchDto.getSchoolNumber()!=null){
                wrapper.and(w -> {
                    w.like(searchDto.getName()!=null,"stu_name", searchDto.getName());
                    w.eq(searchDto.getSchoolNumber()!=null,"school_number", searchDto.getSchoolNumber());
                });
            }

        } else {
            wrapper.like(searchDto.getName()!=null,"stu_name", searchDto.getName())
                            .eq(searchDto.getSchoolNumber()!=null,"school_number", searchDto.getSchoolNumber());
        }

        Page<StuInfoEntity> page = new Page<>(searchDto.getPageNum(), searchDto.getPageSize());

        stuInfoDao.selectPage(page, wrapper);

        if (page.getRecords().size() != 0) {



            QueryWrapper<StuEmployEntity> stuEmployEntityQueryWrapper = new QueryWrapper<>();
            stuEmployEntityQueryWrapper.eq(searchDto.getLeaveDate() != null, "leave_date",  searchDto.getLeaveDate())
                    .eq(searchDto.getLeaveReason() != null, "leave_reason", searchDto.getLeaveReason())
                    .eq(searchDto.getPostLeader() != null, "post_leader", searchDto.getPostLeader())
                    .eq(searchDto.getEmployPost() != null, "employ_post", searchDto.getEmployPost());
            List<StuEmployEntity> stuEmployList = stuEmployDao.selectList(stuEmployEntityQueryWrapper);

            if(searchDto.getLeaveDate() != null||searchDto.getLeaveReason() != null||searchDto.getPostLeader() != null||searchDto.getEmployPost() != null||searchDto.getIsPost()!=null||searchDto.getIsSecondEmploy()!=null){

                QueryWrapper<StuEmployVistEntity> stuEmployVistEntityQueryWrapper=new QueryWrapper<>();
                stuEmployVistEntityQueryWrapper.inSql("(school_number, visit_date)", "SELECT school_number, MAX(visit_date) FROM stu_employ_visit GROUP BY school_number");
                stuEmployVistEntityQueryWrapper.eq(searchDto.getIsPost()!=null,"is_post",searchDto.getIsPost())
                        .eq(searchDto.getIsSecondEmploy()!=null,"is_second_employ",searchDto.getIsSecondEmploy());


                 List<String> stuEmployVistNumbers=stuEmployVistDao.selectList(stuEmployVistEntityQueryWrapper).stream()
                         .map(StuEmployVistEntity::getSchoolNumber)
                         .collect(Collectors.toList());

                List<String> stuEmployNumbers = stuEmployList.stream()
                        .map(StuEmployEntity::getSchoolNumber)
                        .collect(Collectors.toList());

                List<StuInfoEntity> filteredStuInfoList = stuInfoDao.selectList(wrapper).stream()
                        .filter(stuInfo -> stuEmployNumbers.contains(stuInfo.getSchoolNumber()) && stuEmployVistNumbers.contains(stuInfo.getSchoolNumber()))
                        .collect(Collectors.toList());

                Page<StuInfoEntity> filteredPage = new Page<>(page.getCurrent(), page.getSize());
                filteredPage.setRecords(filteredStuInfoList);
                filteredPage.setTotal(filteredStuInfoList.size());
               return   getRecords(filteredPage,stuEmployList);


            }
            else{

                Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));
                return    getRecords(page,stuEmployList);
            }
        }
        return null;
    }

    @Override
    public List<StuEmployDto> queryExport(SearchDto searchDto,Long academyId) {

        QueryWrapper<StuInfoEntity> wrapper = new QueryWrapper<>();

        if(null != academyId){
            wrapper.eq("is_deleted",0).eq("academy_id",academyId);
        }else {
            wrapper.eq("is_deleted",0);
        }


            if(searchDto.getPageNum()!=0&&searchDto.getPageSize()!=0){
                Page<StuInfoEntity> page = new Page<>(searchDto.getPageNum(), searchDto.getPageSize());

                if(searchDto.getName() != null||searchDto.getSchoolNumber() != null||searchDto.getId()!=null ){
                    if (searchDto.getId() != null) {
                        if (searchDto.getName()!=null||searchDto.getName()!=null) {
                            int id = Integer.parseInt(searchDto.getId());
                            wrapper.and(w -> w.eq("academy_id", id)
                                            .or()
                                            .eq("class_id", id)
                                            .or()
                                            .eq("major_id", id)
                                            .or()
                                            .eq("grade_id", id))
                                    .and(w -> {
                                        if (searchDto.getName() != null) {
                                            w.like("stu_name", searchDto.getName());
                                        }
                                        if (searchDto.getSchoolNumber() != null) {
                                            w.eq("school_number", searchDto.getSchoolNumber());
                                        }
                                    });
                        }else {
                            int id = Integer.parseInt(searchDto.getId());
                            wrapper.and(w -> w.eq("academy_id", id)
                                    .or()
                                    .eq("class_id", id)
                                    .or()
                                    .eq("major_id", id)
                                    .or()
                                    .eq("grade_id", id));
                        }
                    } else {
                        if (searchDto.getName()!=null||searchDto.getName()!=null) {
                            wrapper.and(w -> {
                                if (searchDto.getName() != null) {
                                    w.like("stu_name", searchDto.getName());
                                }
                                if (searchDto.getSchoolNumber() != null) {
                                    w.eq("school_number", searchDto.getSchoolNumber());
                                }
                            });
                        }else {
                            wrapper=null;
                        }

                    }

                    stuInfoDao.selectPage(page, wrapper);
                }else {
                    stuInfoDao.selectPage(page, wrapper);
                }
                if (page.getRecords().size() != 0) {
                    List<StuEmployDto> stuEmployDtoList = new ArrayList<>();
                    QueryWrapper<StuEmployEntity> queryWrapper = new QueryWrapper<>();
                    queryWrapper.in("school_number", page.getRecords().stream().map(StuInfoEntity::getSchoolNumber).collect(Collectors.toList()));
                    List<StuEmployEntity> stuEmployList = stuEmployDao.selectList(queryWrapper);
                    Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));

                    List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
                    Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
                    for (SysDeptEntity sysDeptEntity : sysDeptList) {
                        sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
                    }

                    for (StuInfoEntity stuInfoEntity : page.getRecords()) {
                        StuEmployDto stuEmployDto = new StuEmployDto();
                        stuEmployDto.setName(stuInfoEntity.getStuName());
                        stuEmployDto.setPhone(stuInfoEntity.getPhone());
                        stuEmployDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                        stuEmployDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                        stuEmployDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                        stuEmployDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                        stuEmployDto.setSerNum(stuInfoEntity.getStuId());
                        stuEmployDto.setAge(stuInfoEntity.getBirthday());
                        stuEmployDto.setEmail(stuInfoEntity.getEmail());
                        stuEmployDto.setGender(stuInfoEntity.getGender());
                        stuEmployDto.setIdNumber(stuEmployDto.getIdNumber());
                        stuEmployDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                        stuEmployDto.setNation(stuInfoEntity.getNation());
                        stuEmployDto.setNativePlace(stuInfoEntity.getNativePlace());
                        stuEmployDto.setClassType(stuInfoEntity.getClassType());
                        stuEmployDto.setResidenceType(stuInfoEntity.getResidenceType());
                        stuEmployDto.setIdNumber(stuInfoEntity.getIdNumber());

                        Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                        Long deptId = Long.valueOf(stuInfoEntity.getDeptId());
                        Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                        Long classId = Long.valueOf(stuInfoEntity.getClassId());

                        stuEmployDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                        stuEmployDto.setDeptName(sysDeptMap.getOrDefault(deptId, ""));
                        stuEmployDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                        stuEmployDto.setClassName(sysDeptMap.getOrDefault(classId, ""));

                        StuEmployEntity stuEmployEntity = stuEmployMap.get(stuInfoEntity.getSchoolNumber());
                        if (stuEmployEntity == null) {
                            stuEmployDto.setFormalIncome(null);
                            stuEmployDto.setLeaveDate(null);
                            stuEmployDto.setLeaveReason(null);
                            stuEmployDto.setProbationIncome(null);
                            stuEmployDto.setEmployOrg(null);
                            stuEmployDto.setEmployPost(null);
                            stuEmployDto.setPostLeader(null);

                        } else {
                            stuEmployDto.setFormalIncome(stuEmployEntity.getFormalIncome());
                            stuEmployDto.setLeaveDate(stuEmployEntity.getLeaveDate());
                            stuEmployDto.setLeaveReason(stuEmployEntity.getLeaveReason());
                            stuEmployDto.setProbationIncome(stuEmployEntity.getProbationIncome());
                            stuEmployDto.setEmployOrg(stuEmployEntity.getEmployOrg());
                            stuEmployDto.setEmployPost(stuEmployEntity.getEmployPost());
                            stuEmployDto.setPostLeader(stuEmployEntity.getPostLeader());
                        }
                        stuEmployDtoList.add(stuEmployDto);
                    }
                    return stuEmployDtoList;
                }
                return null;

            }else {

                List<StuInfoEntity> list=new ArrayList<>();
                if(searchDto.getName() != null||searchDto.getSchoolNumber() != null||searchDto.getId()!=null ){

                    if (searchDto.getId() != null) {
                        if (searchDto.getName()!=null||searchDto.getName()!=null) {
                            int id = Integer.parseInt(searchDto.getId());
                            wrapper.and(w -> w.eq("academy_id", id)
                                            .or()
                                            .eq("class_id", id)
                                            .or()
                                            .eq("major_id", id)
                                            .or()
                                            .eq("grade_id", id))
                                    .and(w -> {
                                        if (searchDto.getName() != null) {
                                            w.like("stu_name", searchDto.getName());
                                        }
                                        if (searchDto.getSchoolNumber() != null) {
                                            w.eq("school_number", searchDto.getSchoolNumber());
                                        }
                                    });
                        }else {
                            int id = Integer.parseInt(searchDto.getId());
                            wrapper.and(w -> w.eq("academy_id", id)
                                    .or()
                                    .eq("class_id", id)
                                    .or()
                                    .eq("major_id", id)
                                    .or()
                                    .eq("grade_id", id));
                        }
                    } else {
                        if (searchDto.getName()!=null||searchDto.getName()!=null) {
                            wrapper.and(w -> {
                                if (searchDto.getName() != null) {
                                    w.like("stu_name", searchDto.getName());
                                }
                                if (searchDto.getSchoolNumber() != null) {
                                    w.eq("school_number", searchDto.getSchoolNumber());
                                }
                            });
                        }else {
                            wrapper=null;
                        }
                    }
                   list=  stuInfoDao.selectList(wrapper);
                }else {
                    list=  stuInfoDao.selectList(wrapper);
                }

                if (list.size() != 0) {
                    List<StuEmployDto> stuEmployDtoList = new ArrayList<>();
                    QueryWrapper<StuEmployEntity> queryWrapper = new QueryWrapper<>();
                    queryWrapper.in("school_number", list.stream().map(StuInfoEntity::getSchoolNumber).collect(Collectors.toList()));
                    List<StuEmployEntity> stuEmployList = stuEmployDao.selectList(queryWrapper);
                    Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));

                    List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
                    Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
                    for (SysDeptEntity sysDeptEntity : sysDeptList) {
                        sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
                    }

                    for (StuInfoEntity stuInfoEntity : list) {
                        StuEmployDto stuEmployDto = new StuEmployDto();
                        stuEmployDto.setName(stuInfoEntity.getStuName());
                        stuEmployDto.setPhone(stuInfoEntity.getPhone());
                        stuEmployDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                        stuEmployDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                        stuEmployDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                        stuEmployDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                        stuEmployDto.setSerNum(stuInfoEntity.getStuId());
                        stuEmployDto.setAge(stuInfoEntity.getBirthday());
                        stuEmployDto.setEmail(stuInfoEntity.getEmail());
                        stuEmployDto.setGender(stuInfoEntity.getGender());
                        stuEmployDto.setIdNumber(stuEmployDto.getIdNumber());
                        stuEmployDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                        stuEmployDto.setNation(stuInfoEntity.getNation());
                        stuEmployDto.setNativePlace(stuInfoEntity.getNativePlace());
                        stuEmployDto.setClassType(stuInfoEntity.getClassType());
                        stuEmployDto.setResidenceType(stuInfoEntity.getResidenceType());
                        stuEmployDto.setIdNumber(stuInfoEntity.getIdNumber());

                        Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                        Long deptId = Long.valueOf(stuInfoEntity.getDeptId());
                        Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                        Long classId = Long.valueOf(stuInfoEntity.getClassId());

                        stuEmployDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                        stuEmployDto.setDeptName(sysDeptMap.getOrDefault(deptId, ""));
                        stuEmployDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                        stuEmployDto.setClassName(sysDeptMap.getOrDefault(classId, ""));

                        StuEmployEntity stuEmployEntity = stuEmployMap.get(stuInfoEntity.getSchoolNumber());
                        if (stuEmployEntity == null) {
                            stuEmployDto.setFormalIncome(null);
                            stuEmployDto.setLeaveDate(null);
                            stuEmployDto.setLeaveReason(null);
                            stuEmployDto.setProbationIncome(null);
                            stuEmployDto.setEmployOrg(null);
                            stuEmployDto.setEmployPost(null);
                            stuEmployDto.setPostLeader(null);

                        } else {
                            stuEmployDto.setFormalIncome(stuEmployEntity.getFormalIncome());
                            stuEmployDto.setLeaveDate(stuEmployEntity.getLeaveDate());
                            stuEmployDto.setLeaveReason(stuEmployEntity.getLeaveReason());
                            stuEmployDto.setProbationIncome(stuEmployEntity.getProbationIncome());
                            stuEmployDto.setEmployOrg(stuEmployEntity.getEmployOrg());
                            stuEmployDto.setEmployPost(stuEmployEntity.getEmployPost());
                            stuEmployDto.setPostLeader(stuEmployEntity.getPostLeader());
                        }
                        stuEmployDtoList.add(stuEmployDto);
                    }
                    return stuEmployDtoList;
                }
                return null;
            }
    }


    public StuEmployByPageDto getRecords(Page<StuInfoEntity> filteredPage,List<StuEmployEntity> stuEmployList) {
        List<StuEmployDto> stuEmployDtoList = new ArrayList<>();
        Map<String, StuEmployEntity> stuEmployMap = stuEmployList.stream().collect(Collectors.toMap(StuEmployEntity::getSchoolNumber, Function.identity()));
        List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
        Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
        for (SysDeptEntity sysDeptEntity : sysDeptList) {
            sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
        }
        for (StuInfoEntity stuInfoEntity : filteredPage.getRecords()) {
            StuEmployDto stuEmployDto = new StuEmployDto();
            stuEmployDto.setName(stuInfoEntity.getStuName());
            stuEmployDto.setPhone(stuInfoEntity.getPhone());
            stuEmployDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
            stuEmployDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
            stuEmployDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
            stuEmployDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
            stuEmployDto.setSerNum(stuInfoEntity.getStuId());
            stuEmployDto.setAge(stuInfoEntity.getBirthday());
            stuEmployDto.setEmail(stuInfoEntity.getEmail());
            stuEmployDto.setGender(stuInfoEntity.getGender());
            stuEmployDto.setIdNumber(stuEmployDto.getIdNumber());
            stuEmployDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
            stuEmployDto.setNation(stuInfoEntity.getNation());
            stuEmployDto.setNativePlace(stuInfoEntity.getNativePlace());
            stuEmployDto.setClassType(stuInfoEntity.getClassType());
            stuEmployDto.setResidenceType(stuInfoEntity.getResidenceType());
            stuEmployDto.setIdNumber(stuInfoEntity.getIdNumber());

            Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
            Long deptId = Long.valueOf(stuInfoEntity.getDeptId());
            Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
            Long classId = Long.valueOf(stuInfoEntity.getClassId());

            stuEmployDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
            stuEmployDto.setDeptName(sysDeptMap.getOrDefault(deptId, ""));
            stuEmployDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
            stuEmployDto.setClassName(sysDeptMap.getOrDefault(classId, ""));

            StuEmployEntity stuEmployEntity = stuEmployMap.get(stuInfoEntity.getSchoolNumber());
            if (stuEmployEntity == null) {
                stuEmployDto.setFormalIncome(null);
                stuEmployDto.setLeaveDate(null);
                stuEmployDto.setLeaveReason(null);
                stuEmployDto.setProbationIncome(null);
                stuEmployDto.setEmployOrg(null);
                stuEmployDto.setEmployPost(null);
                stuEmployDto.setPostLeader(null);

            } else {
                stuEmployDto.setFormalIncome(stuEmployEntity.getFormalIncome());
                stuEmployDto.setLeaveDate(stuEmployEntity.getLeaveDate());
                stuEmployDto.setLeaveReason(stuEmployEntity.getLeaveReason());
                stuEmployDto.setProbationIncome(stuEmployEntity.getProbationIncome());
                stuEmployDto.setEmployOrg(stuEmployEntity.getEmployOrg());
                stuEmployDto.setEmployPost(stuEmployEntity.getEmployPost());
                stuEmployDto.setPostLeader(stuEmployEntity.getPostLeader());
            }

            stuEmployDtoList.add(stuEmployDto);
        }
        StuEmployByPageDto stuEmployByPageDto = new StuEmployByPageDto();
        stuEmployByPageDto.setList(stuEmployDtoList);
        stuEmployByPageDto.setTotal(filteredPage.getTotal());
        return stuEmployByPageDto;
    }
}
