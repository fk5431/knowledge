package com.fk.service;

import com.fk.bean.HotmovieBean;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IHotmovieService {
    HotmovieBean selectByPrimaryKey(Integer id);
    List<HotmovieBean> selectAll();
}
