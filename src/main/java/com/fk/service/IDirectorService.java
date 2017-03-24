package com.fk.service;

import com.fk.bean.DirectorBean;

import java.util.List;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IDirectorService {
    DirectorBean selectByPrimaryKey(Integer id);
    List<DirectorBean> selectAll();
}
