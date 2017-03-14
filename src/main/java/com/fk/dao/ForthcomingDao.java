package com.fk.dao;

import com.fk.bean.ForthcomingBean;

public interface ForthcomingDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ForthcomingBean record);

    int insertSelective(ForthcomingBean record);

    ForthcomingBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForthcomingBean record);

    int updateByPrimaryKey(ForthcomingBean record);
}