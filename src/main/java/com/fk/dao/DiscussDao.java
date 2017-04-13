package com.fk.dao;

import com.fk.bean.DiscussBean;

import java.util.List;

/**
 * Created by fengkai on 13/04/17.
 */
public interface DiscussDao {

    int deleteByPrimaryKey(Integer id);

    int insert(DiscussBean record);

    int insertSelective(DiscussBean record);

    DiscussBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DiscussBean record);

    int updateByPrimaryKey(DiscussBean record);

    List<DiscussBean> selectByNewsId(Integer id);
}
