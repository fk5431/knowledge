package com.fk.service;

import com.fk.bean.AreaBean;
import com.fk.bean.PromoBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IPromoService {
    PromoBean selectByPrimaryKey(Integer id);
    List<PromoBean> selectAll();
    int deleteByPrimaryKey(Integer id);
    int insertSelective(PromoBean record);
}
