package com.fk.serviceImpl;

import com.fk.bean.TravelBean;
import com.fk.bean.User;
import com.fk.dao.TravelDao;
import com.fk.service.ITravelService;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("travelService")
public class TravelServiceImpl implements ITravelService {

    @Autowired
    TravelDao travelDao;

    @Override
    public TravelBean selectByPrimaryKey(Integer id) {
        return travelDao.selectByPrimaryKey(id);
    }

    @Override
    public int count() {
        return travelDao.count();
    }



    @Override
    public int updateByPrimaryKey(TravelBean record) {
        return travelDao.updateByPrimaryKey(record);
    }

    @Override
    public int countOverFive() {
        return travelDao.countOverFive();
    }

    @Override
    public List<TravelBean> selectByCountOverFive() {
        return travelDao.selectByCountOverFive();
    }

    @Override
    public List<TravelBean> selectByPlace(String place) {
        return travelDao.selectByPlace(place);
    }

    @Override
    public List<TravelBean> selectByStart(Integer start) {
        return travelDao.selectByStart(start);
    }

    @Override
    public List<TravelBean> selectByStart_6(Integer start) {
        return travelDao.selectByStart_6(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return travelDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(TravelBean record) {
        return travelDao.insertSelective(record);
    }

    @Override
    public List<TravelBean> selectByType(String type) {
        return travelDao.selectByType(type);
    }

}
