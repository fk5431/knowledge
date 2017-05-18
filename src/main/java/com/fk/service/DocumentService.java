package com.fk.service;

import com.fk.bean.CdirectoryBean;
import com.fk.bean.CdocumentBean;
import com.fk.bean.FileBean;
import com.fk.dao.CdirectoryDao;
import com.fk.dao.CdocumentDao;
import com.fk.dao.FileDao;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.DocumentDefaultsDefinition;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by FK on 2017/5/18.
 */
@Service("documentService")
public class DocumentService {

    @Autowired
    CdocumentDao cdocumentDao;

    @Autowired
    FileDao fileDao;


    public void insertInfo(int id, int uid, Map<String, Object> map) {
        CdocumentBean c = new CdocumentBean();
        FileBean fileBean = fileDao.selectByPrimaryKey(id);
        c.setFid(id);
        c.setUid(uid);
        cdocumentDao.insertSelective(c);
        map.put(CommonConst.ERRORCODE, 15);
    }
}
