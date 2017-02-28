package com.fk.serviceImpl;

import com.fk.bean.TravelBean;
import com.fk.dao.TravelDao;
import com.fk.service.ITravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
