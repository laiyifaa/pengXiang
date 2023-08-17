package io.renren.modules.edu.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.excel.util.ListUtils;

import com.alibaba.excel.util.StringUtils;
import io.renren.modules.edu.service.StuTempService;
import io.renren.modules.edu.vo.StuTempVo;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * @author LZQ
 * @version 1.0
 * @description TODO
 * @date 2023/7/21 19:19
 */
@Slf4j
public class StuTempInfoListener implements ReadListener<StuTempVo> {
    private static final int BATCH_COUNT = 1024;

    private List<StuTempVo> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);

    private StuTempService stuTempService;

    public StuTempInfoListener(StuTempService stuTempService) {
        this.stuTempService = stuTempService;
    }
    public StuTempInfoListener() {

    }

    @Override
    public void invoke(StuTempVo data, AnalysisContext context) {
       /* log.info("解析到一条数据:{}", JSON.toJSONString(data));*/
        check(data,context);
        cachedDataList.add(data);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (cachedDataList.size() >= BATCH_COUNT) {
            saveData();
            // 存储完成清理 list
            cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
        }
    }

    /**
     * 所有数据解析完成了 都会来调用
     *
     * @param context
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context)  {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库

        saveData();
        log.info("所有数据解析完成！");
    }

    /**
     * 加上存储数据库
     */
    private void saveData() {
        /*log.info("{}条数据，开始存储数据库！", cachedDataList.size());*/
        stuTempService.importByList(cachedDataList);



    }
    private void check(StuTempVo data, AnalysisContext context){
        if(StringUtils.isEmpty(data.getIdNumber())){
            throw new EmptyDataException("证件号码字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getIdNumberType())){
            throw new EmptyDataException("证件类型字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getStuName())){
            throw new EmptyDataException("姓名字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getAcademyName())){
            throw new EmptyDataException("院校字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getMajorName())){
            throw new EmptyDataException("专业字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getGradeName())){
            throw new EmptyDataException("年级字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }

    }
}
