package com.fk.dao;

import com.fk.bean.RoleBean;

public interface RoleDao {
    int deleteByPrimaryKey(Integer roleid);

    int insert(RoleBean record);

    int insertSelective(RoleBean record);

    RoleBean selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(RoleBean record);

    int updateByPrimaryKey(RoleBean record);
}