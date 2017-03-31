package com.fk.dao;

import com.fk.bean.TypeBean;

import java.util.List;

public interface TypeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TypeBean record);

    int insertSelective(TypeBean record);

    TypeBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeBean record);

    int updateByPrimaryKey(TypeBean record);

    List<TypeBean> selectAll();

    TypeBean selectByTypeName(String type);
}
