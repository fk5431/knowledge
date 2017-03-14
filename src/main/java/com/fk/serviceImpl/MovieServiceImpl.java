package com.fk.serviceImpl;

import com.fk.dao.MovieDao;
import com.fk.dao.UserDao;
import com.fk.service.IMovieService;
import com.fk.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by FK on 2017/2/9.
 */
@Service("movieService")
public class MovieServiceImpl implements IMovieService {
    @Autowired
    MovieDao movieDao;

}
