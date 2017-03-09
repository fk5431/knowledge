package com.fk.dao;

import com.fk.bean.ProvinceBean;

import java.util.List;

public interface ProvinceDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ProvinceBean record);

    int insertSelective(ProvinceBean record);

    ProvinceBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProvinceBean record);

    int updateByPrimaryKey(ProvinceBean record);

    List<ProvinceBean> selectAll();

}