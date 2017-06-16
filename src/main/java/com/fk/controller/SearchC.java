package com.fk.controller;

import com.fk.service.SearchService_fk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by FK on 2017/5/22.
 */
@Controller
public class SearchC {

    @Autowired
    SearchService_fk service;

    @RequestMapping("/searchAll")
    public String searchAll(HttpServletRequest request, Map<String, Object> map){
        String search = request.getParameter("searchAll");
        String page  = request.getParameter("page");

        service.search(page, search, map);

        return "searchAll";
    }

    @RequestMapping("/searchType")
    public String searchType(HttpServletRequest request, Map<String, Object> map){
        String type = request.getParameter("type");
        String page  = request.getParameter("page");

        service.searchType(page, type, map);

        return "searchType";
    }

    @RequestMapping("/groupSearch")
    public String groupSearch(HttpServletRequest request, Map<String, Object> map){
        String[] bools = request.getParameterValues("booleans");
        String[] sections = request.getParameterValues("sections");
        String[] words = request.getParameterValues("searchWords");
        String page  = request.getParameter("page");
//        service.search(page, search, map);
        service.groupSearch(page, bools, sections, words, map);

        return "resource";
    }

}
