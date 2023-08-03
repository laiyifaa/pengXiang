package io.renren.modules.edu.controller;

import io.renren.common.utils.R;
import io.renren.modules.edu.entity.StuStatusChangeInfoEntity;
import io.renren.modules.edu.service.StuChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("stu/change")
public class StuChangeController {
    @Autowired
    private StuChangeService stuChangeService;

    @PostMapping("/save")
    public R handleUpdate(@RequestBody StuStatusChangeInfoEntity StuChange) {
        try {
            stuChangeService.saveStatus(StuChange);
        }catch (Exception e){
            e.printStackTrace();
            return R.error(e.getMessage());
        }
        return R.ok();
     }

     @GetMapping("/info")
    public R info (@RequestParam("stuId") Long stuId){
         List<StuStatusChangeInfoEntity> list = stuChangeService.listByStuId(stuId);
         return R.ok().put("changeList",list);
     }

}
