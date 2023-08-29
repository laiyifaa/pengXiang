package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.EduCertificateEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.CertificateVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:51
 */
@Mapper
public interface EduCertificateDao extends BaseMapper<EduCertificateEntity> {


    Integer deleteByIds(@Param("idList")List<Long> idList );


    List<CertificateVo> selectCertificateVoInfo(IPage<CertificateVo> page, EduCertificateEntity key, @Param("deptId") Long deptId,@Param("deptIdList")List<Long> deptIdList);


    void batchInsert(@Param("cList") List<EduCertificateEntity>   stuList);
}
