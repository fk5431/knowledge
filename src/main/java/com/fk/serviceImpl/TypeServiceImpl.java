package com.fk.serviceImpl;

import com.fk.bean.TypeBean;
import com.fk.dao.TypeDao;
import com.fk.service.ITypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<TypeBean> selectAll() {
        return typeDao.selectAll();
    }

    @Override
    public List<TypeBean> selectByStart(Integer start) {
        return typeDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return typeDao.deleteByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(TypeBean record) {
        return typeDao.updateByPrimaryKeySelective(record);
    }
}
