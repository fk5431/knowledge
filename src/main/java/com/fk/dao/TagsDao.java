package com.fk.dao;

import com.fk.bean.TagsBean;

public interface TagsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TagsBean record);

    int insertSelective(TagsBean record);

    TagsBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TagsBean record);

    int updateByPrimaryKey(TagsBean record);
}