package com.fk.serviceImpl;

import com.fk.bean.IsthefileBean;
import com.fk.dao.IsthefileDao;
import com.fk.service.IIsthefileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("isthefileService")
public class IsthefileServiceImpl implements IIsthefileService {

    @Autowired
    IsthefileDao isthefileDao;

    @Override
    public List<IsthefileBean> selectAll() {
        return isthefileDao.selectAll();
    }
}
