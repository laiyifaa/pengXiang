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
        List<String> B_schoolNumbers = stuBaseInfoDao.getAllSchoolNumbers();
        List<String> E_schoolNumbers = stuEmployDao.getAllSchoolNumbers();
        Boolean E_result = false;
        Boolean B_result = false;
        for (StuEmployEntity stuEmployEntity : entities) {
            for (String str : B_schoolNumbers) {
                if (str != null && str.equals(stuEmployEntity.getSchoolNumber())){
                    B_result = true;
                }
            }
            if (B_result) {
                for (String str : E_schoolNumbers) {
                    if (str.equals(stuEmployEntity.getSchoolNumber())) {
                        E_result = true;
                    }
                }
                if (E_result) {
                    QueryWrapper<StuEmployEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq("school_number", stuEmployEntity.getSchoolNumber());
                    stuEmployDao.update(stuEmployEntity, wrapper);
                } else {
                    stuEmployDao.insert(stuEmployEntity);
                }
            }
        }
    }

    @Override
    public StuEmployByPageDto treeSearch(int id, int pageNum, int pageSize) {


        Page<StuInfoEntity> page = new Page<>(pageNum, pageSize);

        QueryWrapper<StuInfoEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("academy_id", id)
                .or()
                .eq("class_id", id)
                .or()
                .eq("major_id", id)
                .or()
                .eq("grade_id", id);
        stuInfoDao.selectPage(page, wrapper);
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
    public StuEmployByPageDto search(SearchDto searchDto,Long academyId) {
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
                            .eq("grade_id", id))
                    .and(w -> {
                        if (searchDto.getName() != null) {
                            w.like("stu_name", searchDto.getName());
                        }
                        if (searchDto.getSchoolNumber() != null) {
                            w.eq("school_number", searchDto.getSchoolNumber());
                        }
                    });
        } else {
            wrapper.and(w -> {
                if (searchDto.getName() != null) {
                    w.like("stu_name", searchDto.getName());
                }
                if (searchDto.getSchoolNumber() != null) {
                    w.eq("school_number", searchDto.getSchoolNumber());
                }
            });
        }

        Page<StuInfoEntity> page = new Page<>(searchDto.getPageNum(), searchDto.getPageSize());

        stuInfoDao.selectPage(page, wrapper);
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
}
