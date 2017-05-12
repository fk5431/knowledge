package com.fk.service;

import com.fk.bean.LiketravelBean;

import java.util.List;

/**
 * Created by FK on 2017/4/8.
 */
public interface ILiketravelService {
    int insertSelective(LiketravelBean record);

    List<LiketravelBean> selectByUserId(Integer id);

    LiketravelBean selectByUserIdAndTravelId(Integer travelId, int userId);
}
