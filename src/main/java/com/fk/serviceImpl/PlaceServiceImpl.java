package com.fk.serviceImpl;

import com.fk.bean.PlaceBean;
import com.fk.bean.TypeBean;
import com.fk.dao.PlaceDao;
import com.fk.dao.TypeDao;
import com.fk.service.IPlaceService;
import com.fk.service.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
@Service("placeService")
public class PlaceServiceImpl implements IPlaceService {
    @Autowired
    PlaceDao placeDao;

    @Override
    public List<PlaceBean> selectAll() {
        return placeDao.selectAll();
    }

    @Override
    public PlaceBean selectByPrimaryKey(Integer id) {
        return placeDao.selectByPrimaryKey(id);
    }
}
