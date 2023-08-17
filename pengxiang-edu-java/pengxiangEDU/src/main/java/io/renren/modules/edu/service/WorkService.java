package io.renren.modules.edu.service;

import io.renren.modules.edu.dto.StuWorkByPageDto;
import io.renren.modules.edu.dto.StuWorkDto;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuPracticeEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface WorkService {
    public StuWorkByPageDto getList(int pageNum,int pageSize,Long academyId);
    public List<StuPracticeEntity> getPractice();
    public int changePractice(StuPracticeEntity stuPracticeEntity);
    public int addPractice(StuPracticeEntity stuPracticeEntity);
    public StuWorkByPageDto handleTreeSearch(int id,int pageNum,int pageSize,Long academyId);
    public StuWorkByPageDto search(SearchDto searchDto,Long academyId);
    public List<StuWorkDto>   queryExport(SearchDto searchDto,Long academyId);

    public void importByList(List<StuPracticeEntity> entities);

}
