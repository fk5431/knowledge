package com.fk.controller;

import com.fk.bean.UserBean;
import com.fk.service.UserService;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import com.google.common.base.Preconditions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    UserService userService;

    @RequestMapping("/")
    public String indexshow(HttpServletRequest request, Map<String, Object> map) {
        return index(request, map);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map) {
        String name = request.getParameter("uname");
        String password = request.getParameter("pwd");
        logger.debug("LoginC.login  in name[{}], password[{}].", name, password);
        Preconditions.checkNotNull(name, "name cannot be null");
        Preconditions.checkNotNull(password, "password cannot be null");
        String uid = userService.login(name, password, request, map);
        if(!uid.equals("")){
            Cookie cookie = new Cookie(CommonConst.LOGIN, CommonConst.YES);
            Cookie cookie1 = new Cookie(CommonConst.USERID, uid);
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
            response.addCookie(cookie1);
        }
        Object errorcode =  map.get("errorcode");
        if (errorcode != null) {
            return "/info/error";
        }
        return index(request, map);
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map) {
        String name = request.getParameter("uname");
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        logger.debug("LoginC.register  in name[{}], email[{}], password[{}].", name, email, password);
        Preconditions.checkNotNull(name, "name cannot be null");
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(password, "password cannot be null");
        userService.register(name, email, password, request, map);
        Object errorcode =  map.get("errorcode");
        if (errorcode != null ) {
            return "/info/error";
        }
        return "login";
    }

    @RequestMapping(value = "forgot", method = RequestMethod.GET)
    public String forgotPassword() {
        return "forgot";
    }

    @RequestMapping(value = "sendmail")
    public String sendEmail(HttpServletRequest request, Map<String, Object> map) {
        String email = request.getParameter("email");
        Preconditions.checkNotNull(email, "email cannot be null");

        int result = userService.sendEmail(email, map);

        if (result == 1) {
            map.put("errorcode", 10);
            return "/info/error";
        } else {
            map.put("errorcode", 9);
            return "/info/error";
        }
    }

    @RequestMapping(value = "forgetPassword")
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map) {
        String key_MD5 = request.getParameter("key");
        Preconditions.checkNotNull(key_MD5, "key cannot be null");
        String key = MD5.decodeMD5(key_MD5);
        String[] str = key.split("@", 2);
        int result = userService.forgetPassword(key, str, request, map);
        if (result == 1) {
            map.put("email", str[1]);
            return "/info/info";
        } else {
            map.put("errorcode", 11);
            return "/info/error";
        }
    }

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, Map<String, Object> map){
        int userId = -1;
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if(c.getName().equals(CommonConst.USERID)){
                    userId = Integer.parseInt(c.getValue());
                }
            }
        }

        userService.index(userId, map);

        return "index";
    }
    @RequestMapping(value = "/userlogin")
    public String userlogin(HttpServletRequest request, Map<String, Object> map){


        return "login";
    }

}
