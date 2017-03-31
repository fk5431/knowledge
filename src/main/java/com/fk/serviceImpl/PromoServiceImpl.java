package com.fk.serviceImpl;

import com.fk.bean.AreaBean;
import com.fk.bean.PromoBean;
import com.fk.dao.AreaDao;
import com.fk.dao.PromoDao;
import com.fk.service.IAreaService;
import com.fk.service.IPromoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("promoService")
public class PromoServiceImpl implements IPromoService {

    @Autowired
    PromoDao promoDao;

    @Override
    public PromoBean selectByPrimaryKey(Integer id) {
        return promoDao.selectByPrimaryKey(id);
    }

    @Override
    public List<PromoBean> selectAll() {
        return promoDao.selectAll();
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return promoDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(PromoBean record) {
        return promoDao.insertSelective(record);
    }
}
