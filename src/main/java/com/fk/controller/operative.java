package com.fk.controller;

import com.fk.bean.TravelBean;
import com.fk.bean.TypeBean;
import com.fk.bean.User;
import com.fk.service.ITravelService;
import com.fk.service.ITypeService;
import com.fk.service.IUserService;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by fengkai on 27/03/17.
 */
@Controller
public class operative {

    @Autowired
    IUserService userService;

    @Autowired
    ITravelService travelService;

    @Autowired
    ITypeService typeService;

    private static final int SIZE = 10;

    @RequestMapping("/operative")
    public String operative(HttpServletRequest request, Map<String, Object> map){
        int count = userService.count();
        int page = 1;
        if(count % SIZE == 0)
            page = count / SIZE;
        else
            page = count / SIZE + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZE);
        map.put("page", page);
        String page_ = request.getParameter("page");
        int toPage;
        if(page_ == null || "".equals(page_)){
            toPage = 1;
        }else {
            toPage = Integer.parseInt(page_);
        }
        if(toPage > page){
            toPage = page;
        }
        map.put("pageNow", toPage);
        int start = (toPage - 1) * SIZE;
        List<User> list = userService.selectByStart(start);
        List<User> user = new ArrayList<>();
        for(User u : list){
            u.setPassword(MD5.decodeMD5(u.getPassword()));
            user.add(u);
        }
        map.put("users", user);
        return "operative/index";
    }


    @RequestMapping("/operative/column")
    public String column(HttpServletRequest request, Map<String, Object> map){

        int count = travelService.count();
        int page = 1;
        if(count % SIZE == 0)
            page = count / SIZE;
        else
            page = count / SIZE + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZE);
        map.put("page", page);
        String page_ = request.getParameter("page");
        int toPage;
        if(page_ == null || "".equals(page_)){
            toPage = 1;
        }else {
            toPage = Integer.parseInt(page_);
        }
        if(toPage > page){
            toPage = page;
        }
        map.put("pageNow", toPage);
        int start = (toPage - 1) * SIZE;
        List<TravelBean> list = travelService.selectByStart(start);
        map.put("travel", list);


        return "/operative/column";
    }

    @RequestMapping("/operative/article")
    public String del(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        travelService.deleteByPrimaryKey(Integer.parseInt(id));

        return column(request, map);
    }
    @RequestMapping("/operative/addarticle")
    public String addarticle(HttpServletRequest request, Map<String, Object> map){

        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);

        return "/operative/book";
    }

    @RequestMapping("/operative/addart")
    public String addart(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String type = request.getParameter("type");
        String area = request.getParameter("area");
        String line = request.getParameter("line");
        String summary = request.getParameter("summary");
        String content = request.getParameter("content");

        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "images";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }
            img = "/travel/images/"+filename;
        }

        TravelBean travelBean = new TravelBean();
        travelBean.setTitle(title);
        travelBean.setCount(0);
        travelBean.setImage(img);
        travelBean.setType(type);
        travelBean.setAuthor(author);
        travelBean.setContext(content);
        travelBean.setLine(line);
        travelBean.setLookcount(0);
        travelBean.setTime(new Date());
        travelBean.setPlace(area);
        travelBean.setSummary(summary);

        travelService.insertSelective(travelBean);
        return addarticle(request, map);
    }

}
