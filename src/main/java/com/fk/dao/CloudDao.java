package com.fk.dao;

import com.fk.bean.CloudBean;

import java.util.List;

public interface CloudDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CloudBean record);

    int insertSelective(CloudBean record);

    CloudBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CloudBean record);

    int updateByPrimaryKey(CloudBean record);

    CloudBean selectByPlaceAndUserId(String place, String userId);

    List<CloudBean> selectByUserIdAndStatus0(Integer id);
    List<CloudBean> selectByUserIdAndStatus1(Integer id);
}