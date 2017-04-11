package com.fk.controller;

import com.fk.bean.User;
import com.fk.service.IUserService;
import com.fk.util.MD5;
import com.fk.util.SendMail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;
import java.util.Random;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    IUserService userService ;

    @RequestMapping("/")
    public String index( Map<String, Object> map){
        return userService.index(map);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.login  in email[{}], password[{}].", email, password);

        return userService.login(request, map, email, password);
    }

    @RequestMapping(value = "regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = firstname + lastname;
        return userService.regis(request, map, username, email, password);
    }

    @RequestMapping(value = "forgot", method = RequestMethod.GET)
    public String forgotPassword(){
        return "forgot";
    }

    @RequestMapping(value = "sendmail", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        return userService.sendEmail(request, map , email);
    }

    @RequestMapping(value = "forgetPassword", method = RequestMethod.GET)
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map){
        String key_MD5 = request.getParameter("key");
        String key =MD5.decodeMD5(key_MD5);
        String[] str = key.split("@", 2);
        return userService.forgetPassword(request, map, str);
    }

}
