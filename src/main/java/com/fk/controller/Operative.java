package com.fk.controller;

import com.fk.bean.IndexshowBean;
import com.fk.bean.NewsBean;
import com.fk.bean.User;
import com.fk.service.IIndexshowService;
import com.fk.service.INewsService;
import com.fk.service.IUserService;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 23/03/17.
 */

@Controller
public class Operative {

    @Autowired
    IUserService userService;

    @Autowired
    IIndexshowService iIndexshowService;

    @Autowired
    INewsService newsService;

    private static final int SIZE = 10;
    private static final int SIZENEW = 5;

    @RequestMapping("/operative" )
    public String index(HttpServletRequest request, Map<String, Object> map){
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

    @RequestMapping("/operative/info")
    public String info(){

        return "operative/info";
    }
    @RequestMapping("/operative/pass")
    public String pass(){

        return "operative/pass";
    }
    @RequestMapping("/operative/page")
    public String page(){

        return "operative/page";
    }
    @RequestMapping("/operative/adv")
    public String adv(HttpServletRequest request, Map<String , Object> map){
        List<NewsBean> newsBeans = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FOUR_INT;i++){
            IndexshowBean indexshowBean = iIndexshowService.selectByPrimaryKey(i);
            if(indexshowBean !=null && indexshowBean.getMid() != -1){
                newsBeans.add(newsService.selectByPrimaryKey(indexshowBean.getMid()));
            }
        }
        map.put("indexshow", newsBeans);

        int count = newsService.count();
        int page = 1;
        if(count % SIZENEW == 0)
            page = count / SIZENEW;
        else
            page = count / SIZENEW + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZENEW);
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
        int start = (toPage - 1) * SIZENEW;
        map.put("news", newsService.selectByStrat(start));

        return "operative/adv";
    }
    @RequestMapping("/operative/delnew")
    public String delnew(HttpServletRequest request, Map<String , Object> map){
        String id = request.getParameter("id");
        IndexshowBean indexshowBean = iIndexshowService.selectByPrimaryKey(Integer.parseInt(id));
        indexshowBean.setMid(-1);
        iIndexshowService.updateByPrimaryKey(indexshowBean);
        return adv(request, map);
    }

    @RequestMapping("/operative/delnews")
    public String delnews(HttpServletRequest request, Map<String , Object> map){
        String id = request.getParameter("id");
        newsService.deleteByPrimaryKey(Integer.parseInt(id));
        return adv(request, map);
    }

    @RequestMapping("/operative/addnews")
    public String addnews(HttpServletRequest request, Map<String , Object> map){
        String id = request.getParameter("id");
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FOUR_INT;i++){
            IndexshowBean indexshowBean = iIndexshowService.selectByPrimaryKey(i);
            if(indexshowBean.getMid() == -1){
                indexshowBean.setMid(Integer.parseInt(id));
                iIndexshowService.updateByPrimaryKey(indexshowBean);
            }
        }
        return adv(request, map);
    }
    @RequestMapping("/operative/book")
    public String book(){

        return "operative/book";
    }
    @RequestMapping("/operative/column")
    public String column(){

        return "operative/column";
    }


    @RequestMapping("/operative/deluser")
    public String deluser(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        userService.deleteByPrimaryKey(Integer.parseInt(id));
        return index(request, map);
    }

    @RequestMapping("/operative/updateuser")
    public String updateuser(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        User user = userService.selectUserByID(Integer.parseInt(id));
        user.setPassword(MD5.encodeMD5(password));
        userService.updateByPrimaryKey(user);

        return index(request, map);
    }

}
