package com.fk.service;

import com.fk.bean.TypeBean;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface ITypeService {
    TypeBean selectByPrimaryKey(Integer id);
    List<TypeBean> selectAll();
    List<TypeBean> selectByStart(Integer start);
    int deleteByPrimaryKey(Integer id);
    int updateByPrimaryKeySelective(TypeBean record);
}
