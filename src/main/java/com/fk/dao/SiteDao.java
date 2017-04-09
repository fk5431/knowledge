package com.fk.dao;

import com.fk.bean.SiteBean;

import java.util.List;

public interface SiteDao {
    int deleteByPrimaryKey(Integer id);

    int insert(SiteBean record);


    int insertSelective(SiteBean record);

    SiteBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SiteBean record);

    int updateByPrimaryKey(SiteBean record);

    List<SiteBean> selectAll();

    int count();

    List<SiteBean> selectByStart(int start);
}