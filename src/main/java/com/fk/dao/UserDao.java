package com.fk.dao;

import com.fk.bean.UserBean;

public interface UserDao {
    int deleteByPrimaryKey(Integer uid);

    int insert(UserBean record);

    int insertSelective(UserBean record);

    UserBean selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(UserBean record);

    int updateByPrimaryKey(UserBean record);

    UserBean selectByEmail(String email);

    void updateByEmail(UserBean user);

    UserBean selectByName(String name);
}