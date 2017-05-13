package com.fk.dao;

import com.fk.bean.UserBean;

import javax.xml.registry.infomodel.User;
import java.util.List;

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

    List<UserBean> selectALL_1();

    List<UserBean> selectALL_2();

    int count();

    List<UserBean> selectByStart(int start);

    List<UserBean> selectByStartAnd1(int start);
}