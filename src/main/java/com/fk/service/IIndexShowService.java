package com.fk.service;

import com.fk.bean.AreaBean;
import com.fk.bean.IndexShowBean;
import com.fk.bean.TravelBean;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IIndexShowService {
    IndexShowBean selectByPrimaryKey(Integer id);
}
