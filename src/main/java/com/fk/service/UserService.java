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

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

    public void login(String email, String password, HttpServletRequest request, Map<String, Object> map) {
        try{
            UserBean exists = userDao.selectByEmail(email);
            if(exists == null){
                map.put("errorcode", 2);
                return;
            }
            if(!MD5.decodeMD5(exists.getPwd()).equals(password)){
                map.put("errorcode", 3);
                return;
            }
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("UserService.login  in email[{}], password[{}], id[{}]", email, password, e);
        }
    }

    public void register(String name, String email, String password, HttpServletRequest request, Map<String, Object> map) {
        try {
            UserBean exists = userDao.selectByEmail(email);
            if(exists != null){
                map.put("errorcode", 1);
                return;
            }
            UserBean user = new UserBean();
            user.setUemail(name);
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


}
