package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.edu.entity.StuFileEntity;

import java.util.List;

public interface StuFileService extends IService<StuFileEntity> {

    void addOne(String path,Integer type,Long stuId);

    List<StuFileEntity> get(Long stuId, Integer type);

}
