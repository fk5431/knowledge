package com.fk.service;

import com.fk.bean.HotmovieBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IHotmovieService {
    HotmovieBean selectByPrimaryKey(Integer id);
}
