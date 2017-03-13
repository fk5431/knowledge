package com.fk.dao;

import com.fk.bean.IndexshowshopBean;

/**
 * Created by fengkai on 13/03/17.
 */
public interface IndexshowshopDao {
    int deleteByPrimaryKey(Integer id);

    int insert(IndexshowshopBean record);

    int insertSelective(IndexshowshopBean record);

    IndexshowshopBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IndexshowshopBean record);

    int updateByPrimaryKey(IndexshowshopBean record);
}
