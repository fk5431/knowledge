package com.fk.dao;

import com.fk.bean.IndexShowBean;

public interface IndexShowDao {
    int deleteByPrimaryKey(Integer id);

    int insert(IndexShowBean record);

    int insertSelective(IndexShowBean record);

    IndexShowBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IndexShowBean record);

    int updateByPrimaryKey(IndexShowBean record);
}