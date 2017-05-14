package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by fk on 2017/3/25.
 */
@Controller
public class OperativeAdv {

    @Autowired
    IDirectorService directorService;

    @Autowired
    IPerformerService performerService;

    @Autowired
    ITypeService typeService;

    @Autowired
    ISiteService siteService;

    @Autowired
    IRecordService recordService;

    private static final int SIZE = 10;
    @RequestMapping("/operative/addder")
    public String addder (HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){
        DirectorBean directorBean = new DirectorBean();
        String name = request.getParameter("name");
        directorBean.setName(name);
        String content = request.getParameter("content");
        String introduce = request.getParameter("introduce");
        directorBean.setIntroduce(introduce);
        String constellation = request.getParameter("constellation");
        directorBean.setConstellation(constellation);
        String sex = request.getParameter("sex");
        directorBean.setSex(sex);
        String birth = request.getParameter("birth");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            directorBean.setBirth(simpleDateFormat.parse(birth));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String nationality = request.getParameter("nationality");
        directorBean.setNationality(nationality);
        String height = request.getParameter("height");
        directorBean.setHeight(height);
        String birthplace = request.getParameter("birthplace");
        directorBean.setBirthplace(birthplace);
        String ename = request.getParameter("ename");
        directorBean.setEname(ename);
        String boxoffice = request.getParameter("boxoffice");
        directorBean.setBoxoffice(Double.parseDouble(boxoffice));
        String fan = request.getParameter("fan");
        directorBean.setFan(Integer.parseInt(fan));
        String othername = request.getParameter("othername");
        directorBean.setOthername(othername);

        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "image/director";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }
            img = "/movie/image/director/"+filename;
            directorBean.setImage(img);
            String reg = ":8080.*?\"";
            Pattern pattern = Pattern.compile(reg);
            if(content == null)
                content = "";
            Matcher matcher =  pattern.matcher(content);
            StringBuffer sbcontent = new StringBuffer();
            Boolean b = false;
            while(matcher.find()){
                String g = matcher.group();
                if(b == false) {
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                    b = true;
                }else{
                    sbcontent.append(CommonConst.SPLITOR);
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                }
            }
            directorBean.setImages(sbcontent.toString());
        }
        directorBean.setWorks("");
        directorService.insertSelective(directorBean);
        return "operative/der";
    }
    @RequestMapping("/operative/der")
    public String der(HttpServletRequest request, Map<String, Object> map){
        return "operative/der";
    }
    @RequestMapping("/operative/addper")
    public String addper(HttpServletRequest request,  @RequestParam("image") MultipartFile file, Map<String, Object> map){
        PerformerBean performerBean = new PerformerBean();
        String name = request.getParameter("name");
        performerBean.setName(name);
        String content = request.getParameter("content");
        String introduce = request.getParameter("introduce");
        performerBean.setIntroduce(introduce);
        String constellation = request.getParameter("constellation");
        performerBean.setConstellation(constellation);
        String sex = request.getParameter("sex");
        performerBean.setSex(sex);
        try {
            String birth = request.getParameter("birth");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            performerBean.setBirth(simpleDateFormat.parse(birth));
        } catch (ParseException e) {
            //e.printStackTrace();
            //performerBean.setBirth(null);
        }
        String nationality = request.getParameter("nationality");
        performerBean.setNationality(nationality);
        String height = request.getParameter("height");
        performerBean.setHeight(height);
        String birthplace = request.getParameter("birthplace");
        performerBean.setBirthplace(birthplace);
        String ename = request.getParameter("ename");
        performerBean.setEname(ename);
        String boxoffice = request.getParameter("boxoffice");
        performerBean.setBoxoffice(Double.parseDouble(boxoffice));
        String fan = request.getParameter("fan");
        performerBean.setFan(Integer.parseInt(fan));
        String othername = request.getParameter("othername");
        performerBean.setOthername(othername);

        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "image/director";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }
            img = "/movie/image/director/"+filename;
            performerBean.setImage(img);
            String reg = ":8080.*?\"";
            Pattern pattern = Pattern.compile(reg);
            if(content == null)
                content = "";
            Matcher matcher =  pattern.matcher(content);
            StringBuffer sbcontent = new StringBuffer();
            Boolean b = false;
            while(matcher.find()){
                String g = matcher.group();
                if(b == false) {
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                    b = true;
                }else{
                    sbcontent.append(CommonConst.SPLITOR);
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                }
            }
            performerBean.setImages(sbcontent.toString());
        }
        performerBean.setWorks("");
        performerService.insertSelective(performerBean);
        return "operative/per";
    }
    @RequestMapping("/operative/per")
    public String per(HttpServletRequest request, Map<String, Object> map){
        return "operative/per";
    }
    @RequestMapping("/operative/type")
    public String type(HttpServletRequest request, Map<String, Object> map){
        List<TypeBean> typeBeans =  typeService.selectAll();
        int count = typeBeans.size();
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
        List<TypeBean> list = typeService.selectByStart(start);
        map.put("type", list);
        return "operative/type";
    }

    @RequestMapping("/operative/updatetype")
    public String updatetype(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        String typename = request.getParameter("typename");
        TypeBean typeBean = new TypeBean();
        typeBean.setId(Integer.parseInt(id));
        typeBean.setTypename(typename);
        typeService.updateByPrimaryKeySelective(typeBean);
        return type(request, map);
    }
    @RequestMapping("/operative/deltype")
    public String deltype(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        typeService.deleteByPrimaryKey(Integer.parseInt(id));
        return type(request, map);
    }
    @RequestMapping("/operative/site")
    public String site(HttpServletRequest request, Map<String, Object> map){
        int count = siteService.count();
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
        List<SiteBean> list = siteService.selectByStart(start);
        map.put("site", list);

        return "/operative/site";
    }
    @RequestMapping("/operative/updatesite")
    public String updatesite(HttpServletRequest request, Map<String, Object> map){
        try {
            String id = request.getParameter("id");
            String status = request.getParameter("status");
            SiteBean siteBean = siteService.selectByPrimaryKey(Integer.parseInt(id));
            siteBean.setStatus(Integer.parseInt(status));
            siteService.updateByPrimaryKey(siteBean);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            map.put("errorcode", 9);
            return "error";
        }
        return site(request, map);
    }
    @RequestMapping("/operative/delsite")
    public String delsite(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        siteService.deleteByPrimaryKey(Integer.parseInt(id));
        return site(request, map);
    }
    @RequestMapping("/operative/addsite")
    public String addsite(HttpServletRequest request, Map<String, Object> map){

        return "/operative/addsite";
    }
    @RequestMapping("/operative/addsiteinfo")
    public String addsiteinfo(HttpServletRequest request, Map<String, Object> map){
        try {
            String site = request.getParameter("site");
            String status = request.getParameter("status");
            SiteBean siteBean = new SiteBean();
            siteBean.setSite(site);
            siteBean.setStatus(Integer.parseInt(status));
            siteService.insert(siteBean);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            map.put("errorcode", 9);
            return "error";
        }
        return addsite(request, map);
    }
    @RequestMapping("/operative/delrecord")
    public String delrecord(HttpServletRequest request, Map<String, Object> map){
        try {
            String id = request.getParameter("id");
            recordService.deleteByPrimaryKey(Integer.parseInt(id));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            map.put("errorcode", 9);
            return "error";
        }
        return buy(request, map);
    }
    @RequestMapping("/operative/buy")
    public String buy(HttpServletRequest request, Map<String, Object> map){
        try {
            int count = recordService.count();
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
            if(start < 0){
                start = 0;
            }
            List<RecordBean> list = recordService.selectByStartAll(start);
            map.put("record", list);


        } catch (NumberFormatException e) {
            e.printStackTrace();
            map.put("errorcode", 9);
            return "error";
        }
        return "/operative/buy";
    }
}
