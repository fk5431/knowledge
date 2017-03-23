package com.fk.service;

import com.fk.bean.IndexshowBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IIndexshowService {
    IndexshowBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(IndexshowBean record);

}
