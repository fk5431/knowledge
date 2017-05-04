package com.fk.controller;

import com.fk.service.ResourceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by fengkai on 03/05/17.
 */
@Controller
public class Resource {

    private Logger logger = LoggerFactory.getLogger(Resource.class);

    @Autowired
    ResourceService resourceService;

    @RequestMapping("/resource")
    public String resource(HttpServletRequest request, Map<String, Object> map) {

        String page = request.getParameter("page");

        resourceService.resource(page, map);

        return "resource";
    }


}
