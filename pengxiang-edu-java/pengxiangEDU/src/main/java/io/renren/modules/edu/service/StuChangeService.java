package io.renren.modules.edu.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.modules.edu.entity.StuStatusChangeInfoEntity;

import java.util.List;

public interface StuChangeService extends IService<StuStatusChangeInfoEntity> {



     List<StuStatusChangeInfoEntity> listByStuId(Long stuId);

     void saveStatus(StuStatusChangeInfoEntity stuChange) throws Exception;
}
