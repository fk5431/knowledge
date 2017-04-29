package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.fk.util.MD5;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by fengkai on 15/03/17.
 */
@Controller
public class MovieC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    IMovieService movieService;

    @Autowired
    ITypeService typeService;

    @Autowired
    IPlaceService placeService;

    @Autowired
    IDirectorService directorService;

    @Autowired
    IPerformerService performerService;

    @Autowired
    IHistoryService historyService;

    @Autowired
    IUserService userService;

    @Autowired
    ICollectService collectService;

    @Autowired
    ICloudService cloudService;

    private static final int SIZE = 15;

    @RequestMapping(value = "/film")
    public String film(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);
        String id = request.getParameter("id");

        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        if(movieBean.getPrizeids().equals("")){
            movieBean.setPrizeids("0");
        }
        movieBean.setBoxoffice(movieBean.getBoxoffice() * Integer.parseInt(movieBean.getPrizeids()));
        map.put("movie", movieBean);
        String[] types = movieBean.getType().split(CommonConst.SPLITOR);
        StringBuffer sb = new StringBuffer();
        for(String str : types){
            sb.append(typeService.selectByPrimaryKey(Integer.parseInt(str)).getTypename() + " ，");
        }
        String type = sb.substring(0, sb.length()-1);
        map.put("type", type);
//      导演  director
//        DirectorBean director = directorService.selectByPrimaryKey(movieBean.getDirectorid());
//        map.put("director", director);
//        演员 performer
        List<PerformerBean> performer = new ArrayList<>();
        String[] performers = movieBean.getPerformerids().split(CommonConst.SPLITOR);
        if( !(performers.length == 1 && performers[0].equals(""))){
            for(int i=0;i<performers.length;i++){
                PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(performers[i]));
                if(performerBean != null){
                    performer.add(performerBean);
                }
            }
        }
        map.put("performer", performer);

        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
            String userId = "0";
            Cookie[] cookies = request.getCookies();
            for(Cookie c : cookies){
                if(CommonConst.USERID.equals(c.getName())){
                    userId = c.getValue();
                }
            }
            HistoryBean his = historyService.selectByMovieId(Integer.parseInt(userId), movieBean.getId());
            if(his == null) {
                HistoryBean historyBean = new HistoryBean();
                historyBean.setUserid(Integer.parseInt(userId));
                historyBean.setMovieid(movieBean.getId());
                historyBean.setImage(movieBean.getImage());
                historyBean.setIntroduce(movieBean.getIntroduce());
                historyBean.setMovietitle(movieBean.getTitle());
                historyBean.setScore(movieBean.getScore());
                historyBean.setTime(movieBean.getShowtime());
                historyBean.setDate(new Date());
                historyService.insertSelective(historyBean);
            }else{
                his.setDate(new Date());
                historyService.updateByPrimaryKey(his);
            }
            if( !(performers.length == 1 && performers[0].equals(""))) {
                for (int i = 0; i < performers.length; i++) {
                    PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(performers[i]));
                    if (performerBean != null) {
                        CloudBean cloud = cloudService.selectByUserIdAndActorId(Integer.parseInt(userId), performerBean.getId());
                        if (cloud == null) {
                            CloudBean cloudBean = new CloudBean();
                            cloudBean.setUserid(Integer.parseInt(userId));
                            cloudBean.setActorid(performerBean.getId());
                            cloudBean.setActorname(performerBean.getName());
                            cloudBean.setActorstatus(0);
                            cloudService.insertSelective(cloudBean);
                        } else {
                            cloud.setActorstatus(cloud.getActorstatus() + 1);
                            cloudService.updateByPrimaryKey(cloud);
                        }
                    }
                }
            }

        }

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

        return "film";
    }

    @RequestMapping("search")
    public String search(HttpServletRequest request, Map<String, Object> map){

        String kw = request.getParameter("kw");

        map.put("index", 0);

        MovieBean movieBean = movieService.selectByTitle(kw);
        if(movieBean == null){
            map.put("errorcode", 10);
            return "error";
        }
        map.put("movie", movieBean);
        String[] types = movieBean.getType().split(CommonConst.SPLITOR);
        StringBuffer sb = new StringBuffer();
        for(String str : types){
            sb.append(typeService.selectByPrimaryKey(Integer.parseInt(str)).getTypename() + " ，");
        }
        String type = sb.substring(0, sb.length()-1);
        map.put("type", type);
//      导演  director
//        DirectorBean director = directorService.selectByPrimaryKey(movieBean.getDirectorid());
//        map.put("director", director);
//        演员 performer
        List<PerformerBean> performer = new ArrayList<>();
        String[] performers = movieBean.getPerformerids().split(CommonConst.SPLITOR);
        for(int i=0;i<performers.length;i++){
            PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(performers[i]));
            if(performerBean != null){
                performer.add(performerBean);
            }
        }
        map.put("performer", performer);

        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }

        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
            String userId = "0";
            Cookie[] cookies = request.getCookies();
            for(Cookie c : cookies){
                if(CommonConst.USERID.equals(c.getName())){
                    userId = c.getValue();
                }
            }
            HistoryBean his = historyService.selectByMovieId(Integer.parseInt(userId), movieBean.getId());
            if(his == null) {
                HistoryBean historyBean = new HistoryBean();
                historyBean.setUserid(Integer.parseInt(userId));
                historyBean.setMovieid(movieBean.getId());
                historyBean.setImage(movieBean.getImage());
                historyBean.setIntroduce(movieBean.getIntroduce());
                historyBean.setMovietitle(movieBean.getTitle());
                historyBean.setScore(movieBean.getScore());
                historyBean.setTime(movieBean.getShowtime());
                historyBean.setDate(new Date());
                historyService.insertSelective(historyBean);
            }else{
                his.setDate(new Date());
                historyService.updateByPrimaryKey(his);
            }
            if( !(performers.length == 1 && performers[0].equals(""))) {
                for (int i = 0; i < performers.length; i++) {
                    PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(performers[i]));
                    if (performerBean != null) {
                        CloudBean cloud = cloudService.selectByUserIdAndActorId(Integer.parseInt(userId), performerBean.getId());
                        if (cloud == null) {
                            CloudBean cloudBean = new CloudBean();
                            cloudBean.setUserid(Integer.parseInt(userId));
                            cloudBean.setActorid(performerBean.getId());
                            cloudBean.setActorname(performerBean.getName());
                            cloudBean.setActorstatus(0);
                            cloudService.insertSelective(cloudBean);
                        } else {
                            cloud.setActorstatus(cloud.getActorstatus() + 1);
                            cloudService.updateByPrimaryKey(cloud);
                        }
                    }
                }
            }

        }

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
        return "film";
    }

    @RequestMapping(value = "/lookcount")
    public String lookcount(HttpServletRequest request, Map<String, Object> map){
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }
        String id = request.getParameter("id");
        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        movieBean.setLookcount(movieBean.getLookcount() + 1);
        movieService.updateByPrimaryKey(movieBean);
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }
        User user = userService.selectUserByID(Integer.parseInt(userId));
        CollectBean collectBean = new CollectBean();
        collectBean.setTime(movieBean.getShowtime());
        collectBean.setScore(movieBean.getScore());
        collectBean.setIntroduce(movieBean.getIntroduce());
        collectBean.setUserid(user.getId());
        collectBean.setImage(movieBean.getImage());
        collectBean.setMovieid(movieBean.getId());
        collectBean.setMovietitle(movieBean.getTitle());
        collectBean.setStatus("1");
        collectService.insertSelective(collectBean);
        return film(request, map);
    }

    @RequestMapping(value = "/collect")
    public String collect(HttpServletRequest request, Map<String, Object> map){
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }else{
            return "log";
        }
        String id = request.getParameter("id");
        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        movieBean.setScorenum(movieBean.getScorenum() + 1);
        movieService.updateByPrimaryKey(movieBean);
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }
        User user = userService.selectUserByID(Integer.parseInt(userId));
        CollectBean collectBean = new CollectBean();
        collectBean.setTime(movieBean.getShowtime());
        collectBean.setScore(movieBean.getScore());
        collectBean.setIntroduce(movieBean.getIntroduce());
        collectBean.setUserid(user.getId());
        collectBean.setImage(movieBean.getImage());
        collectBean.setMovieid(movieBean.getId());
        collectBean.setMovietitle(movieBean.getTitle());
        collectBean.setStatus("0");
        collectService.insertSelective(collectBean);
        return film(request, map);
    }


    @RequestMapping(value = "/socre")
    public String socre(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        String userscore = request.getParameter("score");
        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        double score = movieBean.getScore();
        int num = movieBean.getScorenum();
        score = score * num + Double.parseDouble(userscore);
        num += 1;
        movieBean.setScore(score);
        movieBean.setScorenum(num);
        movieService.updateByPrimaryKey(movieBean);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }
        return film(request, map);
    }

    @RequestMapping(value = "/director")
    public String director(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);
        String id = request.getParameter("id");

        DirectorBean directorBean = directorService.selectByPrimaryKey(Integer.parseInt(id));
        map.put("director", directorBean);
        List<MovieBean> listmovie = new ArrayList<>();
        String[] works = directorBean.getWorks().split(CommonConst.SPLITOR);
        for(int i=0;i<works.length;i++){
            if("".equals(works[i])){
                continue;
            }
            MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(works[i]));
            listmovie.add(movieBean);
        }
        map.put("listmovie", listmovie);
        String[] images = directorBean.getImages().split(CommonConst.SPLITOR);
        map.put("images", images);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }
        return "director";
    }

    @RequestMapping(value = "/performer")
    public String performer(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);
        String id = request.getParameter("id");

        PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(id));
        map.put("director", performerBean);
        List<MovieBean> listmovie = new ArrayList<>();
        String[] works = performerBean.getWorks().split(CommonConst.SPLITOR);
        for(int i=0;i<works.length;i++){
            if("".equals(works[i])){
                continue;
            }
            MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(works[i]));
            listmovie.add(movieBean);
        }
        map.put("listmovie", listmovie);
        String[] images = performerBean.getImages().split(CommonConst.SPLITOR);
        map.put("images", images);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }
        return "director";
    }

    @RequestMapping(value = "/movies")
    public String movies(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", CommonConst.TWO_INT);

        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("typename", typeBeans);

        List<MovieBean> movieBeans = new ArrayList<>();
        String type = request.getParameter("typeid");
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if((type == null || "".equals(type) ) && c.getName().equals("typeid")){
                type = c.getValue();
            }
        }
        if(type == null || "".equals(type) || "0".equals(type)){
            type = "0";
            movieBeans = movieService.selectByTypeAll();
        }else {
            movieBeans = movieService.selectByType(type);
        }
        map.put("type", Integer.parseInt(type));
        Cookie cookie = new Cookie("typeid", type);
        cookie.setMaxAge(-1);
        response.addCookie(cookie);
        int count = movieBeans.size();
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
        map.put("typeMovie", movieBeans.subList(start, movieBeans.size()<start +SIZE?movieBeans.size():start+SIZE));
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }
        return "movies";
    }


}
