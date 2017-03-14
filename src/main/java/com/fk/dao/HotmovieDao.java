package com.fk.dao;

import com.fk.bean.HotmovieBean;

public interface HotmovieDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HotmovieBean record);

    int insertSelective(HotmovieBean record);

    HotmovieBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HotmovieBean record);

    int updateByPrimaryKey(HotmovieBean record);
}