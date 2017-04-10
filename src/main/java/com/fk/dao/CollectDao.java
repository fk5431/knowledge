package com.fk.dao;

import com.fk.bean.CollectBean;
import com.fk.bean.HistoryBean;

import java.util.List;

/**
 * Created by fengkai on 10/04/17.
 */
public interface CollectDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CollectBean record);

    int insertSelective(CollectBean record);

    CollectBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CollectBean record);

    int updateByPrimaryKeyWithBLOBs(CollectBean record);

    int updateByPrimaryKey(CollectBean record);

    int deleteMyMovieId(int id);

    int count();

    List<CollectBean> selectByStart(int start);

    int countC();

    List<CollectBean> selectByStartC(int id, int start);

    int countL();

    List<CollectBean> selectByStartL(int id, int start);

    int countCByUserId(int id);

    int countLByUserId(int id);
}
