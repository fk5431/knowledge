package com.fk.serviceImpl;

import com.fk.dao.AreaDao;
import com.fk.dao.IndexShowDao;
import com.fk.service.IAreaService;
import com.fk.service.IIndexShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by fengkai on 28/02/17.
 */
@Service("indexShowService")
public class IndexShowServiceImpl implements IIndexShowService {

    @Autowired
    IndexShowDao indexShowDao;

}
