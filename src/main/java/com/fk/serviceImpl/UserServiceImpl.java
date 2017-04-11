package com.fk.serviceImpl;

import com.fk.bean.User;
import com.fk.dao.UserDao;
import com.fk.service.IUserService;
import com.fk.util.MD5;
import com.fk.util.SendMail;
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
public class UserServiceImpl implements IUserService {
    @Autowired
    UserDao userDao;

    @Override
    public String index(Map<String, Object> map) {
        map.put("login", 1);
        return "login";
    }

    @Override
    public String login(HttpServletRequest request, Map<String, Object> map, String email, String password) {
        User exists = userDao.selectByEmail(email);
        if(exists == null){
            map.put("errorcode", 2);
            return "error";
        }
        if(!MD5.decodeMD5(exists.getPassword()).equals(password)){
            map.put("errorcode", 3);
            return "error";
        }

        return "index";
    }

    @Override
    public String regis(HttpServletRequest request, Map<String, Object> map, String username, String email, String password) {
        User exists = userDao.selectByEmail(email);
        if(exists != null){
            map.put("errorcode", 1);
            return "error";
        }

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(MD5.encodeMD5(password));
        userDao.insertSelective(user);

        map.put("login", 1);
        return "login";
    }

    @Override
    public String sendEmail(HttpServletRequest request, Map<String, Object> map, String email) {
        Date now = new Date();
        String currentTime = "" + now.getTime();
        String urlString = "http://localhost:8080"+request.getContextPath()+"/forgetPassword?key=";
        String encryptedCode = MD5.encodeMD5(currentTime + "@" + email);
        String link = "<a href=\""+urlString + encryptedCode+"\"></a>";
        int result = SendMail.sendEmailToOne("smtp.qq.com",email,"知识库密码找回","请点击链接完成密码修改"+link +urlString + encryptedCode ,"text/html;charset=utf-8");
        if(result == 1){
            map.put("errorcode", 7);
            return "error";
        }else{
            map.put("errorcode", 4);
            return "error";
        }
    }

    @Override
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map, String[] str) {
        Date date = new Date();
        long before = Long.valueOf(str[0]);
        long now = date.getTime();
        if(now - before > 180 * 1000){
            map.put("errorcode", 5);
            return "error";
        }
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<8;i++){
            int num = random.nextInt(53);
            if(num % 2 == 0){
                sb.append((char)('A' + num));
            }else{
                sb.append(random.nextInt(10));
            }
        }
        int result = SendMail.sendEmailToOne("smtp.qq.com",str[1],"知识库密码","密码重置为"+sb.toString(),"text/html;charset=utf-8");
        if(result == 1){
            map.put("email", str[1]);
            User user = userDao.selectByEmail(str[1]);
            user.setPassword(MD5.encodeMD5(sb.toString()));
            userDao.updateByEmail(user);
            return "sendSuccess";
        }else{
            map.put("errorcode", 6);
            return "error";
        }
    }
}
