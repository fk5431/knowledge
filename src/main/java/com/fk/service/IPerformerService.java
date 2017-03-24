package com.fk.service;

import com.fk.bean.PerformerBean;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IPerformerService {
    PerformerBean selectByPrimaryKey(Integer id);

    List<PerformerBean> selectAll();

    List<PerformerBean> selectByStart(Integer start);

    int count();

    int deleteByPrimaryKey(Integer id);
}
