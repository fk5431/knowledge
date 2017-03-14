package com.fk.serviceImpl;

import com.fk.bean.NewsBean;
import com.fk.dao.NewsDao;
import com.fk.service.IIndexshowService;
import com.fk.service.INewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
