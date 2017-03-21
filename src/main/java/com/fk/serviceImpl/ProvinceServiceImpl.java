package com.fk.serviceImpl;

import com.fk.bean.ProvinceBean;
import com.fk.dao.AreaDao;
import com.fk.dao.ProvinceDao;
import com.fk.service.IAreaService;
import com.fk.service.IProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("provinceService")
public class ProvinceServiceImpl implements IProvinceService {

    @Autowired
    ProvinceDao provinceDao;

    @Override
    public List<ProvinceBean> selectAll() {
        return provinceDao.selectAll();
    }
}