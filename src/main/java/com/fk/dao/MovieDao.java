package com.fk.dao;


import com.fk.bean.MovieBean;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface MovieDao {

        int deleteByPrimaryKey(Integer id);

        int insert(MovieBean record);

        int insertSelective(MovieBean record);

        MovieBean selectByPrimaryKey(Integer id);

        int updateByPrimaryKeySelective(MovieBean record);

        int updateByPrimaryKey(MovieBean record);

        List<MovieBean> selectSortByBoxofficeOfTen();

        List<MovieBean> selectSortByLookCountOfTen();

        List<MovieBean> selectSortByScoreOfTen();
}