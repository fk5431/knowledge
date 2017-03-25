package com.fk.dao;


import com.fk.bean.TypeBean;
import com.fk.bean.User;

import java.util.List;

/**
 * Created by FK on 2017/2/9.
 */
public interface TypeDao {

        int deleteByPrimaryKey(Integer id);

        int insert(TypeBean record);

        int insertSelective(TypeBean record);

        TypeBean selectByPrimaryKey(Integer id);

        int updateByPrimaryKeySelective(TypeBean record);

        int updateByPrimaryKey(TypeBean record);

        List<TypeBean> selectAll();
        List<TypeBean> selectByStart(Integer start);
}