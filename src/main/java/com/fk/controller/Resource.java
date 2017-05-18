package com.fk.controller;

import com.fk.bean.FileBean;
import com.fk.service.ResourceService;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

/**
 * Created by fengkai on 03/05/17.
 */
@Controller
public class Resource {

    private Logger logger = LoggerFactory.getLogger(Resource.class);

    @Autowired
    ResourceService resourceService;

    @RequestMapping("/resource")
    public String resource(HttpServletRequest request, Map<String, Object> map) {

        String page = request.getParameter("page");

        resourceService.resource(page, map);

        return "resource";
    }

    @RequestMapping("/showfile")
    public String showfile(HttpServletRequest request, Map<String, Object> map){
        String num = request.getParameter("id");
        int id = Integer.parseInt(num);
        resourceService.showfile(id, map);

        return "showfile";
    }

    @RequestMapping("/download")
    public void downloadFile(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        FileBean fileBean = resourceService.getFile(Integer.parseInt(id));
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName="+fileBean.getFname());
        try {
            File file=new File(fileBean.getFname());
            System.out.println(file.getAbsolutePath());
            InputStream inputStream=new FileInputStream(fileBean.getUrl());
            System.out.println("11111111111"+file);
            OutputStream os=response.getOutputStream();
            byte[] b=new byte[1024];
            int length;
            while((length=inputStream.read(b))>0){
                os.write(b,0,length);
            }
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
