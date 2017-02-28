package com.fk.dao;

import com.fk.bean.AreaBean;

public interface AreaDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AreaBean record);

    int insertSelective(AreaBean record);

    AreaBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AreaBean record);

    int updateByPrimaryKey(AreaBean record);
}