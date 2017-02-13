package com.fk.serviceImpl;

import com.fk.bean.User;
import com.fk.dao.UserDao;
import com.fk.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by FK on 2017/2/9.
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    UserDao userDao;

    @Override
    public User selectUserByID(int id) {
        return userDao.selectByPrimaryKey(id);
    }

    @Override
    public int saveUser(User user) {
        return userDao.insert(user);
    }

    @Override
    public User selectUserByEmail(String email) {
        return userDao.selectByEmail(email);
    }
}
