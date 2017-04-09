package com.fk.serviceImpl;

import com.fk.bean.CloudBean;
import com.fk.dao.CloudDao;
import com.fk.service.ICloudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FK on 2017/4/9.
 */
@Service("cloudService")
public class CloudServiceImpl implements ICloudService {

    @Autowired
    CloudDao cloudDao;

    @Override
    public CloudBean selectByPlaceAndUserId(String place, String userId) {
        return cloudDao.selectByPlaceAndUserId(place, userId);
    }

    @Override
    public int insertSelective(CloudBean record) {
        return cloudDao.insertSelective(record);
    }

    @Override
    public int updateByPrimaryKey(CloudBean record) {
        return cloudDao.updateByPrimaryKey(record);
    }

    @Override
    public List<CloudBean> selectByUserIdAndStatus0(Integer id) {
        return cloudDao.selectByUserIdAndStatus0(id);
    }

    @Override
    public List<CloudBean> selectByUserIdAndStatus1(Integer id) {
        return cloudDao.selectByUserIdAndStatus1(id);
    }
}
