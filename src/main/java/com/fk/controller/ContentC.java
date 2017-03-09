package com.fk.controller;

import com.fk.bean.ContinentBean;
import com.fk.bean.ProvinceBean;
import com.fk.bean.TravelBean;
import com.fk.bean.TypeBean;
import com.fk.dao.TravelDao;
import com.fk.service.IContinentService;
import com.fk.service.IProvinceService;
import com.fk.service.ITravelService;
import com.fk.service.ITypeService;
import com.fk.serviceImpl.ContinentServiceImpl;
import com.fk.serviceImpl.ProvinceServiceImpl;
import com.fk.serviceImpl.TravelServiceImpl;
import com.fk.util.CommonConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 06/03/17.
 */
@Controller
public class ContentC {

    private Logger logger = LoggerFactory.getLogger(ContentC.class);

    @Autowired
    public ITravelService travelService;

    @Autowired
    public IProvinceService provinceService;

    @Autowired
    public IContinentService continentService;

    @Autowired
    public ITypeService typeService;

    private static final int SIZE = CommonConst.SIX_INT;

    @RequestMapping("/content_list")
    public String context_list(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);

        List<ProvinceBean> provinceBeanList = provinceService.selectAll();
        map.put("province", provinceBeanList);
        List<ContinentBean> continentBeanList = continentService.selectAll();
        map.put("continent",continentBeanList);
        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);


        List<TravelBean> travelList = new ArrayList<>();
        int count = travelService.count();
        int page = 1;
        if(count % SIZE == 0)
            page = count / SIZE;
        else
            page = count / SIZE + CommonConst.ONE_INT;
        map.put("count", count);
        map.put("size", SIZE);
        map.put("page", page);
        String page_ = request.getParameter("page");
        int toPage;
        if(page_ == null || "".equals(page_)){
            toPage = 1;
        }else {
            toPage = Integer.parseInt(page_);
        }
        if(toPage > page){
            toPage = page;
        }
        map.put("pageNow", toPage);
        for(int i=1;i<=SIZE ;i++){
            TravelBean travelBean = travelService.selectByPrimaryKey((toPage - 1) * SIZE + i);
            if(travelBean == null){

            }else {
                travelList.add(travelBean);
            }
        }
        map.put("travel", travelList);

        return "content";
    }

    @RequestMapping("/article")
    public String article(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);
        String id = request.getParameter("id");
        TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
        travelBean.setLookcount(travelBean.getLookcount() + CommonConst.ONE_INT);
        travelService.updateByPrimaryKey(travelBean);
        map.put("travel", travelBean);
        return "context";
    }

    @RequestMapping("count_context")
    public String addCount(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        if(id!=null) {
            TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
            travelBean.setCount(travelBean.getCount() + CommonConst.ONE_INT);
            travelService.updateByPrimaryKey(travelBean);
        }
        return article(request, map);
    }

}
