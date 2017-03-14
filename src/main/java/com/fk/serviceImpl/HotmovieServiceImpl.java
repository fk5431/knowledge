package com.fk.serviceImpl;

import com.fk.bean.HotmovieBean;
import com.fk.dao.HotmovieDao;
import com.fk.service.IHotmovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("hotmovieService")
public class HotmovieServiceImpl implements IHotmovieService {

    @Autowired
    HotmovieDao hotmovieDao;

    @Override
    public HotmovieBean selectByPrimaryKey(Integer id) {
        return hotmovieDao.selectByPrimaryKey(id);
    }
}
