package io.renren.modules.edu.utils;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;

@Data
public class Query {
    //当前页数
    private Integer page = 1;
    //每页记录数
    private Integer limit = 10;

    public static <T> IPage<T> getPage(Query query) {

        Page<T> page = new Page(query.page, query.limit);
        return page;
    }
}
