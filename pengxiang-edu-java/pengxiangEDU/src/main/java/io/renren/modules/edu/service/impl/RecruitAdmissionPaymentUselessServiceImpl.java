/*
package io.renren.modules.edu.service.impl;

import io.renren.modules.edu.entity.StuTempEntity;
import io.renren.modules.edu.service.StuTempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.edu.dao.RecruitAdmissionPaymentUselessDao;
import io.renren.modules.edu.entity.RecruitAdmissionPaymentUselessEntity;
import io.renren.modules.edu.service.RecruitAdmissionPaymentUselessService;


@Service("recruitAdmissionPaymentUselessService")
public class RecruitAdmissionPaymentUselessServiceImpl extends ServiceImpl<RecruitAdmissionPaymentUselessDao, RecruitAdmissionPaymentUselessEntity> implements RecruitAdmissionPaymentUselessService {

 */
/*   @Autowired
    private StuTempService stuTempService;*//*


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<RecruitAdmissionPaymentUselessEntity> page = this.page(
                new Query<RecruitAdmissionPaymentUselessEntity>().getPage(params),
                new QueryWrapper<RecruitAdmissionPaymentUselessEntity>()
        );
        //List<RecruitAdmissionPaymentUselessVo> list = new ArrayList<>();
        List<RecruitAdmissionPaymentUselessEntity> records = page.getRecords();
        for (RecruitAdmissionPaymentUselessEntity record : records) {
            //RecruitAdmissionPaymentUselessVo rv = new RecruitAdmissionPaymentUselessVo();
            //BeanUtils.copyProperties(record,rv);
            Long stuId = record.getStuId();
            StuTempEntity stuTempEntity = new StuTempEntity();
            stuTempEntity = stuTempService.getById(stuId);
            record.setStuname(stuTempEntity.getStuName());
            //rv.setStuname(stuTempEntity.getStuName());
            //list.add(rv);
        }
        //page.setRecords(list);
        return new PageUtils(page);
    }

}
*/
