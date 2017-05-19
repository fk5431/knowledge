package com.fk.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by fengkai on 22/03/17.
 */
public class Login {

    public static boolean islogin(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if(cookies == null || cookies.length == 0)
            return false;
        for(Cookie c : cookies){
            if(CommonConst.LOGIN.equals(c.getName())){
                if(CommonConst.YES.equals(c.getValue())){
                    return true;
                }
            }
        }
        return false;
    }

    public static int getUserId(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        int userId = 0;
        for(Cookie c : cookies){
            if(CommonConst.USERID.equals(c.getName())){
                userId = Integer.parseInt(c.getValue());
            }
        }
        return userId;
    }
}
