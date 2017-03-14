package com.fk.dao;

import com.fk.bean.DirectorBean;

public interface DirectorDao {
    int deleteByPrimaryKey(Integer id);

    int insert(DirectorBean record);

    int insertSelective(DirectorBean record);

    DirectorBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DirectorBean record);

    int updateByPrimaryKey(DirectorBean record);
}