package com.fk.service;

import com.fk.bean.FileBean;
import com.fk.dao.FileDao;
import com.fk.util.CommonConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/18.
 */

@Service("fileService")
public class FileServer {

    @Autowired
    FileDao fileDao;

    private final int SIZE = 8;
    public void selectFileByPage(String page_, Map<String, Object> map) {
        try {
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
            map.put("file", list);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
