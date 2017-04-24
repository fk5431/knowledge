package com.fk.dao;

import com.fk.bean.KtypeBean;

public interface KtypeDao {
    int deleteByPrimaryKey(Integer ktypeid);

    int insert(KtypeBean record);

    int insertSelective(KtypeBean record);

    KtypeBean selectByPrimaryKey(Integer ktypeid);

    int updateByPrimaryKeySelective(KtypeBean record);

    int updateByPrimaryKey(KtypeBean record);
}