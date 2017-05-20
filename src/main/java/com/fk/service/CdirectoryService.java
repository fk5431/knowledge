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

    private final int SIZE = 8;

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

    public void selectAllOfPage(String page_, Map<String, Object> map) {
        try {
            int count = cdirectoryDao.count();
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
            List<CdirectoryBean> cdirectoryBeans = cdirectoryDao.selectByStart(start);
            map.put("directory", cdirectoryBeans);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delDirectory(int id, Map<String, Object> map) {
        cdirectoryDao.deleteByPrimaryKey(id);
    }

    public void directoryPutFirstById(int id, Map<String, Object> map) {
        CdirectoryBean cdirectoryBean = cdirectoryDao.selectByPrimaryKey(id);
        cdirectoryDao.deleteByPrimaryKey(id);
        cdirectoryBean.setDid(null);
        cdirectoryDao.insertSelective(cdirectoryBean);
    }
}
