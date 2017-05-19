package com.fk.service;

import com.fk.bean.CdirectoryBean;
import com.fk.bean.FileBean;
import com.fk.dao.CdirectoryDao;
import com.fk.dao.FileDao;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/18.
 */
@Service("cdirectoryService")
public class CdirectoryService {

    @Autowired
    CdirectoryDao  cdirectoryDao;

    @Autowired
    FileDao fileDao;


    public void insertInfo(int id, String name, Map<String, Object> map) {
        CdirectoryBean c = new CdirectoryBean();
        FileBean fileBean = fileDao.selectByPrimaryKey(id);
        c.setFid(id);
        c.setFname(fileBean.getTitle());
        c.setUrl(fileBean.getUrl());
        cdirectoryDao.insertSelective(c);
        map.put(CommonConst.ERRORCODE, 14);
    }

    public List<CdirectoryBean> selectByLastTen() {
        int count = cdirectoryDao.count();
        int start = count - 10 < 0 ? 0 : count - 10;
        return  cdirectoryDao.selectByLastTen(start);
    }
}
