package com.fk.controller;

import com.fk.service.CenterService;
import com.fk.util.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by FK on 2017/5/19.
 */
@Controller
public class CenterC {

    @Autowired
    CenterService centerService;

    @RequestMapping("/center")
    public String center(HttpServletRequest request, Map<String, Object> map){
        String page = request.getParameter("page");
        String type = request.getParameter("type");

        if(!Login.islogin(request)){
            return "login";
        }
        int userId = Login.getUserId(request);
        if("1".equals(type)){
            centerService.index(page, userId, map);
        } else if("2".equals(type)){
            centerService.upload(userId, map);
        } else if("3".equals(type)){
            centerService.document(userId, map);
        } else if("4".equals(type)){
            centerService.peding(userId, map);
        } else {
            centerService.index(page, userId, map);
        }
        map.put("index", 3);
        return "center";
    }

}
