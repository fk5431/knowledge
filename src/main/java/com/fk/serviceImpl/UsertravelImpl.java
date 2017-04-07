package com.fk.serviceImpl;

import com.fk.bean.UsertravelBean;
import com.fk.dao.UsertravelDao;
import com.fk.service.IUsertravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 07/04/17.
 */
@Service("usertravelService")
public class UsertravelImpl implements IUsertravelService {

    @Autowired
    UsertravelDao usertravelDao;

    @Override
    public int insertSelective(UsertravelBean record) {
        return usertravelDao.insertSelective(record);
    }

    @Override
    public UsertravelBean selectByTravelId(Integer id) {
        return usertravelDao.selectByTravelId(id);
    }

    @Override
    public int updateByPrimaryKey(UsertravelBean record) {
        return usertravelDao.updateByPrimaryKey(record);
    }

    @Override
    public List<UsertravelBean> selectByUserId(Integer id) {
        return usertravelDao.selectByUserId(id);
    }

    @Override
    public int deleteByTravelKey(int id) {
        return usertravelDao.deleteByTravelKey(id);
    }

    @Override
    public int deleteByTravelKeyAnd0(int id) {
        return usertravelDao.deleteByTravelKeyAnd0(id);
    }
}
