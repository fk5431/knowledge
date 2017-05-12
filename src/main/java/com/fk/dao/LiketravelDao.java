package com.fk.dao;

import com.fk.bean.LiketravelBean;

import java.util.List;

public interface LiketravelDao {
    int deleteByPrimaryKey(Integer id);

    int insert(LiketravelBean record);

    int insertSelective(LiketravelBean record);

    LiketravelBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LiketravelBean record);

    int updateByPrimaryKey(LiketravelBean record);

    List<LiketravelBean> selectByUserId(Integer id);

    LiketravelBean selectByUserIdAndTravelId(Integer travelId, int userId);
}