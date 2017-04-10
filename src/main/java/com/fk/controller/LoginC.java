package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.fk.util.MD5;
import com.fk.util.SendMail;
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
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    IUserService userService ;

    @Autowired
    IIndexshowService iIndexshowService;

    @Autowired
    INewsService newsService;

    @Autowired
    IHotmovieService hotmovieService;

    @Autowired
    IForthcomingService forthcomingService;

    @Autowired
    IIsthefileService iIsthefileService;

    @Autowired
    IMovieService movieService;


    @RequestMapping("/")
    public String index(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        map.put("index", CommonConst.ONE_INT);

        List<NewsBean> newsBeans = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FOUR_INT;i++){
            IndexshowBean indexshowBean = iIndexshowService.selectByPrimaryKey(i);
            if(indexshowBean !=null && indexshowBean.getMid() != -1){
                newsBeans.add(newsService.selectByPrimaryKey(indexshowBean.getMid()));
            }
        }
        map.put("indexshow", newsBeans);
        List<MovieBean> listhot = movieService.selectByType("1");
        map.put("type1", listhot.subList(0,listhot.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:listhot.size()));

        List<MovieBean> listcoming = movieService.selectByType("2");
        map.put("type2", listcoming.subList(0,listcoming.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:listcoming.size()));

        List<MovieBean> lististhefile = movieService.selectByType("3");
        map.put("type3", lististhefile.subList(0,lististhefile.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:lististhefile.size()));

        lististhefile = movieService.selectByType("4");
        map.put("type4", lististhefile.subList(0,lististhefile.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:lististhefile.size()));

        lististhefile = movieService.selectByType("5");
        map.put("type5", lististhefile.subList(0,lististhefile.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:lististhefile.size()));

        lististhefile = movieService.selectByType("6");
        map.put("type6", lististhefile.subList(0,lististhefile.size()>CommonConst.EIGHT_INT?CommonConst.EIGHT_INT:lististhefile.size()));

        List<MovieBean> salered = movieService.selectSortByBoxofficeOfTen();
        map.put("salered", salered);

        List<MovieBean> look = movieService.selectSortByLookCountOfTen();
        map.put("look", look);

        List<MovieBean> score = movieService.selectSortByScoreOfTen();
        map.put("score", score);

        List<MovieBean> time = movieService.selectSortByTimeOfTen();
        map.put("time", time);
        if(Login.islogin(request)){
            map.put("login", CommonConst.YES);
        }

        return "index";
    }


    @RequestMapping("/log")
    public String log(){
        return "log";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if("login".equals(c.getName())){
                c.setValue("no");
                response.addCookie(c);
            }else if(CommonConst.USERID.equals(c.getName())){
                c.setMaxAge(1);
                response.addCookie(c);
            }
        }


        return "log";
    }
    @RequestMapping("/reg")
    public String reg(){
        return "reg";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.login  in email[{}], password[{}].", email, password);
        User exists = userService.selectUserByEmail(email);

        if(exists == null){
            map.put("errorcode", 2);
            return "error";
        }
        if(!MD5.decodeMD5(exists.getPassword()).equals(password)){
            map.put("errorcode", 3);
            return "error";
        }
        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if("login".equals(c.getName()) && "yes".equals(c.getValue())){
                return index(request, response, map);
            }
        }
        Cookie cookie = new Cookie("login", "yes");
        Cookie cookie1 = new Cookie(CommonConst.USERID, String.valueOf(exists.getId()));
        cookie.setMaxAge(-1);
        response.addCookie(cookie);
        response.addCookie(cookie1);
        map.put("login", CommonConst.YES);
        return index(request, response, map);
    }

    @RequestMapping(value = "regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User exists = userService.selectUserByEmail(email);
        if(exists != null){
            map.put("errorcode", 1);
            return "error";
        }
        if("".equals(name) || "".equals(email) || "".equals(password)){
            map.put("errorcode", 1);
            return "error";
        }
        User user = new User();
        user.setUsername(name);
        user.setEmail(email);
        user.setPassword(MD5.encodeMD5(password));
        int id = userService.saveUser(user);
        logger.debug("LoginC.register  in name[{}], email[{}], password[{}], id[{}]", name, email, password, id);

        map.put("login", 1);
        return "log";
    }

    @RequestMapping(value = "forgot", method = RequestMethod.GET)
    public String forgotPassword(){
        return "forgot";
    }

    @RequestMapping(value = "sendmail", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        Date now = new Date();
        String currentTime = "" + now.getTime();
        String urlString = "http://localhost:8080/movie/forgetPassword?key=";
        String encryptedCode = MD5.encodeMD5(currentTime + "@" + email);
        String link = "<a href=\""+urlString + encryptedCode+"\"></a>";
        logger.debug("LoginC.sendMail in email[{}], link[{}]", email, link);
        int result = SendMail.sendEmailToOne("smtp.qq.com",email,"知识库密码找回","请点击链接完成密码修改"+link +urlString + encryptedCode ,"text/html;charset=utf-8");
        if(result == 1){
            map.put("errorcode", 7);
            return "error";
        }else{
            map.put("errorcode", 4);
            return "error";
        }
    }

    @RequestMapping(value = "forgetPassword", method = RequestMethod.GET)
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map){
        String key_MD5 = request.getParameter("key");
        String key =MD5.decodeMD5(key_MD5);
        String[] str = key.split("@", 2);
        Date date = new Date();
        logger.debug("LoginC. forgetPassword in key[{}], str[0][{}]" , key, str[0]);
        long before = Long.valueOf(str[0]);
        long now = date.getTime();
        if(now - before > 180 * 1000){
            map.put("errorcode", 5);
            return "error";
        }
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<8;i++){
            int num = random.nextInt(53);
            if(num % 2 == 0){
                sb.append((char)('A' + num));
            }else{
                sb.append(random.nextInt(10));
            }
        }
        int result = SendMail.sendEmailToOne("smtp.qq.com",str[1],"知识库密码","密码重置为"+sb.toString(),"text/html;charset=utf-8");
        if(result == 1){
            map.put("email", str[1]);
            User user = userService.selectUserByEmail(str[1]);
            user.setPassword(MD5.encodeMD5(sb.toString()));
            userService.updateByEmail(user);
            return "sendSuccess";
        }else{
            map.put("errorcode", 6);
            return "error";
        }
    }

}
