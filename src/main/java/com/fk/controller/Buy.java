package com.fk.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import netscape.javascript.JSObject;
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

    @Autowired
    IPerformerService performerService;

    private static final int SIZE = 10;
    @RequestMapping("/buy")
    public String buy(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);
        String id = request.getParameter("id");
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        movieBean.setBoxoffice(movieBean.getBoxoffice() * Integer.parseInt(movieBean.getPrizeids()));
        map.put("movie", movieBean);
        String[] ticket = movieBean.getDirectorid().split(CommonConst.SPLITOR);
        int rest = Integer.parseInt(ticket[2]);
        if(rest <= 0){
            map.put("errorcode", 12);
            return "error";
        }

        List<String> price = new ArrayList<>();
        int row = Integer.parseInt(ticket[0]);
        int length = (int) Math.ceil(row/5.0);
        int mid = length / 2;
        for(int i=0;i<length;i++){
            int p = (mid - i) * 50 + Integer.parseInt(movieBean.getPrizeids());
            if( p == 0)
                p = Integer.parseInt(movieBean.getPrizeids());
            price.add(String.valueOf(p));
        }
        map.put("price", price);
        String[] types = movieBean.getType().split(CommonConst.SPLITOR);
        StringBuffer sb = new StringBuffer();
        for(String str : types){
            sb.append(typeService.selectByPrimaryKey(Integer.parseInt(str)).getTypename() + " ，");
        }
        String type = sb.substring(0, sb.length()-1);

        map.put("type", type);

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
        String price = request.getParameter("price");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String wechat = request.getParameter("wechat");
        String mob = request.getParameter("mob");
        String other = request.getParameter("other");
//        String row = request.getParameter("row");
//        String col = request.getParameter("col");
        String userId = "0";
        if(name == null || email == null || mob == null){
            map.put("errorcode", 8);
            return "error";
        }
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        SiteBean siteBean = siteService.selectByPrimaryKey(Integer.parseInt(radio));

        movieBean.setBoxoffice(movieBean.getBoxoffice() + 1);
        String[] ticket = movieBean.getDirectorid().split(CommonConst.SPLITOR);
        int rest = Integer.parseInt(ticket[2]) - 1;
        //TODO
        int pri = Integer.parseInt(price);
        int row = Integer.parseInt(ticket[0]);
        int length = (int) Math.ceil(row/5.0);
        int mid = length / 2;
        int pos = 0;
        for(int i=0;i<length;i++){
            int p = (mid - i) * 50 + Integer.parseInt(movieBean.getPrizeids());
            if( p == 0)
                p = Integer.parseInt(movieBean.getPrizeids());
            // price.add(String.valueOf(p));
            if(p == pri){
                pos = i;
                break;
            }
        }
        int min_x = pos * 5;
        int max_x = min_x + 4;
        if(max_x > row){
            max_x = row;
        }
        int max_y = Integer.parseInt(ticket[1]);
//        JSONObject jsonObject = JSON.parseObject(ticket[3]);
        int[][] site = new int[row][Integer.parseInt(ticket[1])];
        String[] str = ticket[3].split("],");
        for(int i=0;i <str.length;i++){
            if(i ==0){
                str[i] = str[i].substring(2);
            } else  if(i == str.length - 1){
                str[i] = str[i].substring(1, str[i].length()-2);
            } else {
                str[i] = str[i].substring(1);
            }
            String[] strs = str[i].split(",");
            for(int j=0;j<strs.length;j++){
               site[i][j] = Integer.parseInt(strs[j]);
            }
        }
        boolean flag = false;
        int x = 0;
        int y = 0;
        outterLoop : for(int i=min_x;i<=max_x;i++){
            for (int j=0;j<max_y;j++){
                if (site[i][j] == 0){
                    site[i][j] = 1;
                    flag = true;
                    x = i;
                    y = j;
                    break outterLoop;
                }
            }
        }
        if(flag == false){
            map.put("errorcode", 13);
            return "error";
        }
        //
        movieBean.setDirectorid(ticket[0]+CommonConst.SPLITOR+ticket[1]+CommonConst.SPLITOR+rest+CommonConst.SPLITOR + JSON.toJSONString(site));
        movieService.updateByPrimaryKey(movieBean);


        RecordBean recordBean = new RecordBean();
        recordBean.setMob(mob==null?"":mob);
        recordBean.setUserid(Integer.parseInt(userId));
        recordBean.setWechat(wechat==null?"":wechat);
        recordBean.setEmail(email==null?"":email);
        recordBean.setMovieid(Integer.parseInt(id));
        recordBean.setMoviename(movieBean.getTitle());
        recordBean.setName(name==null?"":name);
        recordBean.setOther(other==null?""+CommonConst.SPLITOR+x+CommonConst.SPLITOR+y:other+CommonConst.SPLITOR+x+CommonConst.SPLITOR+y);
        recordBean.setSiteid(siteBean.getId());
        recordBean.setSitename(siteBean.getSite());
        recordService.insertSelective(recordBean);


        String per = movieBean.getPerformerids();
        String[] pers = per.split(CommonConst.SPLITOR);
        for(int i=0;i<pers.length;i++){
            PerformerBean p = performerService.selectByPrimaryKey(Integer.parseInt(pers[i]));
            p.setBoxoffice(p.getBoxoffice()+ Integer.parseInt(movieBean.getPrizeids()));
            performerService.updateByPrimaryKey(p);
        }


        map.put("cost", movieBean.getPrizeids());
        pay_buy(request, map);




        return "pay";
    }

    private void pay_buy(HttpServletRequest request, Map<String, Object> map) {
        map.put("index", 0);
        String id = request.getParameter("id");

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        movieBean.setBoxoffice(movieBean.getBoxoffice() * Integer.parseInt(movieBean.getPrizeids()));
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
    }

    @RequestMapping("sure")
    public String sure(HttpServletRequest request, Map<String,Object> map){
        map.put("errorcode", 11);
        return "error";
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
