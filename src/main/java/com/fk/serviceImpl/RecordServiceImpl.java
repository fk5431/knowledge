package com.fk.serviceImpl;

import com.fk.bean.RecordBean;
import com.fk.dao.RecordDao;
import com.fk.service.IRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
@Service("recordService")
public class RecordServiceImpl implements IRecordService{

    @Autowired
    RecordDao recordDao;

    @Override
    public int insertSelective(RecordBean record) {
        return recordDao.insertSelective(record);
    }

    @Override
    public int deleteByMovieId(int id) {

        return recordDao.deleteByMovieId(id);
    }

    @Override
    public int count() {
        return recordDao.count();
    }

    @Override
    public List<RecordBean> selectByStart(int start) {
        return recordDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return recordDao.deleteByPrimaryKey(id);
    }
}
