package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by FK on 2017/4/9.
 */
@Controller
public class Buy {

    @Autowired
    IMovieService movieService;

    @Autowired
    ITypeService typeService;

    @Autowired
    ISiteService siteService;

    @Autowired
    IRecordService recordService;

    @Autowired
    IUserService userService;

    @Autowired
    IHistoryService historyService;

    @Autowired
    ICollectService collectService;

    @Autowired
    ICloudService cloudService;

    private static final int SIZE = 10;
    @RequestMapping("/buy")
    public String buy(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);
        String id = request.getParameter("id");

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        map.put("movie", movieBean);

        String[] types = movieBean.getType().split(CommonConst.SPLITOR);
        StringBuffer sb = new StringBuffer();
        for(String str : types){
            sb.append(typeService.selectByPrimaryKey(Integer.parseInt(str)).getTypename() + " ，");
        }
        String type = sb.substring(0, sb.length()-1);

        map.put("type", type);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }

        List<SiteBean> siteBeans = siteService.selectAll();
        map.put("site", siteBeans);
        List<MovieBean> other = movieService.selectByType(movieBean.getType());
        List<MovieBean> returnother = new ArrayList<>();
        if(other.size() <= 6){
            map.put("other", other);
        }else {
            Random random=new Random();
            int [] r=new int[6];
            for (int i = 0; i < r.length;) {
                int temp=random.nextInt(other.size());
                if(temp==0)continue;
                for (int j : r) {
                    if(j==temp)continue;
                }
                r[i]=temp;
                i++;
            }
            for(int j : r){
                returnother.add(other.get(j));
            }
            map.put("other", returnother);
        }
        return "buy";
    }

    @RequestMapping("/buymovie")
    public String buymovie(HttpServletRequest request, HttpServletResponse response, Map<String , Object> map){
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }
        String id = request.getParameter("id");
        String radio = request.getParameter("radio");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String wechat = request.getParameter("wechat");
        String mob = request.getParameter("mob");
        String other = request.getParameter("other");
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        SiteBean siteBean = siteService.selectByPrimaryKey(Integer.parseInt(radio));
        RecordBean recordBean = new RecordBean();
        recordBean.setMob(mob==null?"":mob);
        recordBean.setUserid(Integer.parseInt(userId));
        recordBean.setWechat(wechat==null?"":wechat);
        recordBean.setEmail(email==null?"":email);
        recordBean.setMovieid(Integer.parseInt(id));
        recordBean.setMoviename(movieBean.getTitle());
        recordBean.setName(name==null?"":name);
        recordBean.setOther(other==null?"":other);
        recordBean.setSiteid(siteBean.getId());
        recordBean.setSitename(siteBean.getSite());
        recordService.insertSelective(recordBean);

        movieBean.setBoxoffice(movieBean.getBoxoffice() + 1);
        movieService.updateByPrimaryKey(movieBean);

        return info(request, map);
    }


    @RequestMapping("info")
    public String info(HttpServletRequest request, Map<String, Object> map){

        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }
        map.put("index", 0);
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }
        User user = userService.selectUserByID(Integer.parseInt(userId));
        map.put("user", user);

        String type = request.getParameter("type");
        if(type == null || "".equals(type)){
            type = "1";
        }
        int count3 = collectService.countC(Integer.parseInt(userId));
        int count4 = collectService.countL(Integer.parseInt(userId));
        int count2 = recordService.count(Integer.parseInt(userId));
        map.put("count2",count2);
        map.put("count3",count3);
        map.put("count4",count4);
        if(type.equals("1")){
            int count = historyService.count();
            int page = 1;
            if(count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            if(page == 0)
                page = 1;
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
            List<HistoryBean> list = historyService.selectByStart(Integer.parseInt(userId),start);
            map.put("his", list);
            map.put("type", "1");
        }else if(type.equals("2")){
            int count = recordService.count();
            int page = 1;
            if(count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            if(page == 0)
                page = 1;
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
            List<RecordBean> list = recordService.selectByStart(Integer.parseInt(userId), start);
            List<MovieBean> movieBeans =new ArrayList<>();
            for(RecordBean r : list){
                MovieBean movieBean = movieService.selectByPrimaryKey(r.getMovieid());
                movieBeans.add(movieBean);
            }
            map.put("his", list);
            map.put("movie", movieBeans);
            map.put("type", "2");
        }else if(type.equals("3")){
            int count = collectService.countC();
            int page = 1;
            if(count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            if(page == 0)
                page = 1;
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
            List<CollectBean> list = collectService.selectByStartC(Integer.parseInt(userId), start);
            map.put("his", list);
            map.put("type", "3");
        }else if(type.equals("4")){
            int count = collectService.countL();
            int page = 1;
            if(count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            if(page == 0)
                page = 1;
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
            List<CollectBean> list = collectService.selectByStartL(Integer.parseInt(userId), start);
            map.put("his", list);
            map.put("type", "4");
        }

        List<CloudBean> cloudBeans = cloudService.selectByCountTwo(Integer.parseInt(userId));
        StringBuffer sb1 = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        boolean flag = false;
        for(CloudBean c : cloudBeans){
            if(flag == false){
                flag = true;
                sb1.append("'"+c.getActorname()+"'");
                sb2.append("'"+c.getActorid()+"'");
            }else{
                sb1.append(",'"+c.getActorname()+"'");
                sb2.append(",'"+c.getActorid()+"'");
            }
        }
        map.put("sb1", sb1.toString());
        map.put("sb2", sb2.toString());
        return "userinfo";
    }
    //TODO 演员的work
}
