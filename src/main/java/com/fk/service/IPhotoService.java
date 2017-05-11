package com.fk.service;

import com.fk.bean.PhotoBean;

import java.util.List;

/**
 * Created by fengkai on 22/03/17.
 */
public interface IPhotoService {
    List<PhotoBean> selectlastfour();
    int count();
    List<PhotoBean> selectByStrat(int start);
    PhotoBean selectByPrimaryKey(Integer id);

    int deleteByPrimaryKey(int i);

    int insert(PhotoBean photoBean);

    int update(PhotoBean photoBean);
}
