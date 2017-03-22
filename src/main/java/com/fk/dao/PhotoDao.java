package com.fk.dao;

import com.fk.bean.PhotoBean;

import java.util.List;

/**
 * Created by fengkai on 22/03/17.
 */
public interface PhotoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PhotoBean record);

    int insertSelective(PhotoBean record);

    PhotoBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PhotoBean record);

    int updateByPrimaryKey(PhotoBean record);

    List<PhotoBean> selectlastfour();

    int count();
    List<PhotoBean> selectByStrat(int start);
}
