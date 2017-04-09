package com.fk.serviceImpl;

import com.fk.bean.SiteBean;
import com.fk.dao.SiteDao;
import com.fk.service.ISiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FK on 2017/4/9.
 */
@Service("siteService")
public class SiteServiceImpl implements ISiteService {

    @Autowired
    SiteDao siteDao;

    @Override
    public List<SiteBean> selectAll() {
        return siteDao.selectAll();
    }

    @Override
    public int count() {
        return siteDao.count();
    }

    @Override
    public List<SiteBean> selectByStart(int start) {
        return siteDao.selectByStart(start);
    }

    @Override
    public int insert(SiteBean record) {
        return siteDao.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(SiteBean record) {
        return siteDao.updateByPrimaryKey(record);
    }

    @Override
    public SiteBean selectByPrimaryKey(Integer id) {
        return siteDao.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return siteDao.deleteByPrimaryKey(id);
    }
}
