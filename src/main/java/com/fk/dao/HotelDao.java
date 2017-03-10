package com.fk.dao;

import com.fk.bean.HotelBean;

public interface HotelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HotelBean record);

    int insertSelective(HotelBean record);

    HotelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HotelBean record);

    int updateByPrimaryKey(HotelBean record);
}