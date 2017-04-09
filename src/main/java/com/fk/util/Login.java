package com.fk.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
