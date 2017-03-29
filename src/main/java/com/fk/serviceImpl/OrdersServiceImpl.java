package com.fk.serviceImpl;

import com.fk.bean.OrdersBean;
import com.fk.dao.OrdersDao;
import com.fk.service.IOrdersService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public int updateByPrimaryKey(OrdersBean ordersBean) {
        return ordersDao.updateByPrimaryKey(ordersBean);
    }

    @Override
    public int count() {
        return ordersDao.count();
    }

    @Override
    public List<OrdersBean> selectByStart(Integer start) {
        return ordersDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return ordersDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(OrdersBean record) {
        return ordersDao.insertSelective(record);
    }
}
