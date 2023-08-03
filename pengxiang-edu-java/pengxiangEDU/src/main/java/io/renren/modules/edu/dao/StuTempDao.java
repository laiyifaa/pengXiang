package io.renren.modules.edu.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.edu.dto.IdNumberDto;
import io.renren.modules.edu.dto.StuKeyWordDto;
import io.renren.modules.edu.entity.StuTempEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.edu.vo.StuTempVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 招生临时信息
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2023-07-20 16:49:26
 */
@Mapper
public interface StuTempDao extends BaseMapper<StuTempEntity> {
	List<IdNumberDto> idNumberListDto();


	List<StuTempVo> selectStuTempInfo(IPage<StuTempVo>page,StuTempEntity record,@Param("deptId") Long deptId);

	Integer deleteByIds(@Param("idList")List<Long> idList );

	/**
	 * 查询所有学生的关键词信息
	 * @return
	 */
	List<StuKeyWordDto> listAllKey(@Param("keyList") List<String>keyList, @Param("keyType") Integer keyType);

	void batchInsert(@Param("stuList") List<StuTempEntity>   stuList);
}
