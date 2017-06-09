package com.fk.controller;

import com.fk.bean.FileBean;
import com.fk.bean.UserBean;
import com.fk.service.CenterService;
import com.fk.service.OperativeService;
import com.fk.service.TagsService;
import com.fk.service.UserService;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.fk.util.StringUtil;
import com.google.common.base.Preconditions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

    @Autowired
    OperativeService operativeService;

    @RequestMapping("/center")
    public String center(HttpServletRequest request, Map<String, Object> map){
        String page = request.getParameter("page");
        String type = request.getParameter("type");

        if(!Login.islogin(request)){
            return "login";
        }
        int userId = Login.getUserId(request);
        int ralUserId = userId;
        UserBean userBean = userService.selectByPrimerKey(userId);
        if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2) {
            tagsService.centerOfUserTags(-1, map);
        }else{
            tagsService.centerOfUserTags(userId, map);
        }
        if("1".equals(type)){
            if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2)
                userId = -1;
            centerService.index(page, ralUserId, map);
        } else if("2".equals(type)){
            if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2)
                userId = -1;
            centerService.upload(page, userId, map);
        } else if("3".equals(type)){
            if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2)
                userId = -1;
            centerService.document(page, ralUserId, map);
        } else if("4".equals(type)){
            if(userBean.getIsmanage() == 1 || userBean.getIsmanage()== 2)
                userId = -1;
            centerService.peding(page, ralUserId, map);
        } else {
            centerService.index(page, ralUserId, map);
        }
        map.put("index", 3);
        map.put("user", userBean);
        map.put("count1", centerService.index_count(ralUserId));
        map.put("count2", centerService.upload_count(userId) );
        map.put("count3", centerService.document_count(ralUserId));
        map.put("count4", centerService.peding_count(ralUserId));
        return "center";
    }

    @RequestMapping("/myupload")
    public String myupload(HttpServletRequest request, Map<String, Object> map){
        operativeService.fileform(map);
        return "fileform";
    }

    @RequestMapping("/useraddfile")
    public String useraddfile(HttpServletRequest request, @RequestParam("file") MultipartFile file, Map<String, Object> map) {
        try {
            String title = request.getParameter("title");
            String tags = request.getParameter("tags");
            String ftype = request.getParameter("ftype");
            String ktype = request.getParameter("ktype");
            String abstract_S = request.getParameter("abstract_S");
            String content = StringUtil.blankOrEmpty(request.getParameter("content"));
            String can = request.getParameter("can");

            Preconditions.checkNotNull(title, "title cannot be null");
            Preconditions.checkNotNull(ktype, "ktype cannot be null");
            Preconditions.checkNotNull(ftype, "ftype cannot be null");
            Preconditions.checkNotNull(abstract_S, "abstract_S cannot be null");

            FileBean fileBean = new FileBean();
            fileBean.setAbstractS(abstract_S);
            fileBean.setFtypeid(Integer.parseInt(ftype));
            fileBean.setIntroduction(content);
            fileBean.setKtypeid(Integer.parseInt(ktype));
            fileBean.setTags(tags);
            fileBean.setTitle(title);
            fileBean.setUid(-1);
            fileBean.setUploadtime(new Date());
            fileBean.setCanTransforms(Integer.parseInt(can));
            fileBean.setCount(0);

            operativeService.useraddFile(fileBean, file, map);
            //ktypeService.addCount(fileBean);
            //tagsService.addUserTags(fileBean.getUid(), fileBean.getTags());
        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, "6");
            return "/info/error";
        }
        return myupload(request, map);
    }


}
