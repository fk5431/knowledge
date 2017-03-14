package com.fk.dao;

import com.fk.bean.IndexshowBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IndexshowDao {
    int deleteByPrimaryKey(Integer id);

    int insert(IndexshowBean record);

    int insertSelective(IndexshowBean record);

    IndexshowBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(IndexshowBean record);

    int updateByPrimaryKey(IndexshowBean record);
}
