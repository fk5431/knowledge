package com.fk.dao;

import com.fk.bean.RuleBean;

public interface RuleDao {
    int deleteByPrimaryKey(Integer ruleid);

    int insert(RuleBean record);

    int insertSelective(RuleBean record);

    RuleBean selectByPrimaryKey(Integer ruleid);

    int updateByPrimaryKeySelective(RuleBean record);

    int updateByPrimaryKey(RuleBean record);
}