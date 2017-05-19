package com.fk.dao;

import com.fk.bean.BrowseBean;

import java.util.List;

public interface BrowseDao {
    int deleteByPrimaryKey(Integer id);

    int insert(BrowseBean record);

    int insertSelective(BrowseBean record);

    BrowseBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BrowseBean record);

    int updateByPrimaryKey(BrowseBean record);

    int countByUserId(int userId);

    List<BrowseBean> selectByStartOfUserId(int userId, int start);

    BrowseBean selectByUserIdAndFid(int userId, int id);
}