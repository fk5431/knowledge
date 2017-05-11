package com.fk.controller;

import com.fk.bean.DirectorBean;
import com.fk.bean.MovieBean;
import com.fk.bean.PerformerBean;
import com.fk.service.IDirectorService;
import com.fk.service.IMovieService;
import com.fk.service.IPerformerService;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 10/04/17.
 */
@Controller
public class Top {

    @Autowired
    IMovieService movieService;

    @Autowired
    IDirectorService directorService;

    @Autowired
    IPerformerService performerService;

    @RequestMapping("/top")
    public String top(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);
        String toptype = request.getParameter("toptype");
        if (toptype == null || toptype.equals("")){
            List<MovieBean> score = movieService.selectSortByScoreOfTen();
            map.put("movie", score);
            List<String> name = getStrings(score);
            map.put("name", name);
            map.put("hottype", 1);
            return "top";
        }
        if(toptype.equals("1")) {
            List<MovieBean> score = movieService.selectSortByScoreOfTen();
            map.put("movie", score);
            List<String> name = getStrings(score);
            map.put("name", name);
            map.put("hottype", 1);
        }else if(toptype.equals("2")) {
            List<MovieBean> look = movieService.selectSortByLookCountOfTen();
            map.put("movie", look);
            List<String> name = getStrings(look);
            map.put("name", name);
            map.put("hottype", 2);
        }else if(toptype.equals("3")) {
            //TODO 收藏
            List<MovieBean> score = movieService.selectSortByNum();
            map.put("movie", score);
            List<String> name = getStrings(score);
            map.put("name", name);
            map.put("hottype", 3);
        }else if(toptype.equals("4")) {
            List<MovieBean> time = movieService.selectSortByTimeOfTen();
            map.put("movie", time);
            List<String> name = getStrings(time);
            map.put("name", name);
            map.put("hottype", 4);
        }else if(toptype.equals("5")) {
            List<MovieBean> score = movieService.selectSortByBoxofficeOfTen();
            map.put("movie", score);
            List<String> name = getStrings(score);
            map.put("name", name);
            map.put("hottype", 5);
        }


        return "top";
    }

    private List<String> getStrings(List<MovieBean> score) {
        List<String> name = new ArrayList<>();
        for(MovieBean movieBean : score){
            StringBuffer sb = new StringBuffer();
            //      导演  director
//            DirectorBean director = directorService.selectByPrimaryKey(movieBean.getDirectorid());
//            sb.append(director.getName());
            //        演员 performer
            String[] performers = movieBean.getPerformerids().split(CommonConst.SPLITOR);
            for(int i=0;i<performers.length;i++){
                if(performers[i].equals(""))
                    continue;
                PerformerBean performerBean = performerService.selectByPrimaryKey(Integer.parseInt(performers[i]));
                if(performerBean != null){
                    sb.append(",");
                    sb.append(performerBean.getName());
                }
            }
            name.add(sb.toString());
        }
        return name;
    }

}
