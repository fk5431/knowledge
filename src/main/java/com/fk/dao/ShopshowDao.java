package com.fk.dao;

import com.fk.bean.ShopshowBean;

/**
 * Created by fengkai on 17/03/17.
 */
public interface ShopshowDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopshowBean record);

    int insertSelective(ShopshowBean record);

    ShopshowBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopshowBean record);

    int updateByPrimaryKey(ShopshowBean record);
}
