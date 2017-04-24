package com.fk.dao;

import com.fk.bean.CdocumentBean;

public interface CdocumentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CdocumentBean record);

    int insertSelective(CdocumentBean record);

    CdocumentBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CdocumentBean record);

    int updateByPrimaryKey(CdocumentBean record);
}