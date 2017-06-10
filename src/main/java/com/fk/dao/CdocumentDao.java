package com.fk.dao;

import com.fk.bean.CdocumentBean;

import java.util.List;

public interface CdocumentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CdocumentBean record);

    int insertSelective(CdocumentBean record);

    CdocumentBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CdocumentBean record);

    int updateByPrimaryKey(CdocumentBean record);

    int countByUserId(int userId);

    List<CdocumentBean> selectByStartOfUserId(int userId, int start);

    List<CdocumentBean> selectAll();
}