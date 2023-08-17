package io.renren.modules.edu.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import io.renren.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {
  @Override
  public void insertFill(MetaObject metaObject) {
    this.setFieldValByName("createTime",new Date(),metaObject);
    this.setFieldValByName("updateTime",new Date(),metaObject);
    this.setFieldValByName("isDeleted",Boolean.FALSE,metaObject);
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    this.setFieldValByName("createBy",user.getUserId(),metaObject);
    this.setFieldValByName("updateBy",user.getUserId(),metaObject);
  }

  @Override
  public void updateFill(MetaObject metaObject) {
    SysUserEntity user = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
    this.setFieldValByName("updateTime",new Date(),metaObject);
    this.setFieldValByName("updateBy",user.getUserId(),metaObject);
  }
}
