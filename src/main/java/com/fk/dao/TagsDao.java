package com.fk.dao;

import com.fk.bean.TagsBean;

import java.util.List;

public interface TagsDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TagsBean record);

    int insertSelective(TagsBean record);

    TagsBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TagsBean record);

    int updateByPrimaryKey(TagsBean record);

    TagsBean selectByTag(String str);

    List<TagsBean> selectByUserId(int userId);

    int count();

    List<TagsBean> selectByStart(int start);
}