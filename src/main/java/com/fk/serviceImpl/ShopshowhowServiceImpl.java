package com.fk.serviceImpl;

import com.fk.bean.IndexShowBean;
import com.fk.bean.ShopshowBean;
import com.fk.dao.IndexShowDao;
import com.fk.dao.ShopshowDao;
import com.fk.service.IIndexShowService;
import com.fk.service.IShopshowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("shopShowService")
public class ShopshowhowServiceImpl implements IShopshowService {

    @Autowired
    ShopshowDao shopShowDao;

    @Override
    public ShopshowBean selectByPrimaryKey(Integer id) {
        return shopShowDao.selectByPrimaryKey(id);
    }
}
