package com.fk.dao;

import com.fk.bean.OrdersBean;
import com.fk.bean.User;

import java.util.List;

public interface OrdersDao {
    int deleteByPrimaryKey(Integer id);

    int insert(OrdersBean record);

    int insertSelective(OrdersBean record);

    OrdersBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrdersBean record);

    int updateByPrimaryKeyWithBLOBs(OrdersBean record);

    int updateByPrimaryKey(OrdersBean record);

    int count();
    List<OrdersBean> selectByStart(Integer start);
}