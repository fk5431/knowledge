package com.fk.serviceImpl;

import com.fk.bean.TypeBean;
import com.fk.dao.TypeDao;
import com.fk.service.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by FK on 2017/2/9.
 */
@Service("typeService")
public class TypeServiceImpl implements ITypeService {
    @Autowired
    TypeDao typeDao;

    @Override
    public TypeBean selectByPrimaryKey(Integer id) {
        return typeDao.selectByPrimaryKey(id);
    }
}
