package com.fk.dao;

import com.fk.bean.PerformerBean;

public interface PerformerDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PerformerBean record);

    int insertSelective(PerformerBean record);

    PerformerBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PerformerBean record);

    int updateByPrimaryKey(PerformerBean record);
}