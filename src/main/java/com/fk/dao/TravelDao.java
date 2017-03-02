package com.fk.dao;

import com.fk.bean.TravelBean;

public interface TravelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TravelBean record);

    int insertSelective(TravelBean record);

    TravelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TravelBean record);

    int updateByPrimaryKey(TravelBean record);

    int count();
}