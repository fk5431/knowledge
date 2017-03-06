package com.fk.controller;

import com.fk.util.CommonConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by fengkai on 06/03/17.
 */
@Controller
public class ContentC {

    private Logger logger = LoggerFactory.getLogger(ContentC.class);


    @RequestMapping("/context")
    public String context_index(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);


        return "context";
    }

    @RequestMapping("/content_list")
    public String context_list(Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);


        return "content";
    }

}
