package com.fk.service;

import com.fk.bean.ContinentBean;
import com.fk.bean.ProvinceBean;
import com.fk.bean.TypeBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IContinentService {

    List<ContinentBean> selectAll();
}
