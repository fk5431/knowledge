package com.fk.service;

import com.fk.bean.OrdersBean;
import com.fk.bean.RecordBean;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IOrdersService {
    OrdersBean selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(OrdersBean ordersBean);
}
