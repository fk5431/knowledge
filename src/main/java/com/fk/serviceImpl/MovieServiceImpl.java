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
}
