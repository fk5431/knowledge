package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    IDirectorService directorService;

    @Autowired
    IPerformerService performerService;

    @Autowired
    ITypeService typeService;

    @Autowired
    IMovieService movieService;

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

    @RequestMapping("/operative/addnewstolist")
    public String addnewstolist(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String , Object> map){
        String title = request.getParameter("title");
        String introduce = request.getParameter("introduce");
        String content = request.getParameter("content");
        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "image/news";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }

            img = "/movie/image/news/"+filename;
        }

        NewsBean newsBean = new NewsBean();
        newsBean.setCount(0);
        newsBean.setContent(content);
        newsBean.setTitle(title);
        newsBean.setIntroduce(introduce);
        newsBean.setTime(new Date(System.currentTimeMillis()));
        newsBean.setImage(img);

        newsService.insertSelective(newsBean);
        return page();
    }

    @RequestMapping("/operative/addmovie")
    public String addmovie(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String , Object> map){
        String title = request.getParameter("title");
        String etitle = request.getParameter("etitle");
        String type = request.getParameter("type");
        String area = request.getParameter("area");
        String time = request.getParameter("time");
        String time1 = request.getParameter("time1");
        String boxoffice = request.getParameter("boxoffice");
        String score = request.getParameter("score");
        String introduce = request.getParameter("introduce");
        String director = request.getParameter("director");
        String[] performer = request.getParameterValues("performer");
        String content = request.getParameter("content");
        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "image/movie";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }

            img = "/movie/image/movie/"+filename;
        }
        MovieBean movieBean = new MovieBean();
        movieBean.setScorenum(0);
        movieBean.setScore(Double.parseDouble(score));
        movieBean.setImage(img);
        movieBean.setIntroduce(introduce);
        movieBean.setLookcount(0);
        movieBean.setTitle(title);
        movieBean.setArea(area);
        movieBean.setBoxoffice(Integer.parseInt(boxoffice));
        movieBean.setEtitle(etitle);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        try {
            movieBean.setShowtime(dateFormat.parse(time));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        movieBean.setTime(time1);
        movieBean.setType(type);
        movieBean.setDirectorid(Integer.parseInt(director));
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<performer.length;i++){
            if(i == 0)
                sb.append(performer[i]);
            else{
                sb.append(CommonConst.SPLITOR);
                sb.append(performer[i]);
            }
        }
        movieBean.setPerformerids(sb.toString());

//        movieBean.setAtlas();
//        <p><img src="http://127.0.0.1:8080/movie/image/upload/20170324/1490349345219013330.jpg" title="1490349345219013330.jpg"/></p><p><img src="http://127.0.0.1:8080/movie/image/upload/20170324/1490349345220025367.png" title="1490349345220025367.png"/></p><p><img src="http://127.0.0.1:8080/movie/image/upload/20170324/1490349345238061557.jpg" title="1490349345238061557.jpg"/></p><p><img src="http://127.0.0.1:8080/movie/image/upload/20170324/1490349345282050166.jpg" title="1490349345282050166.jpg"/></p><p><img src="http://127.0.0.1:8080/movie/image/upload/20170324/1490349345299086634.jpg" title="1490349345299086634.jpg"/></p><p><br/></p>
        movieService.insertSelective(movieBean);

        return book(request, map);
    }
    @RequestMapping("/operative/book")
    public String book( HttpServletRequest request, Map<String, Object> map){

        List<DirectorBean> directorBeans = directorService.selectAll();
        map.put("director", directorBeans);

        List<PerformerBean> performerBeans = performerService.selectAll();
        map.put("performer", performerBeans);

        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);

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
