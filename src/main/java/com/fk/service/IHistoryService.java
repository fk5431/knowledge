package com.fk.service;

import com.fk.bean.HistoryBean;
import com.fk.bean.MovieBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface IHistoryService {

    int insertSelective(HistoryBean record);

    int deleteMyMovieId(int i);

    int count();

    List<HistoryBean> selectByStart(int start);

    HistoryBean selectByMovieId(Integer id);
}
