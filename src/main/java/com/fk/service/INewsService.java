package com.fk.service;

import com.fk.bean.NewsBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface INewsService {
    NewsBean selectByPrimaryKey(Integer id);
}
