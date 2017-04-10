package com.fk.serviceImpl;

import com.fk.bean.DirectorBean;
import com.fk.dao.DirectorDao;
import com.fk.service.IDirectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("directorService")
public class DirectorServiceImpl implements IDirectorService {

    @Autowired
    DirectorDao directorDao;

    @Override
    public DirectorBean selectByPrimaryKey(Integer id) {
        return directorDao.selectByPrimaryKey(id);
    }

    @Override
    public List<DirectorBean> selectAll() {
        return directorDao.selectAll();
    }

    @Override
    public int count() {
        return directorDao.count();
    }

    @Override
    public List<DirectorBean> selectByStart(Integer start) {
        return directorDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return directorDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(DirectorBean record) {
        return directorDao.insertSelective(record);
    }
}