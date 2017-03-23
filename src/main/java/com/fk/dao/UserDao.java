package com.fk.dao;


import com.fk.bean.User;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface UserDao {

        int deleteByPrimaryKey(Integer id);

        int insert(User record);

        int insertSelective(User record);

        User selectByPrimaryKey(Integer id);

        int updateByPrimaryKeySelective(User record);

        int updateByPrimaryKey(User record);

        User selectByEmail(String email);

        int updateByEmail(User user);

        int count();

        List<User> selectByStart(Integer start);
}