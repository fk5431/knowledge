package com.fk.serviceImpl;

import com.fk.bean.PhotoBean;
import com.fk.dao.PhotoDao;
import com.fk.service.IPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 22/03/17.
 */
@Service("photoService")
public class PhotoServiceImpl implements IPhotoService{

    @Autowired
    PhotoDao photoDao;

    @Override
    public List<PhotoBean> selectlastfour() {
        return photoDao.selectlastfour();
    }

    @Override
    public List<PhotoBean> selectByStrat(int start) {
        return photoDao.selectByStrat(start);
    }

    @Override
    public int count() {
        return photoDao.count();
    }

    @Override
    public PhotoBean selectByPrimaryKey(Integer id) {
        return photoDao.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByPrimaryKey(int i) {
        return photoDao.deleteByPrimaryKey(i);
    }

    @Override
    public int insert(PhotoBean photoBean) {
        return photoDao.insertSelective(photoBean);
    }

    @Override
    public int update(PhotoBean photoBean) {
        return photoDao.updateByPrimaryKey(photoBean);
    }
}
