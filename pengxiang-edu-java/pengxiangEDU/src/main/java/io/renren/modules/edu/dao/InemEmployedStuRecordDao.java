package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.entity.InemEmployedStuRecordEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.StuEmployedVo;
import io.renren.modules.edu.vo.StuInternshipVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 *
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2022-11-16 09:55:50
 */
@Mapper
public interface InemEmployedStuRecordDao extends BaseMapper<InemEmployedStuRecordEntity> {

    List<StuEmployedVo> selectEmployedList(IPage<StuEmployedVo> page, @Param("key") String key, @Param("academyId") Long academyId);

  StuEmployedVo getStuEmployedVoById(Long id);

}
