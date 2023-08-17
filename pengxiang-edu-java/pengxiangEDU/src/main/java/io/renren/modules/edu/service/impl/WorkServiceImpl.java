package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dao.StuInfoDao;
import io.renren.modules.edu.dao.StuPracticeDao;
import io.renren.modules.edu.dao.SysDeptDao;
import io.renren.modules.edu.dto.StuWorkByPageDto;
import io.renren.modules.edu.dto.StuWorkDto;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuInfoEntity;
import io.renren.modules.edu.entity.StuPracticeEntity;
import io.renren.modules.edu.entity.SysDeptEntity;
import io.renren.modules.edu.service.WorkService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class WorkServiceImpl implements WorkService {
    @Autowired
    private StuInfoDao stuInfoDao;
    @Autowired
    private SysDeptDao sysDeptDao;
    @Autowired
    private StuPracticeDao stuPracticeDao;
    @Autowired
    private StuBaseInfoDao stuBaseInfoDao;

    @Override
    public StuWorkByPageDto getList(int pageNum,int pageSize,Long academyId) {
        Page<StuInfoEntity> page=new Page<>(pageNum,pageSize);

        if(null != academyId){
            stuInfoDao.selectPage(page, new QueryWrapper<StuInfoEntity>().eq("is_deleted",0).eq("academy_id",academyId));
        }else {
            stuInfoDao.selectPage(page, new QueryWrapper<StuInfoEntity>().eq("is_deleted",0));
        }


        List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
        Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
        for (SysDeptEntity sysDeptEntity : sysDeptList) {
            sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
        }
        List<StuWorkDto> stuWorkDtos=new ArrayList<>();
        for (StuInfoEntity stuInfoEntity :  page.getRecords()){

            StuWorkDto stuWorkDto=new StuWorkDto();
            stuWorkDto.setSerNum(stuInfoEntity.getStuId());
            stuWorkDto.setName(stuInfoEntity.getStuName());
            stuWorkDto.setIdNumber(stuInfoEntity.getIdNumber());
            stuWorkDto.setBirthday(stuInfoEntity.getBirthday());
            stuWorkDto.setGender(stuInfoEntity.getGender());
            stuWorkDto.setNation(stuInfoEntity.getNation());
            stuWorkDto.setNativePlace(stuInfoEntity.getNativePlace());
            stuWorkDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
            stuWorkDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
            stuWorkDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
            stuWorkDto.setEmail(stuInfoEntity.getEmail());

            Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
            Long classId = Long.valueOf(stuInfoEntity.getClassId()) ;
            Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
            Long schoolId= Long.valueOf(stuInfoEntity.getAcademyId());
            Long deptId= Long.valueOf(stuInfoEntity.getDeptId());

            stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
            stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
            stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
            stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId,""));
            stuWorkDto.setDeptName(sysDeptMap.getOrDefault(deptId,""));

            stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
            stuWorkDto.setPhone(stuInfoEntity.getPhone());
            stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
            stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
            stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));
            stuWorkDtos.add(stuWorkDto);
        }
        StuWorkByPageDto stuWorkByPageDto=new StuWorkByPageDto();
        stuWorkByPageDto.setList(stuWorkDtos);
        stuWorkByPageDto.setTotal(page.getTotal());

        return stuWorkByPageDto;

    }

    @Override
    public List<StuPracticeEntity> getPractice() {
        return stuPracticeDao.selectList(null);
    }

    @Override
    public int changePractice(StuPracticeEntity stuPracticeEntity) {
        return stuPracticeDao.updateById(stuPracticeEntity);
    }

    @Override
    public int addPractice(StuPracticeEntity stuPracticeEntity) {
       return stuPracticeDao.insert(stuPracticeEntity);
    }

    @Override
    public StuWorkByPageDto handleTreeSearch(int id,int pageNum,int pageSize,Long academyId) {
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
        if(page.getRecords().size()!=0){
            List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null);// 查询sysDept中的所有数据
            Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
            for (SysDeptEntity sysDeptEntity : sysDeptList) {
                sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
            }
            List<StuWorkDto> stuWorkDtos=new ArrayList<>();
            for (StuInfoEntity stuInfoEntity :  page.getRecords()){

                StuWorkDto stuWorkDto=new StuWorkDto();
                stuWorkDto.setSerNum(stuInfoEntity.getStuId());
                stuWorkDto.setName(stuInfoEntity.getStuName());
                stuWorkDto.setIdNumber(stuInfoEntity.getIdNumber());
                stuWorkDto.setBirthday(stuInfoEntity.getBirthday());
                stuWorkDto.setGender(stuInfoEntity.getGender());
                stuWorkDto.setNation(stuInfoEntity.getNation());
                stuWorkDto.setNativePlace(stuInfoEntity.getNativePlace());
                stuWorkDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                stuWorkDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                stuWorkDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                stuWorkDto.setEmail(stuInfoEntity.getEmail());

                Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                Long classId = Long.valueOf(stuInfoEntity.getClassId()) ;
                Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                Long schoolId= Long.valueOf(stuInfoEntity.getAcademyId());
                Long deptId= Long.valueOf(stuInfoEntity.getDeptId());

                stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
                stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId,""));
                stuWorkDto.setDeptName(sysDeptMap.getOrDefault(deptId,""));

                stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                stuWorkDto.setPhone(stuInfoEntity.getPhone());
                stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
                stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));
                stuWorkDtos.add(stuWorkDto);
            }
            StuWorkByPageDto stuWorkByPageDto=new StuWorkByPageDto();
            stuWorkByPageDto.setList(stuWorkDtos);
            stuWorkByPageDto.setTotal(page.getTotal());
            return stuWorkByPageDto;
        }

        return null;
    }

    @Override
    public StuWorkByPageDto search(SearchDto searchDto,Long academyId) {
        Page<StuInfoEntity> page=new Page<>(searchDto.getPageNum(),searchDto.getPageSize());
        QueryWrapper<StuInfoEntity> wrapper = new QueryWrapper<>();

        if(null != academyId){
            wrapper.eq("is_deleted",0).eq("academy_id",academyId);
        }
        else {
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
        }
        else{
            wrapper.like(searchDto.getName()!=null,"stu_name", searchDto.getName())
                    .eq(searchDto.getSchoolNumber()!=null,"school_number", searchDto.getSchoolNumber());
        }

        stuInfoDao.selectPage(page,wrapper);

        if(page.getRecords().size()!=0){



        if(searchDto.getLeaveDate() != null||searchDto.getPracticeType() != null||searchDto.getPostLeader() != null||searchDto.getPracticeOrg() != null)
        {
            QueryWrapper<StuPracticeEntity> stuPracticeEntityQueryWrapper=new QueryWrapper<>();
            stuPracticeEntityQueryWrapper.eq(searchDto.getLeaveDate() != null,"leave_date",searchDto.getLeaveDate())
                    .eq(searchDto.getPracticeType() != null,"practice_type",searchDto.getPracticeType())
                    .eq(searchDto.getPostLeader() != null,"post_leader",searchDto.getPostLeader())
                    .eq(searchDto.getPracticeOrg() != null,"practice_org",searchDto.getPracticeOrg());
            List<StuPracticeEntity> stuPracticeEntities=  stuPracticeDao.selectList(stuPracticeEntityQueryWrapper);

            List<String> stuPracticeNumbers=stuPracticeEntities.stream()
                    .map(StuPracticeEntity::getSchoolNumber)
                    .collect(Collectors.toList());
            List<StuInfoEntity> stuInfoEntities=stuInfoDao.selectList(wrapper)
                    .stream().filter(stuInfoEntity -> stuPracticeNumbers.contains(stuInfoEntity.getSchoolNumber()))
                    .collect(Collectors.toList());

            Page<StuInfoEntity> filteredPage = new Page<>(page.getCurrent(), page.getSize());
            filteredPage.setRecords(stuInfoEntities);
            filteredPage.setTotal(stuInfoEntities.size());
            List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
            Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
            for (SysDeptEntity sysDeptEntity : sysDeptList) {
                sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
            }

            List<StuWorkDto> stuWorkDtos=new ArrayList<>();

            for (StuInfoEntity stuInfoEntity :  filteredPage.getRecords()){

                StuWorkDto stuWorkDto=new StuWorkDto();
                stuWorkDto.setSerNum(stuInfoEntity.getStuId());
                stuWorkDto.setName(stuInfoEntity.getStuName());
                stuWorkDto.setIdNumber(stuInfoEntity.getIdNumber());
                stuWorkDto.setBirthday(stuInfoEntity.getBirthday());
                stuWorkDto.setGender(stuInfoEntity.getGender());
                stuWorkDto.setNation(stuInfoEntity.getNation());
                stuWorkDto.setNativePlace(stuInfoEntity.getNativePlace());
                stuWorkDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                stuWorkDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                stuWorkDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                stuWorkDto.setEmail(stuInfoEntity.getEmail());

                Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                Long classId = Long.valueOf(stuInfoEntity.getClassId()) ;
                Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                Long schoolId= Long.valueOf(stuInfoEntity.getAcademyId());
                Long deptId= Long.valueOf(stuInfoEntity.getDeptId());

                stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
                stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId,""));
                stuWorkDto.setDeptName(sysDeptMap.getOrDefault(deptId,""));

                stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                stuWorkDto.setPhone(stuInfoEntity.getPhone());
                stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
                stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));
                stuWorkDtos.add(stuWorkDto);
            }
            StuWorkByPageDto stuWorkByPageDto=new StuWorkByPageDto();
            stuWorkByPageDto.setList(stuWorkDtos);
            stuWorkByPageDto.setTotal(filteredPage.getTotal());
            return stuWorkByPageDto;

        }
        else
        {

            List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
            Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
            for (SysDeptEntity sysDeptEntity : sysDeptList) {
                sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
            }

            List<StuWorkDto> stuWorkDtos=new ArrayList<>();

            for (StuInfoEntity stuInfoEntity :  page.getRecords()){

                StuWorkDto stuWorkDto=new StuWorkDto();
                stuWorkDto.setSerNum(stuInfoEntity.getStuId());
                stuWorkDto.setName(stuInfoEntity.getStuName());
                stuWorkDto.setIdNumber(stuInfoEntity.getIdNumber());
                stuWorkDto.setBirthday(stuInfoEntity.getBirthday());
                stuWorkDto.setGender(stuInfoEntity.getGender());
                stuWorkDto.setNation(stuInfoEntity.getNation());
                stuWorkDto.setNativePlace(stuInfoEntity.getNativePlace());
                stuWorkDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                stuWorkDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                stuWorkDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                stuWorkDto.setEmail(stuInfoEntity.getEmail());

                Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                Long classId = Long.valueOf(stuInfoEntity.getClassId()) ;
                Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                Long schoolId= Long.valueOf(stuInfoEntity.getAcademyId());
                Long deptId= Long.valueOf(stuInfoEntity.getDeptId());

                stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
                stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId,""));
                stuWorkDto.setDeptName(sysDeptMap.getOrDefault(deptId,""));

                stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                stuWorkDto.setPhone(stuInfoEntity.getPhone());
                stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
                stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));
                stuWorkDtos.add(stuWorkDto);
            }
            StuWorkByPageDto stuWorkByPageDto=new StuWorkByPageDto();
            stuWorkByPageDto.setList(stuWorkDtos);
            stuWorkByPageDto.setTotal(page.getTotal());
            return stuWorkByPageDto;
        }
   }
                return null;
}

    @Override
    public List<StuWorkDto> queryExport(SearchDto searchDto,Long academyId) {

        QueryWrapper<StuInfoEntity> wrapper = new QueryWrapper<>();

        if(null != academyId){
            wrapper.eq("is_deleted",0).eq("academy_id",academyId);
        }else {
            wrapper.eq("is_deleted",0);
        }


        if(searchDto.getPageNum()!=0&& searchDto.getPageSize()!=0){
            Page<StuInfoEntity> page = new Page<>(searchDto.getPageNum(), searchDto.getPageSize());
            if (searchDto.getName() != null || searchDto.getSchoolNumber() != null || searchDto.getId() != null) {
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
            } else {
                stuInfoDao.selectPage(page, null);
            }
            if (page.getRecords().size() != 0) {
                List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
                Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
                for (SysDeptEntity sysDeptEntity : sysDeptList) {
                    sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
                }
                List<StuWorkDto> stuWorkDtos = new ArrayList<>();
                for (StuInfoEntity stuInfoEntity :  page.getRecords()){

                    StuWorkDto stuWorkDto=new StuWorkDto();
                    stuWorkDto.setSerNum(stuInfoEntity.getStuId());
                    stuWorkDto.setName(stuInfoEntity.getStuName());
                    stuWorkDto.setIdNumber(stuInfoEntity.getIdNumber());
                    stuWorkDto.setBirthday(stuInfoEntity.getBirthday());
                    stuWorkDto.setGender(stuInfoEntity.getGender());
                    stuWorkDto.setNation(stuInfoEntity.getNation());
                    stuWorkDto.setNativePlace(stuInfoEntity.getNativePlace());
                    stuWorkDto.setPoliticalStatus(stuInfoEntity.getPoliticalStatus());
                    stuWorkDto.setHeadTeacher(stuInfoEntity.getHeadTeacher());
                    stuWorkDto.setHeadTeacherPhone(stuInfoEntity.getHeadTeacherPhone());
                    stuWorkDto.setEmail(stuInfoEntity.getEmail());

                    Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                    Long classId = Long.valueOf(stuInfoEntity.getClassId()) ;
                    Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                    Long schoolId= Long.valueOf(stuInfoEntity.getAcademyId());
                    Long deptId= Long.valueOf(stuInfoEntity.getDeptId());

                    stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                    stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
                    stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                    stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId,""));
                    stuWorkDto.setDeptName(sysDeptMap.getOrDefault(deptId,""));

                    stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                    stuWorkDto.setPhone(stuInfoEntity.getPhone());
                    stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                    stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
                    stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));
                    stuWorkDtos.add(stuWorkDto);
                }
                return  stuWorkDtos;

            }
            return null;
        }else {
                List<StuInfoEntity> list=new ArrayList<>();
            if (searchDto.getName() != null || searchDto.getSchoolNumber() != null || searchDto.getId() != null) {
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

               list= stuInfoDao.selectList(wrapper);
            } else {
                list=stuInfoDao.selectList(null);
            }
            if (list.size() != 0) {
                List<SysDeptEntity> sysDeptList = sysDeptDao.selectList(null); // 查询sysDept中的所有数据
                Map<Long, String> sysDeptMap = new HashMap<>(); // 创建一个Map来存储sysDept的数据
                for (SysDeptEntity sysDeptEntity : sysDeptList) {
                    sysDeptMap.put(sysDeptEntity.getDeptId(), sysDeptEntity.getName()); // 将id和name存入Map中
                }
                List<StuWorkDto> stuWorkDtos = new ArrayList<>();
                for (StuInfoEntity stuInfoEntity : list) {
                    StuWorkDto stuWorkDto = new StuWorkDto();
                    stuWorkDto.setSerNum(stuInfoEntity.getStuId());
                    stuWorkDto.setName(stuInfoEntity.getStuName());
                    Long majorId = Long.valueOf(stuInfoEntity.getMajorId());
                    Long classId = Long.valueOf(stuInfoEntity.getClassId());
                    Long gradeId = Long.valueOf(stuInfoEntity.getGradeId());
                    Long schoolId = Long.valueOf(stuInfoEntity.getAcademyId());
                    stuWorkDto.setMajorName(sysDeptMap.getOrDefault(majorId, ""));
                    stuWorkDto.setClassName(sysDeptMap.getOrDefault(classId, ""));
                    stuWorkDto.setGradeName(sysDeptMap.getOrDefault(gradeId, ""));
                    stuWorkDto.setSchoolName(sysDeptMap.getOrDefault(schoolId, ""));
                    stuWorkDto.setSchoolingLength(stuInfoEntity.getSchoolingLength());
                    stuWorkDto.setPhone(stuInfoEntity.getPhone());
                    stuWorkDto.setSchoolNumber(stuInfoEntity.getSchoolNumber());
                    stuWorkDto.setAdmissionDate(stuInfoEntity.getAdmissionDate());
                    stuWorkDto.setTimes(getPracticeCountBySchoolNumber().getOrDefault(stuInfoEntity.getSchoolNumber(), 0));

                    stuWorkDtos.add(stuWorkDto);

                }
                return  stuWorkDtos;

            }
            return null;
        }
    }

    @Override
    public void importByList(List<StuPracticeEntity> entities) {
        List<String> B_schoolNumbers = stuBaseInfoDao.getAllSchoolNumbers();
        List<StuPracticeEntity> stuPracticeEntities  = stuPracticeDao.selectList(null);
        Boolean E_result = false;
        Boolean B_result = false;
        for (StuPracticeEntity stuPracticeEntity : entities) {
            for (String str : B_schoolNumbers) {
                if (str != null && str.equals(stuPracticeEntity.getSchoolNumber())){
                    B_result = true;
                }
            }
            if (B_result) {
                for (StuPracticeEntity stuPractice : stuPracticeEntities) {
                    if (stuPractice.getSchoolNumber().equals(stuPracticeEntity.getSchoolNumber())) {
                        if(stuPractice.getLeaveDate().equals(stuPracticeEntity.getLeaveDate())){
                            E_result = true;
                        }
                    }
                }
                if ("是".equals(stuPracticeEntity.getIsSatisfied())) {
                    stuPracticeEntity.setIsSatisfied("1");
                } else if ("否".equals(stuPracticeEntity.getIsSatisfied())) {
                    stuPracticeEntity.setIsSatisfied("0");
                } else {
                    stuPracticeEntity.setIsSatisfied(null);
                }

                if ("岗位实习".equals(stuPracticeEntity.getPracticeType())) {
                    stuPracticeEntity.setPracticeType( "1");
                } else if ("认识实习".equals(stuPracticeEntity.getPracticeType())) {
                    stuPracticeEntity.setPracticeType("0");
                } else {
                    stuPracticeEntity.setPracticeType(null);
                }
                if (E_result) {
                    QueryWrapper<StuPracticeEntity> wrapper = new QueryWrapper<>();
                    wrapper.eq("school_number", stuPracticeEntity.getSchoolNumber());
                    stuPracticeDao.update(stuPracticeEntity, wrapper);
                } else {
                    stuPracticeDao.insert(stuPracticeEntity);
                }
            }
        }
    }

    public Map<String, Integer> getPracticeCountBySchoolNumber() {
        // 查询所有实习记录
        List<StuPracticeEntity> practiceList = stuPracticeDao.selectList(null);

        // 统计实习次数
        Map<String, Integer> practiceCountMap = new HashMap<>();
        for (StuPracticeEntity practice : practiceList) {
            String studentId = practice.getSchoolNumber();
            practiceCountMap.put(studentId, practiceCountMap.getOrDefault(studentId, 0) + 1);
        }
        return practiceCountMap;
    }
  }


