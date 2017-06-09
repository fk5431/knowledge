package com.fk.service;

import com.alibaba.fastjson.JSON;
import com.fk.bean.*;
import com.fk.dao.FtypeDao;
import com.fk.dao.KtypeDao;
import com.fk.dao.UserDao;
import com.fk.util.CElastic;
import com.fk.util.CommonConst;
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

    @Autowired
    KtypeDao ktypeDao;

    private final int SIZE = 8;
    public void search(String page_, String search, Map<String, Object> map) {
        List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
        map.put("type", ktypeBeans);

        CElastic.inital();
        List<String> strs =  CElastic.elastic.searchAll(search);
        int count = strs.size();
        int page = 1;
        if (count % SIZE == 0)
            page = count / SIZE;
        else
            page = count / SIZE + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZE);
        map.put("page", page);
        int toPage;
        if (page_ == null || "".equals(page_)) {
            toPage = 1;
        } else {
            toPage = Integer.parseInt(page_);
        }
        if (toPage > page) {
            toPage = page;
        }
        map.put("pageNow", toPage);
        int start = (toPage - 1) * SIZE;
        int last = start + 8 > strs.size() ? strs.size() : start + 8;
        strs = strs.subList(start, last);
        List<FileReturnBean> list = Lists.newArrayList();
        for(String str : strs){
            ESFileBean esFile = JSON.parseObject(str, ESFileBean.class);
            FileBean fileBean = esFile;
            FileReturnBean fileReturnBean = new FileReturnBean(fileBean);
            UserBean userBean = userDao.selectByPrimaryKey(fileBean.getUid());
            if (userBean != null) {
                fileReturnBean.setUname(userBean.getUname());
            } else {
                fileReturnBean.setUname("未知");
            }
            if (fileBean.getUid() == -1) {
                fileReturnBean.setUname("管理员");
            }
            KtypeBean ktypeBean = ktypeDao.selectByPrimaryKey(fileReturnBean.getKtypeid());
            if (ktypeBean != null) {
                fileReturnBean.setFtypename(ktypeBean.getKtype());
            } else {
                fileReturnBean.setFtypename("未知");
            }
            list.add(fileReturnBean);
        }

        map.put("list", list);
        map.put("search", search);
        map.put("index", 0);
    }

    public void groupSearch(String[] bools, String[] sections, String[] words, Map<String, Object> map) {
        List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
        map.put("type", ktypeBeans);

        CElastic.inital();
        List<String> strs =  CElastic.elastic.groupSearch(bools, sections, words);

    }
}