package com.fk.service;

import com.fk.bean.LineBean;
import com.fk.bean.RecordBean;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
public interface ILineService {
    LineBean selectByPrimaryKey(Integer id);

    List<LineBean> selectByForginId(Integer id);
}
