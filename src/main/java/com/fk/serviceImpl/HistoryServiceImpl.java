package com.fk.serviceImpl;

import com.fk.bean.HistoryBean;
import com.fk.bean.MovieBean;
import com.fk.dao.HistoryDao;
import com.fk.service.IHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
@Service("historyService")
public class HistoryServiceImpl implements IHistoryService {

    @Autowired
    HistoryDao historyDao;

    @Override
    public int insertSelective(HistoryBean record) {
        return historyDao.insertSelective(record);
    }

    @Override
    public int deleteMyMovieId(int id) {
        return historyDao.deleteMyMovieId(id);
    }

    @Override
    public int count() {
        return historyDao.count();
    }

    @Override
    public List<HistoryBean> selectByStart(int start) {
        return historyDao.selectByStart(start);
    }

    @Override
    public HistoryBean selectByMovieId(Integer id) {
        return historyDao.selectByMovieId(id);
    }
}
