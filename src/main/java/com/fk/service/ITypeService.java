package com.fk.service;

import com.fk.bean.ContinentBean;
import com.fk.bean.TypeBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface ITypeService {

    List<TypeBean> selectAll();
    int updateByPrimaryKey(TypeBean record);
    TypeBean selectByTypeName(String typename);
    TypeBean selectByPrimaryKey(Integer id);
}
