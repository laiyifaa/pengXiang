package io.renren.modules.edu.vo;/**
 * @author augus
 * @create 2022-12-08-14:19
 */

import io.renren.modules.edu.entity.ReduceListEcoEntity;
import io.renren.modules.edu.entity.ReduceListStipendEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName:ReduceListStipendVo
 * @Description:TODO
 * @author Augus
 * @date 2022/12/8 14:19
 * @Version 1.0
 **/
@Data
public class ReduceListStipendVo extends ReduceListStipendEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private String academyName;
}
