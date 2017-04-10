package com.fk.serviceImpl;

import com.fk.bean.CloudBean;
import com.fk.dao.CloudDao;
import com.fk.service.ICloudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
@Service("cloudService")
public class CloudServiceImpl implements ICloudService{

    @Autowired
    CloudDao cloudDao;

    @Override
    public int insertSelective(CloudBean record) {
        return cloudDao.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(CloudBean record) {
        return cloudDao.updateByPrimaryKey(record);
    }

    @Override
    public CloudBean selectByUserIdAndActorId(int userId, Integer id) {
        return cloudDao.selectByUserIdAndActorId(userId, id);
    }

    @Override
    public List<CloudBean> selectByCountTwo(int id) {
        return cloudDao.selectByCountTwo(id);
    }
}
