package com.fk.service;

import com.fk.bean.PlaceBean;
import com.fk.bean.TypeBean;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface IPlaceService {
    PlaceBean selectByPrimaryKey(Integer id);
    List<PlaceBean> selectAll();
}
