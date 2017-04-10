package com.fk.serviceImpl;

import com.fk.bean.CollectBean;
import com.fk.bean.HistoryBean;
import com.fk.dao.CollectDao;
import com.fk.dao.HistoryDao;
import com.fk.service.ICollectService;
import com.fk.service.IHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
@Service("collectService")
public class CollectServiceImpl implements ICollectService {

    @Autowired
    CollectDao collectDao;

    @Override
    public int insertSelective(CollectBean record) {
        return collectDao.insertSelective(record);
    }

    @Override
    public int deleteMyMovieId(int id) {
        return collectDao.deleteMyMovieId(id);
    }

    @Override
    public int count() {
        return collectDao.count();
    }

    @Override
    public List<CollectBean> selectByStart(int start) {
        return collectDao.selectByStart(start);
    }

    @Override
    public int countC() {
        return collectDao.countC();
    }

    @Override
    public List<CollectBean> selectByStartC(int start) {
        return collectDao.selectByStartC(start);
    }

    @Override
    public int countL() {
        return collectDao.countL();
    }

    @Override
    public List<CollectBean> selectByStartL(int start) {
        return collectDao.selectByStartL(start);
    }
}
