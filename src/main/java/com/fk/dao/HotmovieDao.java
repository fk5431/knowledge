package com.fk.dao;

import com.fk.bean.HotmovieBean;

import java.util.List;

public interface HotmovieDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HotmovieBean record);

    int insertSelective(HotmovieBean record);

    HotmovieBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HotmovieBean record);

    int updateByPrimaryKey(HotmovieBean record);

    List<HotmovieBean> selectAll();
}