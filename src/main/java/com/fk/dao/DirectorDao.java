package com.fk.dao;

import com.fk.bean.DirectorBean;

import java.util.List;

public interface DirectorDao {
    int deleteByPrimaryKey(Integer id);

    int insert(DirectorBean record);

    int insertSelective(DirectorBean record);

    DirectorBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DirectorBean record);

    int updateByPrimaryKey(DirectorBean record);

    List<DirectorBean> selectAll();

    List<DirectorBean> selectByStart(Integer start);

    int count();

}