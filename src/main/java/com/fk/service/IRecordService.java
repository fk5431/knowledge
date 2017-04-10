package com.fk.service;

import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface IRecordService {
    int insertSelective(RecordBean record);

    int deleteByMovieId(int id);

    int count();

    List<RecordBean> selectByStart(int start);
    int deleteByPrimaryKey(Integer id);
}
