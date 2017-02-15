package com.fk.controller;

import com.fk.bean.User;
import com.fk.service.IUserService;
import com.fk.util.MD5;
import com.fk.util.SendMail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;
import java.util.Random;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    @Autowired
    IUserService userService ;

    @RequestMapping("/")
    public String index( Map<String, Object> map){
        map.put("login", 1);
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.login  in email[{}], password[{}].", email, password);
        User exists = userService.selectUserByEmail(email);
        if(exists != null){
            map.put("errorcode", 2);
            return "error";
        }
        if(!MD5.encodeMD5(password).equals(exists.getPassword())){
            map.put("errorcode", 3);
            return "error";
        }

        return "index";
    }

    @RequestMapping(value = "regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User exists = userService.selectUserByEmail(email);
        if(exists != null){
            map.put("errorcode", 1);
            return "error";
        }

        User user = new User();
        user.setUsername(firstname+lastname);
        user.setEmail(email);
        user.setPassword(MD5.encodeMD5(password));
        int id = userService.saveUser(user);
        logger.debug("LoginC.register  in firstname[{}], lastname[{}], email[{}], password[{}], id[{}]", firstname, lastname, email, password, id);

        map.put("login", 1);
        return "index";
    }

    @RequestMapping(value = "forgot", method = RequestMethod.GET)
    public String forgotPassword(){
        return "forgot";
    }

    @RequestMapping(value = "sendmail", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        Date now = new Date();
        String currentTime = "" + now.getTime();
        String urlString = "http://localhost:8080/forgetPassword?key=";
        String encryptedCode = MD5.encodeMD5(currentTime + "@" + email);
        String link = "<a href=\""+urlString + encryptedCode+"\"></a>";
        logger.debug("LoginC.sendMail in email[{}], link[{}]", email, link);
        int result = SendMail.sendEmailToOne("smtp.qq.com",email,"知识库密码找回","请点击链接完成密码修改"+link +urlString + encryptedCode ,"text/html;charset=utf-8");
        if(result == 1){
            map.put("errorcode", 7);
            return "error";
        }else{
            map.put("errorcode", 4);
            return "error";
        }
    }

    @RequestMapping(value = "forgetPassword", method = RequestMethod.GET)
    public String forgetPassword(HttpServletRequest request, Map<String, Object> map){
        String key_MD5 = request.getParameter("key");
        String key =MD5.decodeMD5(key_MD5);
        String[] str = key.split("@", 2);
        Date date = new Date();
        logger.debug("LoginC. forgetPassword in key[{}], str[0][{}]" , key, str[0]);
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
            User user = userService.selectUserByEmail(str[1]);
            user.setPassword(MD5.encodeMD5(sb.toString()));
            userService.updateByEmail(user);
            return "sendSuccess";
        }else{
            map.put("errorcode", 6);
            return "error";
        }
    }

}
