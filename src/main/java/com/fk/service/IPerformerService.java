package com.fk.service;

import com.fk.bean.PerformerBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IPerformerService {
    PerformerBean selectByPrimaryKey(Integer id);
}
