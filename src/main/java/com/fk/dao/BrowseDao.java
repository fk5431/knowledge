package com.fk.dao;

import com.fk.bean.BrowseBean;

public interface BrowseDao {
    int deleteByPrimaryKey(Integer id);

    int insert(BrowseBean record);

    int insertSelective(BrowseBean record);

    BrowseBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BrowseBean record);

    int updateByPrimaryKey(BrowseBean record);
}