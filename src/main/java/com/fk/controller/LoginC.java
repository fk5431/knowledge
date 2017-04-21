package com.fk.controller;

import com.fk.service.UserService;
import com.fk.util.MD5;
import com.google.common.base.Preconditions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    UserService userService ;

    @RequestMapping("/")
    public String index( Map<String, Object> map){
        return "/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.login  in email[{}], password[{}].", email, password);
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(password, "password cannot be null");

        userService.login(email, password, request, map);

        return "/WEB-INF/pages/index.html";
    }

    @RequestMapping(value = "regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.register  in name[{}], email[{}], password[{}].", name, email, password);
        Preconditions.checkNotNull(name, "name cannot be null");
        Preconditions.checkNotNull(email, "email cannot be null");
        Preconditions.checkNotNull(password, "password cannot be null");
        userService.register(name, email, password, request, map);
        return "login";
    }

    @RequestMapping(value = "forgot", method = RequestMethod.GET)
    public String forgotPassword(){
        return "forgot";
    }

    @RequestMapping(value = "sendmail")
    public String sendEmail(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        Preconditions.checkNotNull(email, "email cannot be null");

        int result = userService.sendEmail(email, map);

        if(result == 1){
            map.put("errorcode", 7);
            return "error";
        }else{
            map.put("errorcode", 4);
            return "error";
        }
    }

    @RequestMapping(value = "forgetPassword")
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map){
        String key_MD5 = request.getParameter("key");
        Preconditions.checkNotNull(key_MD5, "key cannot be null");
        String key =MD5.decodeMD5(key_MD5);
        String[] str = key.split("@", 2);
        int result = userService.forgetPassword(key, str, request, map);
        if(result == 1){
            map.put("email", str[1]);
            return "sendSuccess";
        }else{
            map.put("errorcode", 6);
            return "error";
        }
    }

}
