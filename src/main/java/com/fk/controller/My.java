package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.google.common.collect.Lists;
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
import java.util.*;

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
    IRecordService recordService;

    @Autowired
    IAuditService auditService;

    @Autowired
    ITravelService travelService;

    @Autowired
    ILiketravelService liketravelService;

    @Autowired
    IOrdersService ordersService;

    @Autowired
    ICloudService cloudService;


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
        User user = getUser(request, map);

        List<UsertravelBean> usertravelBeans = usertravelService.selectByUserId(user.getId());
        if(usertravelBeans == null || usertravelBeans.size() == 0){
            map.put(CommonConst.STATUS, "0");
        }else{
            map.put(CommonConst.STATUS, "1");
            Collections.sort(usertravelBeans, new Comparator<UsertravelBean>() {
                        @Override
                        public int compare(UsertravelBean o1, UsertravelBean o2) {
                            int c = o1.getStatus().compareTo(o2.getStatus());
                            return c;
//                            if(c > 0){
//                                return -1;
//                            }else if(c == 0){
//                                return  0;
//                            }else {
//                                return 1;
//                            }
                        }
                    }
            );
//            map.put("info", usertravelBeans);
            ArrayList<TravelBean> travel = Lists.newArrayList();
            ArrayList<AuditBean> auditBeans = Lists.newArrayList();
            for(UsertravelBean u :usertravelBeans){
                if(u.getStatus() == 0){
                    auditBeans.add(auditService.selectByPrimaryKey(u.getTravelid()));
                }else if(u.getStatus() == 1){
                    travel.add(travelService.selectByPrimaryKey(u.getTravelid()));
                }
            }
            map.put("travel",travel.size()>CommonConst.THREE_INT?travel.subList(0,3):travel);
            map.put("auditBeans",auditBeans.size()>CommonConst.THREE_INT?auditBeans.subList(0,3):auditBeans);
            map.put("count", travel.size()+auditBeans.size());
            if(usertravelBeans.get(0).getStatus() == 0){
                map.put("audit", "0");
            }else{
                map.put("audit", "1");
            }
        }

        List<TravelBean> travelBeans = Lists.newArrayList();
        List<LiketravelBean> liketravelBeans = liketravelService.selectByUserId(user.getId());
        for(LiketravelBean l : liketravelBeans){
            TravelBean travelBean = travelService.selectByPrimaryKey(l.getTravelid());
            if(travelBean !=null)
                travelBeans.add(travelBean);
        }
        map.put("like",travelBeans.size());

        List<CloudBean> cloudBeans0 = cloudService.selectByUserIdAndStatus0(user.getId());
        List<CloudBean> cloudBeans1 = cloudService.selectByUserIdAndStatus1(user.getId());
        map.put("cloud0", cloudBeans0);
        map.put("cloud1", cloudBeans1);
        return "my";
    }

    private User getUser(HttpServletRequest request, Map<String, Object> map) {
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
        return user;
    }

    @RequestMapping("notaudit")
    public String notaudit(HttpServletRequest request , Map<String, Object> map){
        map.put("errorcode", 13);

        return "error";
    }
    @RequestMapping("/mylike")
    public String mylike(HttpServletRequest request , Map<String, Object> map){
        if(!Login.islogin(request)){
            return "login";
        }else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        User user = getUser(request, map);

        List<TravelBean> travelBeans = Lists.newArrayList();
        List<LiketravelBean> liketravelBeans = liketravelService.selectByUserId(user.getId());
        for(LiketravelBean l : liketravelBeans){
            TravelBean travelBean = travelService.selectByPrimaryKey(l.getTravelid());
            if(travelBean !=null)
                travelBeans.add(travelBean);
        }
        map.put("travel", travelBeans);
        map.put("count",travelBeans.size());

        List<CloudBean> cloudBeans0 = cloudService.selectByUserIdAndStatus0(user.getId());
        List<CloudBean> cloudBeans1 = cloudService.selectByUserIdAndStatus1(user.getId());
        map.put("cloud0", cloudBeans0);
        map.put("cloud1", cloudBeans1);
        return "mylike";
    }

    @RequestMapping("alluserart")
    public String alluserart(HttpServletRequest request, Map<String, Object> map) {
        if (!Login.islogin(request)) {
            return "login";
        } else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        User user = getUser(request, map);

        List<UsertravelBean> usertravelBeans = usertravelService.selectByUserId(user.getId());
        if (usertravelBeans == null || usertravelBeans.size() == 0) {
            map.put(CommonConst.STATUS, "0");
            map.put("travel", new ArrayList<TravelBean>());
            map.put("count", 0);
        } else {
            map.put(CommonConst.STATUS, "1");
            ArrayList<TravelBean> travel = Lists.newArrayList();
            for (UsertravelBean u : usertravelBeans) {
                if (u.getStatus() == 1) {
                    travel.add(travelService.selectByPrimaryKey(u.getTravelid()));
                }
            }
            map.put("travel", travel);
            map.put("count", travel.size());
        }
        return "alluserart";
    }
    @RequestMapping("mywhere")
    public String mywhere(HttpServletRequest request, Map<String, Object> map) {
        if (!Login.islogin(request)) {
            return "login";
        } else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        User user = getUser(request, map);

        List<RecordBean> recordBeans = recordService.selectAll();
        List<RecordBean> returnRecord = Lists.newArrayList();
        List<OrdersBean> order = Lists.newArrayList();
        for(RecordBean r : recordBeans){
            if(r.getUserid() == user.getId()){
                returnRecord.add(r);
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(r.getOrderid());
                order.add(ordersBean);
            }
        }

        map.put("record", returnRecord);
        map.put("order", order);
        map.put("count", order.size());


        List<CloudBean> cloudBeans0 = cloudService.selectByUserIdAndStatus0(user.getId());
        List<CloudBean> cloudBeans1 = cloudService.selectByUserIdAndStatus1(user.getId());
        map.put("cloud0", cloudBeans0);
        map.put("cloud1", cloudBeans1);
        return "mywhere";
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
