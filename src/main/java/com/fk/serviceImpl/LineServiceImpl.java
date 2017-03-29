package com.fk.serviceImpl;

import com.fk.bean.LineBean;
import com.fk.dao.LineDao;
import com.fk.service.ILineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("lineService")
public class LineServiceImpl implements ILineService {

    @Autowired
    LineDao linelDao;

    @Override
    public LineBean selectByPrimaryKey(Integer id) {
        return linelDao.selectByPrimaryKey(id);
    }

    @Override
    public List<LineBean> selectByForginId(Integer id) {
        return linelDao.selectByForginId(id);
    }

    @Override
    public int deleteByForginId(Integer id) {
        return linelDao.deleteByForginId(id);
    }

    @Override
    public int insertSelective(LineBean record) {
        return linelDao.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(LineBean record) {
        return linelDao.updateByPrimaryKey(record);
    }
}
