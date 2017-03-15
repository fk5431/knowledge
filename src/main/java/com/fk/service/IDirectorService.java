package com.fk.service;

import com.fk.bean.DirectorBean;

/**
 * Created by fengkai on 14/03/17.
 */
public interface IDirectorService {
    DirectorBean selectByPrimaryKey(Integer id);

}
