package com.fk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by FK on 2017/4/9.
 */

@Controller
public class My {


    @RequestMapping("info")
    public String info(HttpServletRequest request, Map<String, Object> map){


        return "info";
    }


}
