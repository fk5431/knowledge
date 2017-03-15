package com.fk.serviceImpl;

import com.fk.bean.DirectorBean;
import com.fk.dao.DirectorDao;
import com.fk.service.IDirectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
