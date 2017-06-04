package com.fk.controller;

import com.fk.bean.FileBean;
import com.fk.service.BrowseService;
import com.fk.service.CdirectoryService;
import com.fk.service.DocumentService;
import com.fk.service.ResourceService;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
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

    @Autowired
    CdirectoryService cdirectoryService;

    @Autowired
    DocumentService documentService;

    @Autowired
    BrowseService browseService;

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
        if(Login.islogin(request)){
            int userId = Login.getUserId(request);
            browseService.insert(userId, id);
        }
        return "showfile";
    }

    @RequestMapping("/showreviewfile")
    public String showreviewfile(HttpServletRequest request, Map<String, Object> map){
        String num = request.getParameter("id");
        int id = Integer.parseInt(num);
        resourceService.showreviewfile(id, map);
        return "showfile";
    }

    @RequestMapping("/preview")
    public String preview(HttpServletRequest request, Map<String, Object> map){
        String url_transforms = request.getParameter("url_transforms");
        String id = request.getParameter("id");


        return resourceService.preview(url_transforms, id, map);
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

    @RequestMapping("/sendcdirectory")
    public String sendcdirectory(HttpServletRequest request, Map<String, Object> map){
        String num = request.getParameter("id");
        int id = Integer.parseInt(num);
        String name = request.getParameter("fname");
        if(!Login.islogin(request)){
            map.put(CommonConst.ERRORCODE, 13);
            return "login";
        }
        cdirectoryService.insertInfo(id, name, map);

        return "/info/error";
    }

    @RequestMapping("/senddocument")
    public String senddocument(HttpServletRequest request, Map<String, Object> map){
        String num = request.getParameter("id");
        int id = Integer.parseInt(num);
        int uid = 0;
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(CommonConst.USERID.equals(c.getName())){
                uid = Integer.parseInt(c.getValue());
            }
        }if(uid == 0 ) {
            map.put(CommonConst.ERRORCODE, 13);
            return "login";
        }

        documentService.insertInfo(id, uid, map);

        return "/info/error";
    }


}
