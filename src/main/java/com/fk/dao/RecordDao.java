package com.fk.dao;

import com.fk.bean.RecordBean;

import java.util.List;

public interface RecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(RecordBean record);

    int insertSelective(RecordBean record);

    RecordBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecordBean record);

    int updateByPrimaryKey(RecordBean record);

    List<RecordBean> selectByForginId(Integer id);
    int deleteByForginId(Integer id);

    List<RecordBean> selectAll();

    int count();

    List<RecordBean> selectByStart(int start);
}