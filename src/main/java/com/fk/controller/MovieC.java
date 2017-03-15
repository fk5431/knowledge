package com.fk.controller;

import com.fk.bean.DirectorBean;
import com.fk.bean.MovieBean;
import com.fk.bean.PerformerBean;
import com.fk.bean.User;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    IDirectorService directorService;

    @Autowired
    IPerformerService performerService;

    @RequestMapping(value = "/film")
    public String film(HttpServletRequest request, Map<String, Object> map){
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
//      导演  director
        DirectorBean director = directorService.selectByPrimaryKey(movieBean.getDirectorid());
        map.put("director", director);
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
        return "film";
    }

    @RequestMapping(value = "/lookcount")
    public String lookcount(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(id));
        movieBean.setLookcount(movieBean.getLookcount() + 1);
        movieService.updateByPrimaryKey(movieBean);
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
            MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(works[i]));
            listmovie.add(movieBean);
        }
        map.put("listmovie", listmovie);
        String[] images = directorBean.getImages().split(CommonConst.SPLITOR);
        map.put("images", images);
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
            MovieBean movieBean = movieService.selectByPrimaryKey(Integer.parseInt(works[i]));
            listmovie.add(movieBean);
        }
        map.put("listmovie", listmovie);
        String[] images = performerBean.getImages().split(CommonConst.SPLITOR);
        map.put("images", images);
        return "director";
    }

    @RequestMapping(value = "/movies")
    public String movies(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 2);

        return "director";
    }


}
