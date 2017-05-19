package com.fk.service;

import com.fk.bean.BrowseBean;
import com.fk.dao.BrowseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by FK on 2017/5/19.
 */
@Service("browseService")
public class BrowseService {

    @Autowired
    BrowseDao browseDao;


    public void insert(int userId, int id) {

        BrowseBean browseBean = new BrowseBean();
        browseBean.setUid(userId);
        browseBean.setFid(id);
        BrowseBean b = browseDao.selectByUserIdAndFid(userId, id);
        if(b == null){
            browseDao.insertSelective(browseBean);
        }else {
            browseDao.deleteByPrimaryKey(b.getId());
            browseDao.insertSelective(browseBean);
        }

    }
}
