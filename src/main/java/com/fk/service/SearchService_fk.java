package com.fk.service;

import com.alibaba.fastjson.JSON;
import com.fk.bean.*;
import com.fk.dao.FtypeDao;
import com.fk.dao.UserDao;
import com.fk.util.CElastic;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/22.
 */
@Service("searchService_fk")
public class SearchService_fk {

    @Autowired
    UserDao userDao;

    @Autowired
    FtypeDao ftypeDao;


    public void search(String search, Map<String, Object> map) {
        CElastic.inital();
        List<String> strs =  CElastic.elastic.searchAll(search);
        List<FileReturnBean> list = Lists.newArrayList();
        for(String str : strs){
            ESFileBean esFile = JSON.parseObject(str, ESFileBean.class);
            FileBean fileBean = esFile;
            FileReturnBean fileReturnBean = new FileReturnBean(fileBean);
            UserBean userBean = userDao.selectByPrimaryKey(fileBean.getUid());
            FtypeBean ftypeBean = ftypeDao.selectByPrimaryKey(fileBean.getFtypeid());
            fileReturnBean.setUname(userBean.getUname());
            fileReturnBean.setFtypename(ftypeBean.getFtypename());
            list.add(fileReturnBean);
        }
        map.put("list", list);
        map.put("index", 0);
    }
}
