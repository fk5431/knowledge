package com.fk.service;

import com.fk.bean.HotelBean;
import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IHotelService {
    HotelBean selectByPrimaryKey(Integer id);
    List<HotelBean> selectAll();
}
