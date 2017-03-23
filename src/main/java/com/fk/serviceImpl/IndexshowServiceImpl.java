package com.fk.serviceImpl;

import com.fk.bean.IndexshowBean;
import com.fk.dao.IndexshowDao;
import com.fk.service.IIndexshowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 14/03/17.
 */
@Service("indexshowService")
public class IndexshowServiceImpl implements IIndexshowService {

    @Autowired
    IndexshowDao indexshowDao;

    @Override
    public IndexshowBean selectByPrimaryKey(Integer id) {
        return indexshowDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(IndexshowBean record) {
        return indexshowDao.updateByPrimaryKey(record);
    }
}
