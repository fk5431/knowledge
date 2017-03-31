package com.fk.service;

import com.fk.bean.ProvinceBean;
import com.fk.bean.TravelBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IProvinceService {

    List<ProvinceBean> selectAll();

    ProvinceBean selectByname(String province);
    int updateByPrimaryKey(ProvinceBean record);
    ProvinceBean selectByPrimaryKey(Integer id);
}
