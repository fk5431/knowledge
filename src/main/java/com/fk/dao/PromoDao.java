package com.fk.dao;

import com.fk.bean.PromoBean;

import java.util.List;

/**
 * Created by fengkai on 13/03/17.
 */
public interface PromoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(PromoBean record);

    int insertSelective(PromoBean record);

    PromoBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PromoBean record);

    int updateByPrimaryKey(PromoBean record);

    List<PromoBean> selectAll();

}
