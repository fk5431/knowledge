package com.fk.controller;

import com.fk.dao.UserDao;
import com.fk.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
@RequestMapping("/")
public class LoginC {
    @Autowired
    IUserService userService ;

    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value="username") String username, @RequestParam(value = "password") String password) {
        System.out.println(userService.selectUserByID(1));
        return "index";
    }
}
