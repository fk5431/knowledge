package com.fk.controller;

import com.fk.bean.User;
import com.fk.service.IUserService;
import com.fk.util.MD5;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

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
        map.put("login", 1);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.login  in email[{}], password[{}].", email, password);


        return "index";
    }

    @RequestMapping(value = "regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User exists = userService.selectUserByEmail(email);
        if(exists != null){
            map.put("errorcode", 1);
            return "error";
        }

        User user = new User();
        user.setUsername(firstname+lastname);
        user.setEmail(email);
        user.setPassword(MD5.encodeMD5(password));
        int id = userService.saveUser(user);
        logger.debug("LoginC.register  in firstname[{}], lastname[{}], email[{}], password[{}], id[{}]", firstname, lastname, email, password, id);

        map.put("login", 1);
        return "index";
    }


}
