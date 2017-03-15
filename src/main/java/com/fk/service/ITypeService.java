package com.fk.service;

import com.fk.bean.TypeBean;

/**
 * Created by FK on 2017/2/9.
 */
public interface ITypeService {
    TypeBean selectByPrimaryKey(Integer id);
}
