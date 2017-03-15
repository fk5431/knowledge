package com.fk.dao;

import com.fk.bean.ForthcomingBean;

import java.util.List;

public interface ForthcomingDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ForthcomingBean record);

    int insertSelective(ForthcomingBean record);

    ForthcomingBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForthcomingBean record);

    int updateByPrimaryKey(ForthcomingBean record);

    List<ForthcomingBean> selectAll();
}