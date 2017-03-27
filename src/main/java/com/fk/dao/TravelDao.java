package com.fk.dao;

import com.fk.bean.TravelBean;
import com.fk.bean.User;

import java.util.List;

public interface TravelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TravelBean record);

    int insertSelective(TravelBean record);

    TravelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TravelBean record);

    int updateByPrimaryKey(TravelBean record);


    int count();
    int countOverFive();


    List<TravelBean> selectByCountOverFive();

    List<TravelBean> selectByPlace(String place);
    List<TravelBean> selectByStart(Integer start);
}