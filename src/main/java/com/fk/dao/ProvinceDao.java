package com.fk.dao;

import com.fk.bean.ProvinceBean;

public interface ProvinceDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ProvinceBean record);

    int insertSelective(ProvinceBean record);

    ProvinceBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProvinceBean record);

    int updateByPrimaryKey(ProvinceBean record);
}