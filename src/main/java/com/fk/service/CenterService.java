package com.fk.service;

import com.fk.bean.*;
import com.fk.dao.*;
import com.fk.util.CElastic;
import com.fk.util.CommonConst;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/19.
 */
@Service("centeerService")
public class CenterService {

    @Autowired
    BrowseDao browseDao;

    @Autowired
    FileDao fileDao;

    @Autowired
    UserDao userDao;

    @Autowired
    CdocumentDao cdocumentDao;

    @Autowired
    ReviewDao reviewDao;

    private final int SIZE = 8;
    public void index(String page_, int userId, Map<String, Object> map) {
        try {
            int count = browseDao.countByUserId(userId);
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
            start = start<0 ? 0 : start;
            List<BrowseBean> list = browseDao.selectByStartOfUserId(userId, start);
            List<FileReturnBean> reList = Lists.newArrayList();
            for(BrowseBean b : list){
                FileBean f = fileDao.selectByPrimaryKey(b.getFid());
                if(f != null){
                    int uid = f.getUid();
                    UserBean userBean = userDao.selectByPrimaryKey(uid);
                    FileReturnBean fileReturnBean = new FileReturnBean(f);
                    if (userBean != null) {
                        fileReturnBean.setUname(userBean.getUname());
                    } else {
                        fileReturnBean.setUname("未知");
                    }
                    if (uid == -1) {
                        fileReturnBean.setUname("管理员");
                    }
                    reList.add(fileReturnBean);
                }
            }
            map.put("file", reList);
            map.put("type", "1");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, 1);
        }

    }

    public void upload(String page_, int userId, Map<String, Object> map) {

        try {
            int count = fileDao.countByUserId(userId);
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
            start = start<0 ? 0 : start;
            List<FileBean> list = fileDao.selectByStartAndUserId(userId, start);
            List<FileReturnBean> reList = Lists.newArrayList();
            for(FileBean fileBean : list){
                int uid = fileBean.getUid();
                UserBean userBean = userDao.selectByPrimaryKey(uid);
                FileReturnBean fileReturnBean = new FileReturnBean(fileBean);
                if (userBean != null) {
                    fileReturnBean.setUname(userBean.getUname());
                } else {
                    fileReturnBean.setUname("未知");
                }
                if (uid == -1) {
                    fileReturnBean.setUname("管理员");
                }
                reList.add(fileReturnBean);
            }
            map.put("file", reList);
            map.put("type", "2");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, 1);
        }


    }

    public void document(String page_, int userId, Map<String, Object> map) {
        try {
            int count = cdocumentDao.countByUserId(userId);
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
            start = start<0 ? 0 : start;
            List<CdocumentBean> list = cdocumentDao.selectByStartOfUserId(userId, start);
            List<FileReturnBean> reList = Lists.newArrayList();
            for(CdocumentBean c : list){
                FileBean f = fileDao.selectByPrimaryKey(c.getFid());
                if(f != null){
                    int uid = f.getUid();
                    UserBean userBean = userDao.selectByPrimaryKey(uid);
                    FileReturnBean fileReturnBean = new FileReturnBean(f);
                    if (userBean != null) {
                        fileReturnBean.setUname(userBean.getUname());
                    } else {
                        fileReturnBean.setUname("未知");
                    }
                    if (uid == -1) {
                        fileReturnBean.setUname("管理员");
                    }
                    reList.add(fileReturnBean);
                }
            }
            map.put("file", reList);
            map.put("type", "3");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, 1);
        }

    }

    public void peding(int userId, Map<String, Object> map) {

    }


    public int index_count(int userId) {
        return browseDao.countByUserId(userId);
    }

    public int upload_count(int userId) {
        return  fileDao.countByUserId(userId);
    }

    public int document_count(int userId) {
        return cdocumentDao.countByUserId(userId);
    }

    public int peding_count(int userId) {
        return 0;
    }

    public void agree(int id) {
        FileBean fileBean = reviewDao.selectByPrimaryKey(id);
        fileBean.setFid(null);
        fileDao.insertSelective(fileBean);
        reviewDao.deleteByPrimaryKey(id);
        OperativeService operativeService = new OperativeService();
        String other = operativeService.extract(fileBean);
        ESFileBean esFileBean = new ESFileBean(fileBean);
        esFileBean.setOther(other);
        CElastic.inital();
        CElastic.elastic.insert(esFileBean);
    }
}
