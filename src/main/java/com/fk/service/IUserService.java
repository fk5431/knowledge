package com.fk.service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by FK on 2017/2/9.
 */
public interface IUserService {

    String index(Map<String, Object> map);

    String login(HttpServletRequest request, Map<String, Object> map, String email, String password);

    String regis(HttpServletRequest request, Map<String, Object> map, String username, String email, String password);

    String sendEmail(HttpServletRequest request, Map<String, Object> map, String email);

    String forgetPassword(HttpServletRequest request, Map<String, Object> map, String[] str);
}
