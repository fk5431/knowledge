package com.fk.dao;

import com.fk.bean.FtypeBean;

import java.util.List;

public interface FtypeDao {
    int deleteByPrimaryKey(Integer ftypeid);

    int insert(FtypeBean record);

    int insertSelective(FtypeBean record);

    FtypeBean selectByPrimaryKey(Integer ftypeid);

    int updateByPrimaryKeySelective(FtypeBean record);

    int updateByPrimaryKey(FtypeBean record);

    FtypeBean selectByName(String ftypename);

    List<FtypeBean> selectAll();
}