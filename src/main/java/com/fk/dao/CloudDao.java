package com.fk.dao;

import com.fk.bean.CloudBean;

/**
 * Created by fengkai on 10/04/17.
 */
public interface CloudDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CloudBean record);

    int insertSelective(CloudBean record);

    CloudBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CloudBean record);

    int updateByPrimaryKey(CloudBean record);
}
