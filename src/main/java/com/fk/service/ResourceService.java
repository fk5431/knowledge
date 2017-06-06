package com.fk.service;

import com.fk.bean.FileBean;
import com.fk.bean.FileReturnBean;
import com.fk.bean.KtypeBean;
import com.fk.bean.UserBean;
import com.fk.dao.FileDao;
import com.fk.dao.KtypeDao;
import com.fk.dao.ReviewDao;
import com.fk.dao.UserDao;
import com.fk.util.CommonConst;
import com.fk.util.PropertiesStr;
import com.fk.util.StringUtil;
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

    @Autowired
    ReviewDao reviewDao;

    private final int SIZE = 8;

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

    public void showfile(int id, Map<String, Object> map) {
        FileBean fileBean = fileDao.selectByPrimaryKey(id);
        map.put("file", fileBean);
        int userId = fileBean.getUid();
        if(userId!= -1){
            UserBean userBean = useDao.selectByPrimaryKey(userId);
            map.put("name", userBean.getUname());
        }else{
            map.put("name", "管理员");
        }



    }

    public FileBean getFile(int id) {
        return fileDao.selectByPrimaryKey(id);
    }

    public void showreviewfile(int id, Map<String, Object> map) {
        FileBean fileBean = reviewDao.selectByPrimaryKey(id);
        map.put("file", fileBean);
        int userId = fileBean.getUid();
        if(userId!= -1){
            UserBean userBean = useDao.selectByPrimaryKey(userId);
            map.put("name", userBean.getUname());
        }else{
            map.put("name", "管理员");
        }
    }

    public String preview(String url, String id, Map<String, Object> map) {
        FileBean fileBean = fileDao.selectByPrimaryKey(Integer.parseInt(id));
        String suffix = StringUtil.suffix(fileBean.getFname());

        url = StringUtil.subString(url);
        map.put("url", url);
        if(PropertiesStr.office.contains(suffix)) {
            return "previewoffice";
        }else if(PropertiesStr.music.contains(suffix)){
            return "previewmusic";
        }
        return "/info/error";
    }
}
