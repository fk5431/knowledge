package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.fk.util.MD5;
import com.fk.util.SendMail;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * Created by FK on 2017/2/3.
 */
@Controller
public class LoginC {
    private Logger logger = LoggerFactory.getLogger(LoginC.class);

    private static final int SIZE = CommonConst.SIX_INT;

    @Autowired
    IUserService userService ;

    @Autowired
    IIndexShowService indexShowService;

    @Autowired
    ITravelService travelService;

    @Autowired
    IIndexshowshopService indexshowshopService;

    @Autowired
    IOrdersService iOrdersService;

    @Autowired
    ILiketravelService liketravelService;

    @Autowired
    ICloudService cloudService;

    @RequestMapping("/")
    public String index(HttpServletRequest request, Map<String, Object> map){
        //首页最上面样式
        map.put("index", CommonConst.ONE_INT);
        //轮播图位置
        List<TravelBean> list = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FIVE_INT;i++){
            IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(i);
            if(indexShowBean != null && indexShowBean.getMid() != -1){
                TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
                if(travelBean !=null)
                     list.add(travelBean);
            }
        }
        map.put("list", list);
        //热卖爆款
        List<OrdersBean> listorders = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.THREE_INT;i++){
            IndexshowshopBean indexshowshopBean  = indexshowshopService.selectByPrimaryKey(i);
            if(indexshowshopBean != null  && indexshowshopBean.getMid() != -1){
                OrdersBean ordersBean = iOrdersService.selectByPrimaryKey(indexshowshopBean.getMid());
                if(ordersBean != null)
                    listorders.add(ordersBean);
            }
        }
        map.put("orders", listorders);
        //热门游记
        List<TravelBean> travelList = new ArrayList<>();
        int count = travelService.countOverFive();
        int page = 1;
        if(count % SIZE == 0)
            page = count / SIZE;
        else
            page = count / SIZE + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZE);
        map.put("page", page);
        String page_ = request.getParameter("page");
        int toPage;
        if(page_ == null || "".equals(page_)){
            toPage = 1;
        }else {
            toPage = Integer.parseInt(page_);
        }
        if(toPage > page){
            toPage = page;
        }
        map.put("pageNow", toPage);
//        for(int i=1;i<=SIZE ;i++){
//            TravelBean travelBean = travelService.selectByPrimaryKey((toPage - 1) * SIZE + i);
//            if(travelBean == null){
//
//            }else {
//                if(travelBean.getCount() >= 5)
//                travelList.add(travelBean);
//            }
//        }
        travelList = travelService.selectByCountOverFive();
        if(travelList.size() > SIZE - CommonConst.ONE_INT) {
            travelList = travelList.subList(0, SIZE - 1);
        }else{
        }
        map.put("travelList", travelList);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
            //旅游攻略推荐
            int userId = 0;
            Cookie[] cookies = request.getCookies();
            for(Cookie c : cookies){
                if(CommonConst.USERID.equals(c.getName())){
                     userId = Integer.parseInt(c.getValue());
                }
            }
            List<CloudBean> cloudBeans = cloudService.selectByUserIdAndStatus0(userId);
            List<TravelBean> cloudTravel = Lists.newArrayList();
            for(CloudBean c : cloudBeans){
                String place = c.getPlace();
                List<TravelBean> t = travelService.selectByPlace(place);
                cloudTravel.addAll(t);
            }
            cloudTravel = cloudTravel.subList(0, 8);
            map.put("cloudTravel", cloudTravel);
        }

        return "index";
    }

    @RequestMapping("/index")
    public String index_(HttpServletRequest request, Map<String, Object> map){
        return index(request, map);
    }
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, Map<String, Object> map){
        logger.debug("Login.C login in ^");

        return "login";
    }
    @RequestMapping(value = "/register")
    public String regist(HttpServletRequest request, Map<String, Object> map){
        map.put("regis", 1);
        return "login";
    }

    @RequestMapping(value = "/loginUser", method = RequestMethod.POST)
    public String loginUser(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        logger.debug("LoginC.loginUser  in email[{}], password[{}].", email, password);
        User exists = userService.selectUserByEmail(email);

        if(exists == null){
            map.put("errorcode", 2);
            return "error";
        }
        if(!MD5.decodeMD5(exists.getPassword()).equals(password)){
            map.put("errorcode", 3);
            return "error";
        }

        Cookie[] cookies = request.getCookies();
        for(Cookie c : cookies){
            if(CommonConst.LOGIN.equals(c.getName())){
                if(CommonConst.YES.equals(c.getValue()))
                    return index(request, map);
            }
        }
        Cookie cookie = new Cookie(CommonConst.LOGIN, CommonConst.YES);
        Cookie cookie1 = new Cookie(CommonConst.USERID, String.valueOf(exists.getId()));
        cookie.setMaxAge(-1);
        response.addCookie(cookie);
        response.addCookie(cookie1);
        map.put(CommonConst.LOGIN, CommonConst.YES);
        return index_(request, map);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, Map<String, Object> map){
        //Cookie[] cookies = request.getCookies();
        Cookie cookie = new Cookie(CommonConst.LOGIN, CommonConst.NO);
        response.addCookie(cookie);
        map.put(CommonConst.LOGIN, CommonConst.NO);
        return index_(request, map);
    }

    @RequestMapping(value = "/regis", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Map<String, Object> map){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User exists = userService.selectUserByEmail(email);
        if(exists != null){
            map.put("errorcode", 1);
            return "error";
        }

        User user = new User();
        user.setUsername(name);
        user.setEmail(email);
        user.setPassword(MD5.encodeMD5(password));
        int id = userService.saveUser(user);
        logger.debug("LoginC.register  in name[{}], email[{}], password[{}], id[{}]", name, email, password, id);

        map.put("login", 1);
        return "login";
    }

    @RequestMapping(value = "/forget")
    public String forgotPassword(){
        return "forgot";
    }

    @RequestMapping(value = "sendmail", method = RequestMethod.POST)
    public String sendEmail(HttpServletRequest request, Map<String, Object> map){
        String email = request.getParameter("email");
        User exists = userService.selectUserByEmail(email);
        if(exists == null){
            map.put("errorcode", 2);
            return "error";
        }
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

    @RequestMapping("/count")
    public String addCount(HttpServletRequest request, Map<String, Object> map){
        if(!Login.islogin(request)){
            //map.put(CommonConst.LOGIN, CommonConst.YES);
            return "login";
        }
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c: cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }
        String id = request.getParameter("id");
        if(id!=null) {
            TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
            travelBean.setCount(travelBean.getCount() + CommonConst.ONE_INT);
            travelService.updateByPrimaryKey(travelBean);
            LiketravelBean liketravelBean = new LiketravelBean();
            liketravelBean.setTravelid(travelBean.getId());
            liketravelBean.setUserid(Integer.parseInt(userId));
            LiketravelBean liketravelBean1 = liketravelService.selectByUserIdAndTravelId(travelBean.getId(), Integer.parseInt(userId));
            if(liketravelBean1 == null) {
                liketravelService.insertSelective(liketravelBean);
            }
        }
        return index(request, map);
    }

}
