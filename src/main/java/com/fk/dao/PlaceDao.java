package com.fk.dao;

import com.fk.bean.PlaceBean;

import java.util.List;

/**
 * Created by fengkai on 15/03/17.
 */
public interface PlaceDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PlaceBean record);

    int insertSelective(PlaceBean record);

    PlaceBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PlaceBean record);

    int updateByPrimaryKey(PlaceBean record);

    List<PlaceBean> selectAll();
}
