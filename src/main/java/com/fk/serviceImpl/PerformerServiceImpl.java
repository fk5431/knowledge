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
}
