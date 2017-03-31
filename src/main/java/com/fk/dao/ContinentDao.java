package com.fk.dao;

import com.fk.bean.ContinentBean;

import java.util.List;

public interface ContinentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ContinentBean record);

    int insertSelective(ContinentBean record);

    ContinentBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ContinentBean record);

    int updateByPrimaryKey(ContinentBean record);

    List<ContinentBean> selectAll();

    ContinentBean selectByName(String continent);
}