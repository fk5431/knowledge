package com.fk.serviceImpl;

import com.fk.bean.LiketravelBean;
import com.fk.dao.LiketravelDao;
import com.fk.service.ILiketravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by FK on 2017/4/8.
 */
@Service("liketravelService")
public class LiketravelServiceImpl implements ILiketravelService {

    @Autowired
    LiketravelDao liketravelDao;

    @Override
    public int insertSelective(LiketravelBean record) {
        return liketravelDao.insertSelective(record);
    }

    @Override
    public List<LiketravelBean> selectByUserId(Integer id) {
        return liketravelDao.selectByUserId(id);
    }
}
