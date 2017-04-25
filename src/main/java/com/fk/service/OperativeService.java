package com.fk.service;

import com.fk.bean.FtypeBean;
import com.fk.bean.KtypeBean;
import com.fk.bean.UserBean;
import com.fk.dao.FtypeDao;
import com.fk.dao.KtypeDao;
import com.fk.dao.UserDao;
import com.fk.util.CommonConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 25/04/17.
 */
@Service("operativeService")
public class OperativeService {

    @Autowired
    UserDao userDao;

    @Autowired
    FtypeDao ftypeDao;

    @Autowired
    KtypeDao ktypeDao;

    private Logger logger = LoggerFactory.getLogger(UserService.class);


    public void adduser(UserBean userBean, Map<Object, String> map) {
        try {
            UserBean user = userDao.selectByEmail(userBean.getUemail());
            UserBean username = userDao.selectByName(userBean.getUname());
            if(user != null){
                map.put(CommonConst.ERRORCODE, "1");
                return;
            }else if(username != null){
                map.put(CommonConst.ERRORCODE, "4");
                return;
            }
            userDao.insertSelective(userBean);
        }catch (Exception e){
            logger.error("OperativeService.adduser error");
            e.printStackTrace();
        }

    }

    public void addFtype(FtypeBean ftypeBean, Map<Object, String> map) {
        try {
            FtypeBean ftype = ftypeDao.selectByName(ftypeBean.getFtypename());
            if(ftype != null){
                map.put(CommonConst.ERRORCODE, "5");
                return;
            }
            ftypeDao.insertSelective(ftypeBean);
        }catch (Exception e){
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }

    }

    public void addKtype(KtypeBean ktypeBean, Map<Object, String> map) {
        try {
            KtypeBean ftype = ktypeDao.selectByName(ktypeBean.getKtype());
            if(ftype != null){
                map.put(CommonConst.ERRORCODE, "5");
                return;
            }
            ktypeDao.insertSelective(ktypeBean);
        }catch (Exception e){
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }

    }

    public void fileform(Map<String, Object> map) {
        try {
            List<FtypeBean> ftypeBeans = ftypeDao.selectAll();
            List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
            map.put("ftype", ftypeBeans);
            map.put("ktype", ktypeBeans);

        }catch (Exception e){
            logger.error("OperativeService.addFtype error");
            e.printStackTrace();
        }
    }
}
