package io.renren.modules.edu.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@RestController
@RequestMapping("file")
@Slf4j
public class FileController {

    @GetMapping("download/excel/{filename}")
    public void download(HttpServletResponse response, @PathVariable String filename){
        ClassPathResource resource = new ClassPathResource("static/file/"+filename);
        if (resource.exists()) {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-Disposition", "attachment; filename=" + filename);
            try  {
                InputStream inputStream = resource.getInputStream();
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[1000000];
                int b = 0;
                while (b != -1) {
                    b = inputStream.read(buffer);
                    if (b != -1) outputStream.write(buffer, 0, b);
                }
                inputStream.close();
                outputStream.close();
                outputStream.flush();
            } catch (IOException e) {
                log.error(e.getMessage());
            }
        }
    }
}
