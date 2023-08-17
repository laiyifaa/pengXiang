package io.renren.modules.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.modules.edu.dao.FeeReturnDao;
import io.renren.modules.edu.dao.StuBaseInfoDao;
import io.renren.modules.edu.dao.StuChangeDao;
import io.renren.modules.edu.entity.FeeReturnEntity;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.entity.StuStatusChangeInfoEntity;
import io.renren.modules.edu.entity.constant.CURRENT_STATUS;
import io.renren.modules.edu.service.StuChangeService;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service("StuChangeService")
public class StuChangeServiceImpl extends ServiceImpl<StuChangeDao, StuStatusChangeInfoEntity> implements StuChangeService {
    @Resource
    private StuBaseInfoDao stuBaseInfoDao;

    @Resource
    private FeeReturnDao feeReturnDao;

    @Override
    public List<StuStatusChangeInfoEntity> listByStuId(Long stuId) {
        List<StuStatusChangeInfoEntity> list = this.baseMapper.selectList(new QueryWrapper<StuStatusChangeInfoEntity>().eq("stu_id", stuId).eq("is_deleted", 0).orderByDesc("update_time"));
        if(null == list || list.size() == 0)
            return new LinkedList<>();
        return list;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveStatus(StuStatusChangeInfoEntity stuChange) throws Exception{
        if(null == stuChange.getNewCurrentStatus() || null == stuChange.getNewSchoolRollStatus())
            throw new Exception("变更后状态不能为空");
        SysUserEntity sysUser = (SysUserEntity)SecurityUtils.getSubject().getPrincipal();
        stuChange.setUpdateBy(sysUser.getUserId());
        StuBaseInfoEntity record = new StuBaseInfoEntity();
        record.setStuId(stuChange.getStuId());
        record.setUpdateBy(sysUser.getUserId());
        record.setUpdateTime(new Date());
        record.setCurrentStatus(stuChange.getNewCurrentStatus());
        record.setSchoolRollStatus(stuChange.getNewSchoolRollStatus());
        if(stuChange.getId() == null || stuChange.getId() <= 0){
            stuChange.setCreateBy(sysUser.getUserId());
            stuChange.setCreateTime(new Date());
            stuChange.setIsDeleted(false);
            this.baseMapper.addStatusChange(stuChange);
        }else {
            if(null == stuChange.getUpdateTime()){
                stuChange.setUpdateTime(new Date());
            }
            this.updateById(stuChange);
        }
        stuBaseInfoDao.updateById(record);
        /*if(CURRENT_STATUS.WITHDRAWN.getValue() == record.getCurrentStatus()){
            FeeReturnEntity feeReturnEntity = new FeeReturnEntity();
            feeReturnEntity.setStuId(record.getStuId());
            feeReturnDao.insert(feeReturnEntity);
        }*/
    }
}
