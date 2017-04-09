package com.fk.service;

import com.fk.bean.CloudBean;

import java.util.List;

/**
 * Created by FK on 2017/4/9.
 */
public interface ICloudService {
    CloudBean selectByPlaceAndUserId(String place, String userId);
    int insertSelective(CloudBean record);
    int updateByPrimaryKey(CloudBean record);

    List<CloudBean> selectByUserIdAndStatus0(Integer id);
    List<CloudBean> selectByUserIdAndStatus1(Integer id);
}
