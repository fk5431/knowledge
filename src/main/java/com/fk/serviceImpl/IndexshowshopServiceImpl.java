package com.fk.serviceImpl;

import com.fk.bean.IndexShowBean;
import com.fk.bean.IndexshowshopBean;
import com.fk.dao.IndexShowDao;
import com.fk.dao.IndexshowshopDao;
import com.fk.service.IIndexShowService;
import com.fk.service.IIndexshowshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("indexshowshopService")
public class IndexshowshopServiceImpl implements IIndexshowshopService {

    @Autowired
    IndexshowshopDao indexshowshopDao;

    @Override
    public IndexshowshopBean selectByPrimaryKey(Integer id) {
        return indexshowshopDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(IndexshowshopBean record) {
        return indexshowshopDao.updateByPrimaryKey(record);
    }
}
