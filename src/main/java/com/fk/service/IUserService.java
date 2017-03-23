package com.fk.service;

import com.fk.bean.User;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface IUserService {
    public User selectUserByID(int id);
    public int saveUser(User user);
    public User selectUserByEmail(String email);
    public int updateByEmail(User user);

    int count();

    List<User> selectByStart(Integer start);

    int deleteByPrimaryKey(Integer id);
    int updateByPrimaryKey(User record);
}
