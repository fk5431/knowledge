package com.fk.service;

import com.fk.bean.TravelBean;

/**
 * Created by fengkai on 28/02/17.
 */
public interface ITravelService {

    TravelBean selectByPrimaryKey(Integer id);

    int count();

    void updateCountById(Integer id);

    int updateByPrimaryKey(TravelBean record);
}
