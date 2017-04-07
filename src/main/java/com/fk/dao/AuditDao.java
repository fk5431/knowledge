package com.fk.dao;

import com.fk.bean.AuditBean;
import com.fk.bean.TravelBean;

import java.util.List;

public interface AuditDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AuditBean record);

    int insertSelective(AuditBean record);

    AuditBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AuditBean record);

    int updateByPrimaryKeyWithBLOBs(AuditBean record);

    int updateByPrimaryKey(AuditBean record);


    int count();
    int countOverFive();


    List<AuditBean> selectByCountOverFive();

    List<AuditBean> selectByPlace(String place);
    List<AuditBean> selectByType(String type);
    List<AuditBean> selectByStart(Integer start);
}