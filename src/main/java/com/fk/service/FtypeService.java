package com.fk.service;

import com.fk.bean.FileBean;
import com.fk.bean.FtypeBean;
import com.fk.dao.FtypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 27/04/17.
 */
@Service("ftypeService")
public class FtypeService {

    @Autowired
    FtypeDao ftypeDao;

    public void selectAllFtype(HttpServletRequest request, Map<String, Object> map) {
        List<FtypeBean> ftypeBeans = ftypeDao.selectAll();
        map.put("ftype", ftypeBeans);
    }

    public void updateftype(FtypeBean file, Map<String, Object> map) {
        FtypeBean ftypeBean = ftypeDao.selectByPrimaryKey(file.getFtypeid());
        if (file.getFtypename() != null && !"".equals(file.getFtypename())) {
            ftypeBean.setFtypename(file.getFtypename());
        }
        if (file.getFtype() != null && !"".equals(file.getFtype())) {
            if (ftypeBean.getFtype() == null || ftypeBean.getFtype().equals("")) {
                ftypeBean.setFtype(file.getFtype());
            } else {
                ftypeBean.setFtype(ftypeBean.getFtype() + "," + file.getFtype());
            }
        }
        ftypeDao.updateByPrimaryKey(ftypeBean);
    }

    public void delFtype(int i, Map<String, Object> map) {
        ftypeDao.deleteByPrimaryKey(i);
    }
}
