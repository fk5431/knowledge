package com.fk.service;

import com.fk.bean.FileBean;
import com.fk.bean.FileReturnBean;
import com.fk.bean.KtypeBean;
import com.fk.bean.UserBean;
import com.fk.dao.FileDao;
import com.fk.dao.KtypeDao;
import com.fk.dao.UserDao;
import com.fk.util.CommonConst;
import com.google.common.collect.Lists;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 03/05/17.
 */
@Service("resourceService")
public class ResourceService {

    private Logger logger = LoggerFactory.getLogger(ResourceService.class);

    @Autowired
    KtypeDao ktypeDao;

    @Autowired
    FileDao fileDao;

    @Autowired
    UserDao useDao;

    private final int SIZE = 10;

    public void resource(String page_, Map<String, Object> map) {

        try {
            List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
            map.put("type", ktypeBeans);

            int count = fileDao.count();
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
            List<FileBean> list = fileDao.selectByStart(start);
            List<FileReturnBean> fileReturnBeans = Lists.newArrayList();
            for (FileBean f : list) {
                FileReturnBean fileReturnBean = new FileReturnBean(f);
                int uid = fileReturnBean.getUid();
                UserBean userBean = useDao.selectByPrimaryKey(uid);
                if (userBean != null) {
                    fileReturnBean.setUname(userBean.getUname());
                } else {
                    fileReturnBean.setUname("未知");
                }
                if (uid == -1) {
                    fileReturnBean.setUname("管理员");
                }
                KtypeBean ktypeBean = ktypeDao.selectByPrimaryKey(fileReturnBean.getKtypeid());
                if (ktypeBean != null) {
                    fileReturnBean.setFtypename(ktypeBean.getKtype());
                } else {
                    fileReturnBean.setFtypename("未知");
                }
                fileReturnBeans.add(fileReturnBean);
            }
            map.put("file", fileReturnBeans);
            map.put("index", 2);
        } catch (Exception e) {
            e.printStackTrace();
            map.put(CommonConst.ERRORCODE, 1);
        }


    }

}
