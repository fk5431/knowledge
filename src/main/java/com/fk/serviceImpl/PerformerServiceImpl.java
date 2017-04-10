package com.fk.serviceImpl;

import com.fk.bean.PerformerBean;
import com.fk.dao.PerformerDao;
import com.fk.service.IPerformerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("performerService")
public class PerformerServiceImpl implements IPerformerService {

    @Autowired
    PerformerDao performerDao;

    @Override
    public PerformerBean selectByPrimaryKey(Integer id) {
        return performerDao.selectByPrimaryKey(id);
    }

    @Override
    public List<PerformerBean> selectAll() {
        return performerDao.selectAll();
    }

    @Override
    public int count() {
        return performerDao.count();
    }

    @Override
    public List<PerformerBean> selectByStart(Integer start) {
        return performerDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return performerDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(PerformerBean record) {
        return performerDao.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(PerformerBean record) {
        return performerDao.updateByPrimaryKey(record);
    }
}
