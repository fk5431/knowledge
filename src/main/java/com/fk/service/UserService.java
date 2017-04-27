package com.fk.service;

import com.fk.bean.UserBean;
import com.fk.dao.UserDao;
import com.fk.util.CommonConst;
import com.fk.util.MD5;
import com.fk.util.RandomUtil;
import com.fk.util.SendMail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by FK on 2017/2/9.
 */

@Service("userService")
public class UserService {

    @Autowired
    UserDao userDao;

    private Logger logger = LoggerFactory.getLogger(UserService.class);

    public void login(String name, String password, HttpServletRequest request, Map<String, Object> map, Cookie c) {
        try{
            UserBean exists = userDao.selectByName(name);
            if(exists == null){
                map.put("errorcode", 2);
                return;
            }
            if(!MD5.decodeMD5(exists.getPwd()).equals(password)){
                map.put("errorcode", 3);
                return;
            }
            c.setValue(String .valueOf(exists.getUid()));
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("UserService.login  in name[{}], password[{}], id[{}]", name, password, e);
        }
    }

    public void register(String name, String email, String password, HttpServletRequest request, Map<String, Object> map) {
        try {
            UserBean exists = userDao.selectByEmail(email);
            UserBean existsname = userDao.selectByName(name);
            if(exists != null){
                map.put("errorcode", 1);
                return;
            }
            if(existsname != null){
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
            logger.debug("UserService.register  in name[{}], email[{}], password[{}], id[{}]", name,  email, password, e);
        }
    }

    public int sendEmail(String email, Map<String, Object> map) {
        try {
            Date now = new Date();
            String currentTime = "" + now.getTime();
            String urlString = "http://localhost:8080/forgetPassword?key=";
            String encryptedCode = MD5.encodeMD5(currentTime + "@" + email);
            String link = "<a href=\""+urlString + encryptedCode+"\">链接</a>";
            logger.debug("LoginC.sendMail in email[{}], link[{}]", email, link);
            SendMail send = new SendMail();
            int re = send.sendEmailToOne(email,"知识库密码找回","请点击链接完成密码修改"+link + "  " +urlString + encryptedCode);
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
            if(now - before > 180 * 1000){
                map.put("errorcode", 5);
                return -1;
            }
            String resetP = RandomUtil.Random();
            SendMail send = new SendMail();
            int re = send.sendEmailToOne(str[1],"知识库密码","密码重置为"+resetP);
            if(re != CommonConst.ONE_INT){
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
        if(userId != 0){
            user = userDao.selectByPrimaryKey(userId);
        }

        if(user == null ){
            noUser(map);
        }else {
            userIndex(user, map);
        }

//        File file = new File("D:\\upload\\intro.csv");
//        FileWriter fileWritter = new FileWriter(file,false);
//        BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
//        for(Cdocument d : document){
////				System.out.println(d.toString());
//            bufferWritter.write(d.toString());
//            bufferWritter.newLine();
//        }
//        bufferWritter.close();
    }

    private void userIndex(UserBean user, Map<String, Object> map) {
        
        
    }

    private void noUser(Map<String, Object> map) {
        
        
    }

    public void superlogin(UserBean userBean, HttpServletResponse response, Map<String, Object> map) {
        try{
            UserBean exists = userDao.selectByName(userBean.getUname());
            if(exists == null){
                map.put("errorcode", 2);
                return;
            }
            if(!MD5.decodeMD5(exists.getPwd()).equals(userBean.getPwd())){
                map.put("errorcode", 3);
                return;
            }
            if(exists.getIsmanage() != 2 && exists.getIsmanage() != 0){
                map.put(CommonConst.ERRORCODE, 2);
                return;
            }
            if(exists.getIsmanage() == 2) {
                Cookie c = new Cookie(CommonConst.SUPERUSERID, CommonConst.YES);
                c.setMaxAge(-1);
                response.addCookie(c);
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("UserService.login  in name[{}], password[{}], id[{}]", userBean.getUname(), userBean.getPwd(), e);
        }
    }

    public void selectAllUser(HttpServletRequest request, Map<String, Object> map) {
        try{
            List<UserBean> userBeans = userDao.selectALL_1();
            for(UserBean u : userBeans){
                u.setPwd(MD5.decodeMD5(u.getPwd()));
            }
            map.put("user", userBeans);
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("UserService.selectAllUser  in ]",  e);
        }
    }

    public void updateUser(UserBean userBean, Map<String, Object> map) {
        try{
            UserBean userUpdate = userDao.selectByPrimaryKey(userBean.getUid());
            if(userBean.getUname() != null && !"".equals(userBean.getUname())){
                userUpdate.setUname(userBean.getUname());
            }
            if(userBean.getPwd() != null && !"".equals(userBean.getPwd())){
                userUpdate.setPwd(MD5.encodeMD5(userBean.getPwd()));
            }
            if(userBean.getUemail() != null && !"".equals(userBean.getUemail())){
                userUpdate.setUemail(userBean.getUemail());
            }
            userDao.updateByPrimaryKey(userUpdate);

        }catch (Exception e){
            e.printStackTrace();
            logger.debug("UserService.selectAllUser  in ]",  e);
        }
    }

    public void delUser(int i, Map<String, Object> map) {
        userDao.deleteByPrimaryKey(i);
    }
}