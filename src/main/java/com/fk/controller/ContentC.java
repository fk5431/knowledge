package com.fk.controller;

import com.fk.bean.TravelBean;
import com.fk.dao.TravelDao;
import com.fk.serviceImpl.TravelServiceImpl;
import com.fk.util.CommonConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    public TravelServiceImpl travelService;

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

    @RequestMapping("/article")
    public String article(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);
        String id = request.getParameter("id");
        TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
        travelBean.setLookcount(travelBean.getLookcount() + CommonConst.ONE_INT);
        travelService.updateByPrimaryKey(travelBean);
        map.put("travel", travelBean);
        return "context";
    }

    @RequestMapping("count_context")
    public String addCount(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        if(id!=null) {
            TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
            travelBean.setCount(travelBean.getCount() + CommonConst.ONE_INT);
            travelService.updateByPrimaryKey(travelBean);
        }
        return article(request, map);
    }

}
