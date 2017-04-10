package com.fk.serviceImpl;

import com.fk.bean.MovieBean;
import com.fk.dao.MovieDao;
import com.fk.dao.UserDao;
import com.fk.service.IMovieService;
import com.fk.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
@Service("movieService")
public class MovieServiceImpl implements IMovieService {
    @Autowired
    MovieDao movieDao;

    @Override
    public MovieBean selectByPrimaryKey(Integer id) {
        return movieDao.selectByPrimaryKey(id);
    }

    @Override
    public List<MovieBean> selectSortByBoxofficeOfTen() {
        return movieDao.selectSortByBoxofficeOfTen();
    }

    @Override
    public List<MovieBean> selectSortByLookCountOfTen() {
        return movieDao.selectSortByLookCountOfTen();
    }

    @Override
    public List<MovieBean> selectSortByScoreOfTen() {
        return movieDao.selectSortByScoreOfTen();
    }

    @Override
    public int updateByPrimaryKey(MovieBean record) {
        return movieDao.updateByPrimaryKey(record);
    }

    @Override
    public List<MovieBean> selectByType(String s) {
        return movieDao.selectByType(s);
    }

    @Override
    public List<MovieBean> selectByTypeAll() {
        return movieDao.selectByTypeAll();
    }

    @Override
    public List<MovieBean> selectSortByTimeOfTen() {
        return movieDao.selectSortByTimeOfTen();
    }

    @Override
    public int insertSelective(MovieBean record) {
        return movieDao.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return movieDao.deleteByPrimaryKey(id);
    }

    @Override
    public int count() {
        return movieDao.count();
    }

    @Override
    public List<MovieBean> selectByStart(Integer start) {
        return movieDao.selectByStart(start);
    }

    @Override
    public List<MovieBean> selectSortByNum() {
        return movieDao.selectSortByNum();
    }

    @Override
    public MovieBean selectByTitle(String kw) {
        return movieDao.selectByTitle(kw);
    }
}
