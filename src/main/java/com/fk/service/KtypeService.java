package com.fk.service;

import com.fk.bean.FileBean;
import com.fk.bean.KtypeBean;
import com.fk.bean.UserBean;
import com.fk.dao.KtypeDao;
import com.fk.util.MD5;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 27/04/17.
 */
@Service("ktypeService")
public class KtypeService {

    private Logger logger = LoggerFactory.getLogger(KtypeService.class);

    @Autowired
    KtypeDao ktypeDao;

    public void selectAllKtype(HttpServletRequest request, Map<String, Object> map) {
        try {
            List<KtypeBean> ktypeBeans = ktypeDao.selectAll();
            map.put("ktype", ktypeBeans);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("KtypeService.selectAllKtype  in ]", e);
        }
    }

    public void updateKtype(String id, String name, MultipartFile file, Map<String, Object> map) {
        try {
            KtypeBean ktypeBean = ktypeDao.selectByPrimaryKey(Integer.parseInt(id));
            if (name != null && !"".equals(name)) {
                ktypeBean.setKtype(name);
            }
            if (file != null && file.getSize() != 0) {
                String filename = file.getOriginalFilename();
                String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
                filename = String.valueOf(System.currentTimeMillis()) + filename;
                path = path + "upload/ktype";
                File upload = new File(path, filename);
                try {
                    FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                String url = "/knowledge/upload/ktype/" + filename;
                ktypeBean.setKtypeurl(url);
            }
            ktypeDao.updateByPrimaryKey(ktypeBean);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("KtypeService.selectAllKtype  in ]", e);
        }
    }

    public void delKtype(int i, Map<String, Object> map) {
        ktypeDao.deleteByPrimaryKey(i);
    }

    public void addCount(FileBean fileBean) {
        KtypeBean ktypeBean = ktypeDao.selectByPrimaryKey(fileBean.getKtypeid());
        ktypeBean.setCount(ktypeBean.getCount() + 1);
        ktypeDao.updateByPrimaryKey(ktypeBean);
    }
}
