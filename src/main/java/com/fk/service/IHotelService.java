package com.fk.service;

import com.fk.bean.HotelBean;
import com.fk.bean.RecordBean;
import com.fk.bean.User;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IHotelService {
    HotelBean selectByPrimaryKey(Integer id);
    List<HotelBean> selectAll();
    int count();

    List<HotelBean> selectByStart(Integer start);
    int deleteByPrimaryKey(Integer id);
    int insertSelective(HotelBean record);
}
