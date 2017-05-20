package com.fk.controller;

import com.fk.bean.UserBean;
import com.fk.service.CenterService;
import com.fk.service.TagsService;
import com.fk.service.UserService;
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

    @Autowired
    UserService userService;

    @Autowired
    TagsService tagsService;

    @RequestMapping("/center")
    public String center(HttpServletRequest request, Map<String, Object> map){
        String page = request.getParameter("page");
        String type = request.getParameter("type");

        if(!Login.islogin(request)){
            return "login";
        }
        int userId = Login.getUserId(request);

        UserBean userBean = userService.selectByPrimerKey(userId);
        if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2) {
            tagsService.centerOfUserTags(-1, map);
        }else{
            tagsService.centerOfUserTags(userId, map);
        }
        if("1".equals(type)){
            centerService.index(page, userId, map);
        } else if("2".equals(type)){
            if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2)
                userId = -1;
            centerService.upload(page, userId, map);
        } else if("3".equals(type)){
            centerService.document(page, userId, map);
        } else if("4".equals(type)){
            centerService.peding(userId, map);
        } else {
            centerService.index(page, userId, map);
        }
        map.put("index", 3);

        return "center";
    }

}
