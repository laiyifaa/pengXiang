package io.renren.modules.edu.entity;


import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.sql.Date;

@Data
@TableName("pay_sys_user")
public class PaySysUserEntity extends BaseEntity {
    @TableId
    Long id;
    Long stuId;
    String name;
    String username;
    String password;
    String salt;
    String email;
    String mobile;
    Integer status;

}
