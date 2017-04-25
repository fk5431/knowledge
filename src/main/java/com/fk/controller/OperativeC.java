package com.fk.controller;

import com.fk.bean.FileBean;
import com.fk.bean.FtypeBean;
import com.fk.bean.KtypeBean;
import com.fk.bean.UserBean;
import com.fk.service.OperativeService;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import com.fk.util.StringUtil;
import com.google.common.base.Preconditions;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * Created by fengkai on 24/04/17.
 */
@Controller
public class OperativeC {
    private Logger logger = LoggerFactory.getLogger(OperativeC.class);

    @Autowired
    OperativeService operativeService;

    @RequestMapping("/addfile")
    public String addFile(HttpServletRequest request, @RequestParam("file") MultipartFile file, Map<Object, String > map){

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
            fileBean.setUid(0);
            fileBean.setUploadtime(new Date());
            fileBean.setCanTransforms(Integer.parseInt(can));

            operativeService.addFile(fileBean, file, map);

        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, "6");
            return "/info/error";
        }


        return "/operative/fileform";
    }


    @RequestMapping("/adduser")
    public String adduser(HttpServletRequest request, Map<Object, String> map){
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String manage = request.getParameter("manage");
            Preconditions.checkNotNull(name, "name cannot be null");
            Preconditions.checkNotNull(email, "email cannot be null");
            Preconditions.checkNotNull(password, "password cannot be null");
            Preconditions.checkNotNull(manage, "manage cannot be null");
            UserBean userBean = new UserBean();
            userBean.setUname(name);
            userBean.setPwd(MD5.encodeMD5(password));
            userBean.setUemail(email);
            userBean.setIsmanage(Integer.parseInt(manage));

            operativeService.adduser(userBean, map);
            if(map.get(CommonConst.ERRORCODE) != null){
                return "/info/error";
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return "/operative/userform";
    }

    @RequestMapping("/addftype")
    public String addftype(HttpServletRequest request, Map<Object, String> map){
        try {
            String ftypename = request.getParameter("ftypename");
            String ftype = request.getParameter("ftype");
            Preconditions.checkNotNull(ftypename, "ftypename cannot be null");
            Preconditions.checkNotNull(ftype, "ftype cannot be null");

            FtypeBean ftypeBean = new FtypeBean();
            ftypeBean.setFtype(ftype);
            ftypeBean.setFtypename(ftypename);

            operativeService.addFtype(ftypeBean, map);


            if(map.get(CommonConst.ERRORCODE) != null){
                return "/info/error";
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return "/operative/ftypeform";
    }

    @RequestMapping("/addktype")
    public String addktype(HttpServletRequest request, @RequestParam("file") MultipartFile file,  Map<Object, String> map){
        try {
            String ktype = request.getParameter("ktype");
            Preconditions.checkNotNull(ktype, "ktype cannot be null");
            Preconditions.checkNotNull(file, "ktype cannot be null");

            KtypeBean ktypeBean = new KtypeBean();
            ktypeBean.setKtype(ktype);
            ktypeBean.setCount(0);

            operativeService.addKtype(ktypeBean, file, map);


            if(map.get(CommonConst.ERRORCODE) != null){
                return "/info/error";
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return "/operative/ktypeform";
    }

    @RequestMapping("/fileform")
    public String fileform(HttpServletRequest request, Map<String, Object> map){

        operativeService.fileform(map);

        return "/operative/fileform";
    }
    @RequestMapping("/userform")
    public String userform(){

        return "/operative/userform";
    }
    @RequestMapping("/ktypeform")
    public String ktypeform(){

        return "/operative/ktypeform";
    }
    @RequestMapping("/ftypeform")
    public String ftypeform(){

        return "/operative/ftypeform";
    }
}
