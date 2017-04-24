package com.fk.dao;

import com.fk.bean.UserRolesBean;

public interface UserRolesDao {
    int deleteByPrimaryKey(Integer roleid);

    int insert(UserRolesBean record);

    int insertSelective(UserRolesBean record);

    UserRolesBean selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(UserRolesBean record);

    int updateByPrimaryKey(UserRolesBean record);
}