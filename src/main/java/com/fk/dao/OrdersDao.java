package com.fk.dao;

import com.fk.bean.OrdersBean;

public interface OrdersDao {
    int deleteByPrimaryKey(Integer id);

    int insert(OrdersBean record);

    int insertSelective(OrdersBean record);

    OrdersBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrdersBean record);

    int updateByPrimaryKeyWithBLOBs(OrdersBean record);

    int updateByPrimaryKey(OrdersBean record);
}