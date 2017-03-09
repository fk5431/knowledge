package com.fk.serviceImpl;

import com.fk.bean.ContinentBean;
import com.fk.bean.TypeBean;
import com.fk.dao.ContinentDao;
import com.fk.dao.TypeDao;
import com.fk.service.IContinentService;
import com.fk.service.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("typeService")
public class TypeServiceImpl implements ITypeService {

    @Autowired
    TypeDao typeDao;

    @Override
    public List<TypeBean> selectAll() {
        return typeDao.selectAll();
    }
}
