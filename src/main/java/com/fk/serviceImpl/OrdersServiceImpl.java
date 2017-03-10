package com.fk.serviceImpl;

import com.fk.bean.OrdersBean;
import com.fk.dao.OrdersDao;
import com.fk.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("ordersService")
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    OrdersDao ordersDao;

    @Override
    public OrdersBean selectByPrimaryKey(Integer id) {
        return ordersDao.selectByPrimaryKey(id);
    }
}
