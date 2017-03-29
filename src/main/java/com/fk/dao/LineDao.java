package com.fk.dao;

import com.fk.bean.LineBean;
import com.fk.bean.User;

import java.util.List;

public interface LineDao {
    int deleteByPrimaryKey(Integer id);

    int insert(LineBean record);

    int insertSelective(LineBean record);

    LineBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LineBean record);

    int updateByPrimaryKey(LineBean record);

    List<LineBean> selectByForginId(Integer id);

    int deleteByForginId(Integer id);
    int count();

    List<LineBean> selectByStart(Integer start);
}