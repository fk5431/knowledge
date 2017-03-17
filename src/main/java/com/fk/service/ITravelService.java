package com.fk.service;

import com.fk.bean.TravelBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface ITravelService {

    TravelBean selectByPrimaryKey(Integer id);

    int count();
    int countOverFive();

    int updateByPrimaryKey(TravelBean record);

    List<TravelBean> selectByCountOverFive();

    List<TravelBean> selectByPlace(String place);
}
