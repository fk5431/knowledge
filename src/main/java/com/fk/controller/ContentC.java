package com.fk.controller;

import com.fk.bean.*;
import com.fk.dao.TravelDao;
import com.fk.service.*;
import com.fk.serviceImpl.ContinentServiceImpl;
import com.fk.serviceImpl.ProvinceServiceImpl;
import com.fk.serviceImpl.TravelServiceImpl;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
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
    public IAuditService auditService;

    @Autowired
    public IProvinceService provinceService;

    @Autowired
    public IContinentService continentService;

    @Autowired
    public ITypeService typeService;

    @Autowired
    public ILiketravelService liketravelService;

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
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
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
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        return "context";
    }

    @RequestMapping("/articleuser")
    public String articleuser(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.THREE_INT);
        String id = request.getParameter("id");
        AuditBean travelBean = auditService.selectByPrimaryKey(Integer.parseInt(id));
        travelBean.setLookcount(travelBean.getLookcount() + CommonConst.ONE_INT);
        auditService.updateByPrimaryKey(travelBean);
        map.put("travel", travelBean);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        return "context";
    }

    @RequestMapping("count_context")
    public String addCount(HttpServletRequest request, Map<String, Object> map){
        if(!Login.islogin(request)){
            //map.put(CommonConst.LOGIN, CommonConst.YES);
            return "login";
        }
        String userId = "0";
        Cookie[] cookies = request.getCookies();
        for(Cookie c: cookies){
            if(c.getName().equals(CommonConst.USERID)){
                userId = c.getValue();
            }
        }
        String id = request.getParameter("id");
        if(id!=null) {
            TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(id));
            travelBean.setCount(travelBean.getCount() + CommonConst.ONE_INT);
            travelService.updateByPrimaryKey(travelBean);
            LiketravelBean liketravelBean = new LiketravelBean();
            liketravelBean.setTravelid(travelBean.getId());
            liketravelBean.setUserid(Integer.parseInt(userId));
            liketravelService.insertSelective(liketravelBean);
        }

        return article(request, map);
    }

}
