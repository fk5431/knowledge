package com.fk.service;

import com.fk.bean.AuditBean;
import com.fk.bean.TravelBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IAuditService {

    AuditBean selectByPrimaryKey(Integer id);

    int count();
    int countOverFive();

    int updateByPrimaryKey(AuditBean record);

    List<AuditBean> selectByCountOverFive();

    List<AuditBean> selectByPlace(String place);

    List<AuditBean> selectByStart(Integer start);

    int deleteByPrimaryKey(Integer id);
    int insertSelective(AuditBean record);
    List<AuditBean> selectByType(String type);
}
