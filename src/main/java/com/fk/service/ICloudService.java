package com.fk.service;

import com.fk.bean.CloudBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface ICloudService {
    int insertSelective(CloudBean record);
    int updateByPrimaryKey(CloudBean record);

    CloudBean selectByUserIdAndActorId(int i, Integer id);

    List<CloudBean> selectByCountTwo(int id);
}
