package com.fk.dao;

import com.fk.bean.HistoryBean;
import com.fk.bean.MovieBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface HistoryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HistoryBean record);

    int insertSelective(HistoryBean record);

    HistoryBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HistoryBean record);

    int updateByPrimaryKeyWithBLOBs(HistoryBean record);

    int updateByPrimaryKey(HistoryBean record);

    int deleteMyMovieId(int id);

    int count();

    List<HistoryBean> selectByStart(int id,int start);

    HistoryBean selectByMovieId(int userId, Integer id);
}
