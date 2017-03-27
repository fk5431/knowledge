package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
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

    @Autowired
    IIndexShowService indexShowService;

    @Autowired
    IIndexshowshopService indexshowshopService;

    @Autowired
    IShopshowService shopshowService;

    @Autowired
    IOrdersService ordersService;

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
    @RequestMapping("/operative/delindex")
    public String delindex(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(Integer.parseInt(id));
        indexShowBean.setMid(-1);
        indexShowService.updateByPrimaryKey(indexShowBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/delindexshop")
    public String delindexshop(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        IndexshowshopBean indexshowshopBean = indexshowshopService.selectByPrimaryKey(Integer.parseInt(id));
        indexshowshopBean.setMid(-1);
        indexshowshopService.updateByPrimaryKey(indexshowshopBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/delshowshop")
    public String delshowshop(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(Integer.parseInt(id));
        shopshowBean.setMid(-1);
        shopshowService.updateByPrimaryKey(shopshowBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/addtoindex")
    public String addtoindex(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FIVE_INT;i++){
            IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(i);
            if(indexShowBean.getMid() == -1){
                indexShowBean.setMid(Integer.parseInt(id));
                indexShowService.updateByPrimaryKey(indexShowBean);
                return adv(request, map);
            }else {
                TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
                if(travelBean == null){
                    indexShowBean.setMid(Integer.parseInt(id));
                    indexShowService.updateByPrimaryKey(indexShowBean);
                    return adv(request, map);
                }
            }
        }
        map.put("errorcode", 8);
        return "error";

    }
    @RequestMapping("/operative/addtomdd")
    public String addtomdd(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(CommonConst.SIX_INT);

        if(indexShowBean.getMid() == -1 ){
            indexShowBean.setMid(Integer.parseInt(id));
            indexShowService.updateByPrimaryKey(indexShowBean);
            return adv(request, map);
        }else {
            TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
            if(travelBean == null){
                indexShowBean.setMid(Integer.parseInt(id));
                indexShowService.updateByPrimaryKey(indexShowBean);
                return adv(request, map);
            }
        }

        map.put("errorcode", 9);
        return "error";
    }

    @RequestMapping("/operative/adv")
    public String adv(HttpServletRequest request, Map<String, Object> map){

        List<TravelBean> list = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FIVE_INT;i++){
            IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(i);
            if(indexShowBean != null && indexShowBean.getMid() != -1){
                TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
                if(travelBean != null) {
                    list.add(travelBean);
                }
            }
        }
        map.put("indexshow", list);

        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(CommonConst.SIX_INT);
        TravelBean travelBean = new TravelBean();
        if(indexShowBean.getMid() != -1){
            travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
        }
        map.put("banner", travelBean);

        //热卖爆款
        List<OrdersBean> listorders = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.THREE_INT;i++){
            IndexshowshopBean indexshowshopBean  = indexshowshopService.selectByPrimaryKey(i);
            if(indexshowshopBean != null  && indexshowshopBean.getMid() != -1){
                 OrdersBean ordersBean = ordersService.selectByPrimaryKey(indexshowshopBean.getMid());
                if(ordersBean != null){
                    listorders.add(ordersBean);
                }
            }
        }
        map.put("orders", listorders);

        List<OrdersBean> ordersBeans = new ArrayList<>();
        for(int i=0;i<CommonConst.FOUR_INT;i++){
            ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(i);
            if(shopshowBean != null  && shopshowBean.getMid() != -1){
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(shopshowBean.getMid());
                if(ordersBean != null){
                    ordersBeans.add(ordersBean);
                }
            }
        }
        map.put("shopshow", ordersBeans);
        return "/operative/adv";
    }

    @RequestMapping("/operative/addart")
    public String addart(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){
        try{

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
        }catch (Exception e){
            e.printStackTrace();
            map.put("errorcode", 10);
            return "error";
        }
    }

}
