package com.fk.service;

import com.fk.bean.User;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface IUserService {
    User selectUserByID(int id);
    int saveUser(User user);
    User selectUserByEmail(String email);
    int updateByEmail(User user);
    int count();

    List<User> selectByStart(Integer start);
}
