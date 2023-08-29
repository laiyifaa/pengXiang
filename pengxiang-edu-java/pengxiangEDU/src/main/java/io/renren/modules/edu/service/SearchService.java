package io.renren.modules.edu.service;

import io.renren.modules.edu.dto.SearchAllDto;
import io.renren.modules.edu.dto.SearchListDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface SearchService {
  public SearchListDto getDate();
  public List<Long> search(List<SearchAllDto> list);
}
