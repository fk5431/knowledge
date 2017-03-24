package com.fk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by fk on 2017/3/25.
 */
@Controller
public class OperativeAdv {

    @RequestMapping("/operative/der")
    public String der (HttpServletRequest request, Map<String, Object> map){
        return "";
    }
    @RequestMapping("/operative/per")
    public String per(HttpServletRequest request, Map<String, Object> map){
        return "";
    }
    @RequestMapping("/operative/type")
    public String type(HttpServletRequest request, Map<String, Object> map){
        return "";
    }

}
