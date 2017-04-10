package com.fk.service;

import com.fk.bean.CollectBean;
import com.fk.bean.HistoryBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface ICollectService {

    int insertSelective(CollectBean record);

    int deleteMyMovieId(int i);

    int count();

    List<CollectBean> selectByStart(int start);

    int countC();

    List<CollectBean> selectByStartC(int id, int start);

    int countL();

    List<CollectBean> selectByStartL(int id, int start);

    int countC(int id);

    int countL(int id);
}
