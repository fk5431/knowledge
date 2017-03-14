package com.fk.dao;

import com.fk.bean.NewsBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface NewsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(NewsBean record);

    int insertSelective(NewsBean record);

    NewsBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(NewsBean record);

    int updateByPrimaryKeyWithBLOBs(NewsBean record);

    int updateByPrimaryKey(NewsBean record);
}