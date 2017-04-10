package com.fk.dao;

import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface RecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(RecordBean record);

    int insertSelective(RecordBean record);

    RecordBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RecordBean record);

    int updateByPrimaryKey(RecordBean record);

    int deleteByMovieId(int id);

    int count();

    List<RecordBean> selectByStart(int id, int start);

    List<RecordBean> selectByStartAll(int start);

    int countByUserId(int id);
}
