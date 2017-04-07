package com.fk.service;

import com.fk.bean.UsertravelBean;

import java.util.List;

/**
 * Created by fengkai on 07/04/17.
 */
public interface IUsertravelService {

    int insertSelective(UsertravelBean record);

    UsertravelBean selectByTravelId(Integer id);
    int updateByPrimaryKey(UsertravelBean record);

    List<UsertravelBean> selectByUserId(Integer id);

    int deleteByTravelKey(int i);

    int deleteByTravelKeyAnd0(int i);
}
