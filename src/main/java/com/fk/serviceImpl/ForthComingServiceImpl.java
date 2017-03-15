package com.fk.serviceImpl;

import com.fk.bean.ForthcomingBean;
import com.fk.dao.ForthcomingDao;
import com.fk.service.IForthcomingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */

@Service("forthComingService")
public class ForthComingServiceImpl implements IForthcomingService {

    @Autowired
    ForthcomingDao forthcomingDao;

    @Override
    public List<ForthcomingBean> selectAll() {
        return forthcomingDao.selectAll();
    }
}
