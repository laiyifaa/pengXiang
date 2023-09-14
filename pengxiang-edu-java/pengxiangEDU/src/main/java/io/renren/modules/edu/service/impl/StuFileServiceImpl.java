package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.edu.dao.StuFileDao;
import io.renren.modules.edu.entity.StuFileEntity;
import io.renren.modules.edu.service.StuFileService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("StuFileService")
public class StuFileServiceImpl extends ServiceImpl<StuFileDao, StuFileEntity> implements StuFileService {
    @Override
    public void addOne(String path, Integer type, Long stuId) {
        StuFileEntity record = new StuFileEntity();
        record.setStuId(stuId);
        record.setPath(path);
        record.setType(type);
        this.baseMapper.delete(new QueryWrapper<StuFileEntity>().eq("stu_id",stuId).eq("type",type));
        this.baseMapper.insert(record);
    }

    @Override
    public List<StuFileEntity> get(Long stuId, Integer type) {

        return this.baseMapper.selectList(new QueryWrapper<StuFileEntity>()
                .eq("is_deleted",0)
                .eq("stu_id",stuId)
                .eq("type",type));
    }
}
