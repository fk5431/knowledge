package com.fk.serviceImpl;

import com.fk.bean.AuditBean;
import com.fk.dao.AuditDao;
import com.fk.service.IAuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("auditService")
public class AuditServiceImpl implements IAuditService {

    @Autowired
    AuditDao auditlDao;

    @Override
    public AuditBean selectByPrimaryKey(Integer id) {
        return auditlDao.selectByPrimaryKey(id);
    }

    @Override
    public int count() {
        return auditlDao.count();
    }



    @Override
    public int updateByPrimaryKey(AuditBean record) {
        return auditlDao.updateByPrimaryKey(record);
    }

    @Override
    public int countOverFive() {
        return auditlDao.countOverFive();
    }

    @Override
    public List<AuditBean> selectByCountOverFive() {
        return auditlDao.selectByCountOverFive();
    }

    @Override
    public List<AuditBean> selectByPlace(String place) {
        return auditlDao.selectByPlace(place);
    }

    @Override
    public List<AuditBean> selectByStart(Integer start) {
        return auditlDao.selectByStart(start);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return auditlDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(AuditBean record) {
        return auditlDao.insertSelective(record);
    }

    @Override
    public List<AuditBean> selectByType(String type) {
        return auditlDao.selectByType(type);
    }
}
