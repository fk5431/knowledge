package com.fk.dao;

import com.fk.bean.CdirectoryBean;

public interface CdirectoryDao {
    int deleteByPrimaryKey(Integer did);

    int insert(CdirectoryBean record);

    int insertSelective(CdirectoryBean record);

    CdirectoryBean selectByPrimaryKey(Integer did);

    int updateByPrimaryKeySelective(CdirectoryBean record);

    int updateByPrimaryKey(CdirectoryBean record);
}