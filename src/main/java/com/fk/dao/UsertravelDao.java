package com.fk.dao;

import com.fk.bean.UsertravelBean;

import java.util.List;

/**
 * Created by fengkai on 07/04/17.
 */
public interface UsertravelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UsertravelBean record);

    int insertSelective(UsertravelBean record);

    UsertravelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UsertravelBean record);

    int updateByPrimaryKey(UsertravelBean record);

    UsertravelBean selectByTravelId(Integer id);

    List<UsertravelBean> selectByUserId(Integer id);

    int deleteByTravelKey(int id);

    int deleteByTravelKeyAnd0(int id);
}
