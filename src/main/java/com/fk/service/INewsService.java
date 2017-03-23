package com.fk.service;

import com.fk.bean.NewsBean;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
public interface INewsService {
    NewsBean selectByPrimaryKey(Integer id);

    List<NewsBean> selectByTimeForSix();

    List<NewsBean> selectByCount();

    int count();

    List<NewsBean> selectByStrat(int start);

    int deleteByPrimaryKey(Integer id);
}
