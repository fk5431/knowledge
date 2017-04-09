package com.fk.service;

import com.fk.bean.SiteBean;

import java.util.List;

/**
 * Created by FK on 2017/4/9.
 */
public interface ISiteService {
    List<SiteBean> selectAll();

    int count();

    List<SiteBean> selectByStart(int start);
    int insert(SiteBean record);
    int updateByPrimaryKey(SiteBean record);
    SiteBean selectByPrimaryKey(Integer id);
    int deleteByPrimaryKey(Integer id);
}
