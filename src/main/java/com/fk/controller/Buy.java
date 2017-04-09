package com.fk.controller;

import com.fk.bean.MovieBean;
import com.fk.bean.SiteBean;
import com.fk.service.IMovieService;
import com.fk.service.ISiteService;
import com.fk.service.ITypeService;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

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
        }

        List<SiteBean> siteBeans = siteService.selectAll();
        map.put("site", siteBeans);

        return "buy";
    }

    @RequestMapping("/buymovie")
    public String buymovie(HttpServletRequest request, HttpServletResponse response, Map<String , Object> map){
        String id = request.getParameter("id");
        String radio = request.getParameter("radio");


        return "userinfo";
    }



}
