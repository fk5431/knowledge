package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 17/03/17.
 */
@Controller
public class Search {
    @Autowired
    IUserService userService ;

    @Autowired
    IIndexShowService indexShowService;

    @Autowired
    ITravelService travelService;

    @Autowired
    IIndexshowshopService indexshowshopService;

    @Autowired
    IOrdersService iOrdersService;

    @Autowired
    public IProvinceService provinceService;

    @Autowired
    public IContinentService continentService;

    @Autowired
    public ITypeService typeService;

    private static final int SIZE = CommonConst.SIX_INT;

    @RequestMapping("/search")
    public String search(HttpServletRequest request, Map<String, Object> map){
        String indexsearch = request.getParameter("indexsearch");
        String key = request.getParameter("key");
        map.put("indexsearch", indexsearch);
        map.put("key", key);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        List<ProvinceBean> provinceBeanList = provinceService.selectAll();
        map.put("province", provinceBeanList);

        List<ContinentBean> continentBeanList = continentService.selectAll();
        map.put("continent",continentBeanList);

        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);
        if(CommonConst.TRAVEL.equals(indexsearch)){
            return searchTravel(request, map, key);
        }else if(CommonConst.SHOP.equals(indexsearch)){
            return searchShop(request, map, key);
        }else if("pro".equals(indexsearch)){
            return pro(request, map, key);
        }else if("con".equals(indexsearch)){
            return con(request, map, key);
        }else if("type".equals(indexsearch)){
            return type(request, map, key);
        }else {
            return searchAll(request, map, key);
        }

    }

    private String type(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", CommonConst.THREE_INT);

        List<TravelBean> travelList = travelService.selectByType(key);

        int count = travelList.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", travelList.subList(start, travelList.size()<start +SIZE?travelList.size():start+SIZE));

        return "search";

    }

    private String con(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", CommonConst.THREE_INT);

        List<TravelBean> travelList = new ArrayList<>();

        ContinentBean continentBean = continentService.selectByPrimaryKey(Integer.parseInt(key));
        String[] strings = continentBean.getTraveid().split(CommonConst.SPLITOR);
        for(String s : strings){
            if(s!=null && !"".equals(s)) {
                TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(s));
                if (s != null) {
                    travelList.add(travelBean);
                }
            }
        }

        int count = travelList.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", travelList.subList(start, travelList.size()<start +SIZE?travelList.size():start+SIZE));

        return "search";
    }

    private String pro(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", CommonConst.THREE_INT);

        List<TravelBean> travelList = new ArrayList<>();

        ProvinceBean provinceBean = provinceService.selectByPrimaryKey(Integer.parseInt(key));
        String[] strings = provinceBean.getTravelid().split(CommonConst.SPLITOR);
        for(String s : strings){
            if(s!=null && !"".equals(s)) {
                TravelBean travelBean = travelService.selectByPrimaryKey(Integer.parseInt(s));
                if (s != null) {
                    travelList.add(travelBean);
                }
            }
        }

        int count = travelList.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", travelList.subList(start, travelList.size()<start +SIZE?travelList.size():start+SIZE));

        return "search";
    }

    private String searchAll(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", 0);

        List<OrdersBean> ordersBeans = iOrdersService.selectByPlace(key);
        List<TravelBean> travelList = travelService.selectByPlace(key);
        List<Object> objects = new ArrayList<>();
        objects.addAll(ordersBeans);
        objects.addAll(travelList);
        int count = objects.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", objects.subList(start, objects.size()<start +SIZE?objects.size():start+SIZE));

        return "searchall";
    }

    @RequestMapping("/searchtravelplace")
    public String searchtravelplace(HttpServletRequest request, Map<String, Object> map){
        String place = request.getParameter("place");


        return searchAll(request, map, place);
    }

    @RequestMapping("/mdd")
    public String mdd(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.TWO_INT);

        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(CommonConst.SIX_INT);
        TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
        map.put("travel", travelBean);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        return "mdd";
    }

    private String searchShop(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", CommonConst.FOUR_INT);



        List<OrdersBean> ordersBeans = iOrdersService.selectByPlace(key);

        int count = ordersBeans.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", ordersBeans.subList(start, ordersBeans.size()<start +SIZE?ordersBeans.size():start+SIZE));

        return "searchshop";
    }

    private String searchTravel(HttpServletRequest request, Map<String, Object> map, String key) {
        map.put("index", CommonConst.THREE_INT);
        List<TravelBean> travelList = travelService.selectByPlace(key);

        int count = travelList.size();
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
        if(toPage == 0)
            toPage = 1;
        int start = (toPage - 1) * SIZE;
        map.put("travel", travelList.subList(start, travelList.size()<start +SIZE?travelList.size():start+SIZE));

        return "search";
    }
}
