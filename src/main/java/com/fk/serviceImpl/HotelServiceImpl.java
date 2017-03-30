package com.fk.serviceImpl;

import com.fk.bean.AreaBean;
import com.fk.bean.HotelBean;
import com.fk.bean.User;
import com.fk.dao.AreaDao;
import com.fk.dao.HotelDao;
import com.fk.service.IAreaService;
import com.fk.service.IHotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("hotelService")
public class HotelServiceImpl implements IHotelService {

    @Autowired
    HotelDao hotelDao;

    @Override
    public HotelBean selectByPrimaryKey(Integer id) {
        return hotelDao.selectByPrimaryKey(id);
    }

    @Override
    public List<HotelBean> selectAll() {
        return hotelDao.selectAll();
    }

    @Override
    public int count() {
        return hotelDao.count();
    }

    @Override
    public List<HotelBean> selectByStart(Integer start) {
        return hotelDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return hotelDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(HotelBean record) {
        return hotelDao.insertSelective(record);
    }
}
