package com.fk.dao;

import com.fk.bean.CdirectoryBean;

import java.util.List;

public interface CdirectoryDao {
    int deleteByPrimaryKey(Integer did);

    int insert(CdirectoryBean record);

    int insertSelective(CdirectoryBean record);

    CdirectoryBean selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(CdirectoryBean record);

    int updateByPrimaryKey(CdirectoryBean record);

    int count();

    List<CdirectoryBean> selectByLastTen(int start);
}