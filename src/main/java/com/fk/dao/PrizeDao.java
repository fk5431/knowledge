package com.fk.dao;

import com.fk.bean.PrizeBean;

public interface PrizeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PrizeBean record);

    int insertSelective(PrizeBean record);

    PrizeBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PrizeBean record);

    int updateByPrimaryKey(PrizeBean record);
}