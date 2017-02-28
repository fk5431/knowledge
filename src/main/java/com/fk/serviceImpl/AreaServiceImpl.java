package com.fk.serviceImpl;

import com.fk.dao.AreaDao;
import com.fk.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("areaService")
public class AreaServiceImpl implements IAreaService {

    @Autowired
    AreaDao areaDao;

}
