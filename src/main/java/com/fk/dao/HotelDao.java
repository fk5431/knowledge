package com.fk.dao;

import com.fk.bean.HotelBean;
import com.fk.bean.User;

import java.util.List;

public interface HotelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HotelBean record);

    int insertSelective(HotelBean record);

    HotelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HotelBean record);

    int updateByPrimaryKey(HotelBean record);
    List<HotelBean> selectAll();
    int count();

    List<HotelBean> selectByStart(Integer start);
}