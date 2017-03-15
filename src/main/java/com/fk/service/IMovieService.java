package com.fk.service;

import com.fk.bean.MovieBean;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface IMovieService {
    MovieBean selectByPrimaryKey(Integer id);
    List<MovieBean> selectSortByBoxofficeOfTen();
    List<MovieBean> selectSortByLookCountOfTen();
    List<MovieBean> selectSortByScoreOfTen();
    int updateByPrimaryKey(MovieBean record);
}
