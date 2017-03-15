package com.fk.dao;

import com.fk.bean.IsthefileBean;

import java.util.List;

public interface IsthefileDao {
    int deleteByPrimaryKey(Integer id);

    int insert(IsthefileBean record);

    int insertSelective(IsthefileBean record);

    IsthefileBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IsthefileBean record);

    int updateByPrimaryKey(IsthefileBean record);

    List<IsthefileBean> selectAll();
}