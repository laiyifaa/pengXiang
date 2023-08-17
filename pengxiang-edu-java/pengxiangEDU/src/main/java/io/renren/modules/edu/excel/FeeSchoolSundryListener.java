package io.renren.modules.edu.excel;


import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.read.listener.ReadListener;
import com.alibaba.excel.util.ListUtils;
import com.alibaba.excel.util.StringUtils;
import io.renren.modules.edu.entity.StuBaseInfoEntity;
import io.renren.modules.edu.service.FeeSchoolSundryService;
import io.renren.modules.edu.service.StuBaseInfoService;
import io.renren.modules.edu.vo.FeeSundryExportVo;
import io.renren.modules.edu.vo.FeeSundryImportVo;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

/**
 * 模板的读取类
 *
 * @author ischen
 */
// 有个很重要的点 DemoDataListener 不能被spring管理，要每次读取excel都要new,然后里面用到spring可以构造方法传进去
@Slf4j
public class FeeSchoolSundryListener implements ReadListener<FeeSundryImportVo> {
    /**
     * 每隔5条存储数据库，实际使用中可以100条，然后清理list ，方便内存回收
     */
    private static final int BATCH_COUNT = 1024;
    private List<FeeSundryImportVo> cachedDataList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);

    private FeeSchoolSundryService feeSchoolSundryService;

    public FeeSchoolSundryListener(FeeSchoolSundryService feeSchoolSundryService) {
        this.feeSchoolSundryService = feeSchoolSundryService;
    }

    public FeeSchoolSundryListener() {

    }
    /**
     * 这个每一条数据解析都会来调用
     *
     * @param data    one row value. It is same as {@link AnalysisContext#readRowHolder()}
     * @param context
     */
    @Override
    public void invoke(FeeSundryImportVo data, AnalysisContext context) {
        /*log.info("解析到一条数据:{}", JSON.toJSONString(data));*/
        check(data,context);
        cachedDataList.add(data);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (cachedDataList.size() >= BATCH_COUNT) {
            saveData(context);
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
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库
        saveData(context);
        /*log.info("所有数据解析完成！");*/
    }

    /**
     * 加上存储数据库
     */
    private void saveData(AnalysisContext context) {
        /*log.info("{}条数据，开始存储数据库！", cachedDataList.size());*/
        feeSchoolSundryService.importByList(cachedDataList,context);

    }
    private void check(FeeSundryImportVo data, AnalysisContext context){
        if(StringUtils.isEmpty(data.getIdNumber())){
            throw new EmptyDataException("证件号字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
        if(StringUtils.isEmpty(data.getStuName())){
            throw new EmptyDataException("姓名字段为空，第 " + (context.readRowHolder().getRowIndex() + 1) + " 行数据异常！");
        }
    }
}