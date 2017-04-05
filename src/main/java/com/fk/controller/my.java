package com.fk.controller;

import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by fengkai on 05/04/17.
 */
@Controller
public class my {

    @RequestMapping(value = "addarticle")
    public String addarticle(HttpServletRequest request, Map<String, Object> map){



        return "";
    }
    @RequestMapping(value = "my")
    public String my(HttpServletRequest request, Map<String, Object> map){

        if(!Login.islogin(request)){
            return "login";
        }

        map.put("index", CommonConst.FIVE_INT);


        return "my";
    }


}
