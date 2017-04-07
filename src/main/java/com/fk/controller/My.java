package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 05/04/17.
 */
@Controller
public class My {

    @Autowired
    IUserService userService;

    @Autowired
    ITypeService typeService;

    @Autowired
    IProvinceService provinceService;

    @Autowired
    IContinentService continentService;

    @Autowired
    IUsertravelService usertravelService;


    @Autowired
    IAuditService auditService;


    @RequestMapping(value = "addarticle")
    public String addarticle(HttpServletRequest request, Map<String, Object> map){
        if(!Login.islogin(request)){
            return "login";
        }else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);
        List<String> spe = new ArrayList<>();
        List<ProvinceBean> provinceBeanList = provinceService.selectAll();
        List<ContinentBean> continentBeanList = continentService.selectAll();
        for(ProvinceBean p : provinceBeanList){
            spe.add(p.getProvince());
        }
        for(ContinentBean c : continentBeanList){
            spe.add(c.getContinent());
        }
        map.put("spe", spe);
        map.put("index", CommonConst.FIVE_INT);
        return "/operative/user";
    }
    @RequestMapping(value = "my")
    public String my(HttpServletRequest request, Map<String, Object> map){

        if(!Login.islogin(request)){
            return "login";
        }else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(CommonConst.USERID.equals(c.getName())){
                userId = c.getValue();
            }
        }
        User user = userService.selectUserByID(Integer.parseInt(userId));

        map.put("index", CommonConst.FIVE_INT);
        map.put("user", user);

        List<UsertravelBean> usertravelBeans = usertravelService.selectByUserId(user.getId());
        if(usertravelBeans == null || usertravelBeans.size() == 0){
            map.put(CommonConst.STATUS, "0");
        }else{
            map.put(CommonConst.STATUS, "1");
        }

        return "my";
    }


    @RequestMapping("/operative/useraddart")
    public String useraddart(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){
        try{
            if(!Login.islogin(request)){
                return "login";
            }else{
                map.put(CommonConst.LOGIN, CommonConst.YES);
            }

            Cookie[] cookies = request.getCookies();
            String userId = "";
            for(Cookie c : cookies){
                if(CommonConst.USERID.equals(c.getName())){
                    userId = c.getValue();
                }
            }
            User user = userService.selectUserByID(Integer.parseInt(userId));
            String title = request.getParameter("title");
            String author =  user.getUsername();
            String type = request.getParameter("type");
            String area = request.getParameter("area");
            String line = request.getParameter("line");
            String summary = request.getParameter("summary");
            String content = request.getParameter("content");
            String spe = request.getParameter("spe");

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

            AuditBean travelBean = new AuditBean();
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
            travelBean.setSmallimage(spe);
            auditService.insertSelective(travelBean);

            UsertravelBean usertravelBean = new UsertravelBean();
            usertravelBean.setUserid(Integer.parseInt(userId));
            usertravelBean.setStatus(0);
            usertravelBean.setTravelid(travelBean.getId());
            usertravelService.insertSelective(usertravelBean);


            return my(request, map);
        }catch (Exception e){
            e.printStackTrace();
            map.put("errorcode", 10);
            return "error";
        }
    }
}
