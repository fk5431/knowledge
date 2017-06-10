package com.fk.service;

import com.fk.bean.CdirectoryBean;
import com.fk.bean.CdocumentBean;
import com.fk.bean.FileBean;
import com.fk.bean.UserBean;
import com.fk.dao.CdocumentDao;
import com.fk.dao.FileDao;
import com.fk.dao.UserDao;
import com.fk.util.*;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/2/9.
 */

@Service("userService")
public class UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    CdirectoryService cdirectoryService;

    @Autowired
    CdocumentDao cdocumentDao;

    @Autowired
    FileDao fileDao;

    private final int SIZE = 10;


    private Logger logger = LoggerFactory.getLogger(UserService.class);

    public String login(String name, String password, HttpServletRequest request, Map<String, Object> map) {
        try {
            UserBean exists = userDao.selectByName(name);
            if (exists == null) {
                map.put("errorcode", 2);
                return "";
            }
            if (!MD5.decodeMD5(exists.getPwd()).equals(password)) {
                map.put("errorcode", 3);
                return "";
            }
            return String.valueOf(exists.getUid());
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.login  in name[{}], password[{}], id[{}]", name, password, e);
        }
        return "";
    }

    public void register(String name, String email, String password, HttpServletRequest request, Map<String, Object> map) {
        try {
            UserBean exists = userDao.selectByEmail(email);
            UserBean existsname = userDao.selectByName(name);
            if (exists != null) {
                map.put("errorcode", 1);
                return;
            }
            if (existsname != null) {
                map.put("errorcode", 4);
                return;
            }
            UserBean user = new UserBean();
            user.setUname(name);
            user.setUemail(email);
            user.setPwd(MD5.encodeMD5(password));
            user.setIsmanage(0);
            userDao.insertSelective(user);

            map.put("login", 1);
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.register  in name[{}], email[{}], password[{}], id[{}]", name, email, password, e);
        }
    }

    public int sendEmail(String email, Map<String, Object> map) {
        try {
            Date now = new Date();
            String currentTime = "" + now.getTime();
            String urlString = "http://localhost:8080/knowledge/forgetPassword?key=";
            String encryptedCode = MD5.encodeMD5(currentTime + "@" + email);
            String link = "<a href=\"" + urlString + encryptedCode + "\">链接</a>";
            logger.debug("LoginC.sendMail in email[{}], link[{}]", email, link);
            SendMail send = new SendMail();
            int re = send.sendEmailToOne(email, "知识库密码找回", "请点击链接完成密码修改" + link + "  " + urlString + encryptedCode);
            return re;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int forgetPassword(String key, String[] str, HttpServletRequest request, Map<String, Object> map) {
        try {
            Date date = new Date();
            long before = Long.valueOf(str[0]);
            long now = date.getTime();
            if (now - before > 180 * 1000) {
                map.put("errorcode", 5);
                return -1;
            }
            String resetP = RandomUtil.Random();
            SendMail send = new SendMail();
            int re = send.sendEmailToOne(str[1], "知识库密码", "密码重置为" + resetP);
            if (re != CommonConst.ONE_INT) {
                return re;
            }
            UserBean user = userDao.selectByEmail(str[1]);
            user.setPwd(MD5.encodeMD5(resetP));
            userDao.updateByEmail(user);
            return re;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return -1;
        }
    }


    public void index(int userId, Map<String, Object> map) {
        UserBean user = null;
        if (userId != -1) {
            user = userDao.selectByPrimaryKey(userId);
        }

        if (user == null) {
            noUser(map);
        } else {
            userIndex(user, map);
        }
        List<CdirectoryBean> cdirectoryBeans = cdirectoryService.selectByLastTen();
        List<FileBean> fileBeans = fileDao.selectByCountFive();
        List<String> top = Lists.newArrayList();
        for(FileBean f : fileBeans){
            top.add(f.getTitle());
        }
        map.put("top", top);
        map.put("directory", cdirectoryBeans);
        map.put("index", 1);
    }

    private void userIndex(UserBean user, Map<String, Object> map) {
//ⅠⅡ Ⅲ
        //TODO
        File file = new File("D:\\upload\\intro.csv");
        FileWriter fileWritter = null;
        BufferedWriter bufferWritter = null;
        try {
            fileWritter = new FileWriter(file,false);

            bufferWritter = new BufferedWriter(fileWritter);
            List<CdocumentBean> document = cdocumentDao.selectAll();
            for(CdocumentBean d : document){
    //				System.out.println(d.toString());
                bufferWritter.write(d.toString());
                bufferWritter.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                bufferWritter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Recommend recommend = new Recommend();

        try {
            List<Integer> list = recommend.getID(user.getUid());
//            userfile = dao.getFile(list);
            List<FileBean> userfile = Lists.newArrayList();
            for(Integer i : list){
                FileBean fileBean = fileDao.selectByPrimaryKey(i);
                userfile.add(fileBean);
            }
            map.put("userfile", userfile);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void noUser(Map<String, Object> map) {
        //userfile
        List<FileBean> fileBeans = fileDao.selectByCountSix();
        map.put("userfile", fileBeans);
    }

    public void superlogin(UserBean userBean, HttpServletResponse response, Map<String, Object> map) {
        try {
            UserBean exists = userDao.selectByName(userBean.getUname());
            if (exists == null) {
                map.put("errorcode", 2);
                return;
            }
            if (!MD5.decodeMD5(exists.getPwd()).equals(userBean.getPwd())) {
                map.put("errorcode", 3);
                return;
            }
            if (exists.getIsmanage() != 2 && exists.getIsmanage() != 0) {
                map.put(CommonConst.ERRORCODE, 2);
                return;
            }
            if (exists.getIsmanage() == 2) {
                Cookie cookie1 = new Cookie(CommonConst.SUPERUSERID, CommonConst.YES);
                response.addCookie(cookie1);
            } else {
                Cookie cookie1 = new Cookie(CommonConst.SUPERUSERID, CommonConst.NO);
                response.addCookie(cookie1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.login  in name[{}], password[{}], id[{}]", userBean.getUname(), userBean.getPwd(), e);
        }
    }

    public void selectAllUser(String page_, Map<String, Object> map) {
        try {
            int count = userDao.count();
            int page = 1;
            if (count % SIZE == 0)
                page = count / SIZE;
            else
                page = count / SIZE + CommonConst.ONE_INT;
            map.put("count", count);
            map.put("size", SIZE);
            map.put("page", page);
            int toPage;
            if (page_ == null || "".equals(page_)) {
                toPage = 1;
            } else {
                toPage = Integer.parseInt(page_);
            }
            if (toPage > page) {
                toPage = page;
            }
            map.put("pageNow", toPage);
            int start = (toPage - 1) * SIZE;
            List<UserBean> list = userDao.selectByStartAnd1(start);
            List<UserBean> userBeans = new ArrayList<>();
            for (UserBean u : list) {
                u.setPwd(MD5.decodeMD5(u.getPwd()));
                userBeans.add(u);
            }
            map.put("user", userBeans);

        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.selectAllUser  in ]", e);
        }
    }

    public void updateUser(UserBean userBean, Map<String, Object> map) {
        try {
            UserBean userUpdate = userDao.selectByPrimaryKey(userBean.getUid());
            if (userBean.getUname() != null && !"".equals(userBean.getUname())) {
                userUpdate.setUname(userBean.getUname());
            }
            if (userBean.getPwd() != null && !"".equals(userBean.getPwd())) {
                userUpdate.setPwd(MD5.encodeMD5(userBean.getPwd()));
            }
            if (userBean.getUemail() != null && !"".equals(userBean.getUemail())) {
                userUpdate.setUemail(userBean.getUemail());
            }
            userDao.updateByPrimaryKey(userUpdate);

        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.selectAllUser  in ]", e);
        }
    }

    public void delUser(int i, Map<String, Object> map) {
        userDao.deleteByPrimaryKey(i);
    }

    public void selectAllSuperUser(HttpServletRequest request, Map<String, Object> map) {
        try {
            List<UserBean> userBeans = userDao.selectALL_2();
            for (UserBean u : userBeans) {
                u.setPwd(MD5.decodeMD5(u.getPwd()));
            }
            map.put("user", userBeans);
        } catch (Exception e) {
            e.printStackTrace();
            logger.debug("UserService.selectAllUser  in ]", e);
        }
    }

    public UserBean selectByPrimerKey(int userId) {
        return userDao.selectByPrimaryKey(userId);
    }


}
