package io.renren.modules.edu.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.dto.StuEmployByPageDto;
import io.renren.modules.edu.dto.StuEmployDto;
import io.renren.modules.edu.dto.StuWorkDto;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuEmployVistEntity;
import io.renren.modules.edu.utils.Query;

import java.util.List;

public interface EmployService {
    public StuEmployByPageDto getStuListDto(int pageNum, int pageSize,Long academyId);
    public List<StuEmployVistEntity> getVisitList();
    public int changeEmployHandle(StuEmployEntity employEntity);
    public int  changeVisitHandle(StuEmployVistEntity stuEmployVistEntity);
    int addVisitHandle(StuEmployVistEntity stuEmployVistEntity);

    public void importByList(List<StuEmployEntity> entities);
    public  StuEmployByPageDto treeSearch(int id,int pageNum,int pageSize);
    public StuEmployByPageDto search(SearchDto searchDto,Long academyId);
    public List<StuEmployDto> queryExport(SearchDto searchDto,Long academyId);
}
