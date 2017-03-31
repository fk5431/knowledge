package com.fk.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by fengkai on 31/03/17.
 */
public class Login {
    public static boolean islogin(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
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
