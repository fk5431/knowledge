package com.fk.serviceImpl;

import com.fk.bean.ContinentBean;
import com.fk.bean.ProvinceBean;
import com.fk.dao.ContinentDao;
import com.fk.dao.ProvinceDao;
import com.fk.service.IContinentService;
import com.fk.service.IProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("continentService")
public class ContinentServiceImpl implements IContinentService {

    @Autowired
    ContinentDao continentDao;

    @Override
    public List<ContinentBean> selectAll() {
        return continentDao.selectAll();
    }

    @Override
    public ContinentBean selectByName(String continent) {
        return continentDao.selectByName(continent);
    }

    @Override
    public int updateByPrimaryKey(ContinentBean record) {
        return continentDao.updateByPrimaryKey(record);
    }

    @Override
    public ContinentBean selectByPrimaryKey(Integer id) {
        return continentDao.selectByPrimaryKey(id);
    }
}
