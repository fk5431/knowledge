package com.fk.controller;

import com.fk.bean.MovieBean;
import com.fk.bean.RecordBean;
import com.fk.bean.SiteBean;
import com.fk.service.IMovieService;
import com.fk.service.IRecordService;
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

    @Autowired
    IRecordService recordService;

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

        return "buy";
    }

    @RequestMapping("/buymovie")
    public String buymovie(HttpServletRequest request, HttpServletResponse response, Map<String , Object> map){
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

        return info(request, map);
    }


    @RequestMapping("info")
    public String info(HttpServletRequest request, Map<String, Object> map){


        return "userinfo";
    }

}
