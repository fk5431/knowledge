package com.fk.serviceImpl;

import com.fk.bean.RecordBean;
import com.fk.dao.RecordDao;
import com.fk.service.IRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("recordService")
public class RecordServiceImpl implements IRecordService {

    @Autowired
    RecordDao recordDao;

    @Override
    public RecordBean selectByPrimaryKey(Integer id) {
        return recordDao.selectByPrimaryKey(id);
    }

    @Override
    public List<RecordBean> selectByForginId(Integer id) {
        return recordDao.selectByForginId(id);
    }

    @Override
    public int deleteByForginId(Integer id) {
        return recordDao.deleteByForginId(id);
    }

    @Override
    public int insertSelective(RecordBean record) {
        return recordDao.insertSelective(record);
    }
}
