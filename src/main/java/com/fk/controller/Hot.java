package com.fk.controller;

import com.fk.bean.*;
import com.fk.dao.DiscussDao;
import com.fk.service.INewsService;
import com.fk.service.IPhotoService;
import com.fk.service.IUserService;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 22/03/17.
 */
@Controller
public class Hot {

    @Autowired
    INewsService newsService;

    @Autowired
    IPhotoService photoService;

    @Autowired
    DiscussDao discussDao;
    @Autowired
    IUserService  userService;

    private static final int SIZE = 10;

    @RequestMapping("/hot")
    public String hot_index(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", "4");

        String hottype = request.getParameter("hottype");
        if(hottype == null || "".equals(hottype)){
            hottype = "1";
        }
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }
        if(hottype.equals("2")){
            return hot_1(request, response, map);
        }else if(hottype.equals("3")){
            return hot_2(request, response, map);
        }else{
            List<NewsBean> newhotnew = newsService.selectByTimeForSix();
            List<NewsBean> hothotnew = newsService.selectByCount();
            List<PhotoBean> photoBeans = photoService.selectlastfour();
            List<ReturnPhotoBean> returnPhotoBeans = new ArrayList<>();
            for(PhotoBean p : photoBeans){
                ReturnPhotoBean returnPhotoBean = new ReturnPhotoBean();
                returnPhotoBean.setTitle(p.getTitle());
                returnPhotoBean.setId(p.getId());
                String[] imgs = p.getImages().split(CommonConst.SPLITOR);
                returnPhotoBean.setCount(imgs.length);
                returnPhotoBean.setImage1(imgs[0]);
                returnPhotoBean.setImage2(imgs[1]);
                returnPhotoBean.setImage3(imgs[2]);
                returnPhotoBean.setLookcount(p.getCount());
                returnPhotoBeans.add(returnPhotoBean);
            }
            map.put("newhotnew", newhotnew);
            map.put("hothotnew", hothotnew);
            map.put("photos", returnPhotoBeans);
        }

        return "hot";
    }


    @RequestMapping("/news")
    public String news(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", "0");
        int id = Integer.parseInt(request.getParameter("id"));
        NewsBean newsBean = newsService.selectByPrimaryKey(id);
        map.put("newsBean", newsBean);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }

        List<DiscussBean> discussBeans = discussDao.selectByNewsId(newsBean.getId());
        map.put("discuss", discussBeans);

        return "news";
    }
    @RequestMapping("/addDiscuss")

    public String addDiscuss(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", "0");
        int id = Integer.parseInt(request.getParameter("id"));
        String key = request.getParameter("key");
        String userId = "0";
        if(!Login.islogin(request)){
            return "log";
        }else {
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }

        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(CommonConst.USERID.equals(c.getName())){
                userId = c.getValue();
            }
        }
        User user = userService.selectUserByID(Integer.parseInt(userId));
        DiscussBean discussBean = new DiscussBean();
        discussBean.setUsername(user.getUsername());
        discussBean.setUserid(user.getId());
        discussBean.setContent(key);
        discussBean.setNewsid(id);
        discussBean.setTime(new Date());
        discussDao.insertSelective(discussBean);

        return news(request, response, map);
    }

    @RequestMapping("/photo")
    public String photo(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", "0");
        int id = Integer.parseInt(request.getParameter("id"));
        PhotoBean photoBean = photoService.selectByPrimaryKey(id);
        photoBean.setCount(photoBean.getCount() + 1);
        photoService.insert(photoBean);
        String[] imgs = photoBean.getImages().split(CommonConst.SPLITOR);
        map.put("images", imgs);
        map.put("title", photoBean.getTitle());

        return "photo";
    }

    private String hot_2(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map) {
        int count = photoService.count();
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
        List<PhotoBean> photoBeans = photoService.selectByStrat(start);
        List<ReturnPhotoBean> returnPhotoBeans = new ArrayList<>();
        for(PhotoBean p : photoBeans){
            ReturnPhotoBean returnPhotoBean = new ReturnPhotoBean();
            returnPhotoBean.setTitle(p.getTitle());
            returnPhotoBean.setId(p.getId());
            String[] imgs = p.getImages().split(CommonConst.SPLITOR);
            returnPhotoBean.setCount(imgs.length);
            returnPhotoBean.setImage1(imgs[0]);
            returnPhotoBean.setImage2(imgs[1]);
            returnPhotoBean.setImage3(imgs[2]);
            returnPhotoBean.setLookcount(p.getCount());
            returnPhotoBeans.add(returnPhotoBean);
        }
        map.put("photo", returnPhotoBeans);

        return "hot2";
    }

    private String hot_1(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map) {
        int count = newsService.count();
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
        map.put("news", newsService.selectByStrat(start));

        return "hot1";
    }


}
