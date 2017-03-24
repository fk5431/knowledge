package com.fk.serviceImpl;

import com.fk.bean.NewsBean;
import com.fk.dao.NewsDao;
import com.fk.service.IIndexshowService;
import com.fk.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("newsService")
public class NewsServiceImpl implements INewsService {

    @Autowired
    NewsDao newsDao;

    @Override
    public NewsBean selectByPrimaryKey(Integer id) {
        return newsDao.selectByPrimaryKey(id);
    }


    @Override
    public List<NewsBean> selectByTimeForSix() {
        return newsDao.selectByTimeForSix();
    }

    @Override
    public List<NewsBean> selectByCount() {
        return newsDao.selectByCount();
    }

    @Override
    public int count() {
        return newsDao.count();
    }

    @Override
    public List<NewsBean> selectByStrat(int start) {
        return newsDao.selectByStrat(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return newsDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(NewsBean record) {
        return newsDao.insertSelective(record);
    }
}
