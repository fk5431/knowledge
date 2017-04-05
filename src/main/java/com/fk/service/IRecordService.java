package com.fk.service;

import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface IRecordService {
    RecordBean selectByPrimaryKey(Integer id);

    List<RecordBean> selectByForginId(Integer id);
    int deleteByForginId(Integer id);
    int insertSelective(RecordBean record);
}
