package com.fk.serviceImpl;

import com.fk.bean.AreaBean;
import com.fk.bean.IndexShowBean;
import com.fk.dao.AreaDao;
import com.fk.dao.IndexShowDao;
import com.fk.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("areaService")
public class AreaServiceImpl implements IAreaService {

    @Autowired
    AreaDao areaDao;

    @Override
    public AreaBean selectByPrimaryKey(Integer id) {
        return areaDao.selectByPrimaryKey(id);
    }
}
