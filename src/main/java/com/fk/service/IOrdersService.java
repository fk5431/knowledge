package com.fk.service;

import com.fk.bean.OrdersBean;
import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IOrdersService {
    OrdersBean selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(OrdersBean ordersBean);
    int count();
    List<OrdersBean> selectByStart(Integer start);
    int deleteByPrimaryKey(Integer id);
    int insertSelective(OrdersBean record);
}
