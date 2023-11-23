package io.renren.modules.edu.service;



import io.renren.modules.edu.dto.SearchDto;
import io.renren.modules.edu.dto.StuEmployByPageDto;
import io.renren.modules.edu.dto.StuEmployDto;

import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuEmployEntity;
import io.renren.modules.edu.entity.StuEmployVistEntity;


import java.text.ParseException;
import java.util.List;

public interface EmployService {
     StuEmployByPageDto getStuListDto(int pageNum, int pageSize,Long academyId);
     List<StuEmployVistEntity> getVisitList();
     int changeEmployHandle(StuEmployEntity employEntity);
     int  changeVisitHandle(StuEmployVistEntity stuEmployVistEntity);
    int addVisitHandle(StuEmployVistEntity stuEmployVistEntity);

     void importByList(List<StuEmployEntity> entities);
      StuEmployByPageDto treeSearch(int id,int pageNum,int pageSize,Long academyId);
     StuEmployByPageDto search(SearchDto searchDto,Long academyId) throws ParseException;
     List<StuEmployDto> queryExport(SearchDto searchDto,Long academyId);



}
