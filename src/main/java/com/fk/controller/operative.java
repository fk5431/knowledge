package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.fk.util.MD5;
import com.google.common.collect.Lists;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by fengkai on 27/03/17.
 */
@Controller
public class operative {

    @Autowired
    IUserService userService;

    @Autowired
    ITravelService travelService;

    @Autowired
    IAuditService auditService;

    @Autowired
    ITypeService typeService;

    @Autowired
    IIndexShowService indexShowService;

    @Autowired
    IIndexshowshopService indexshowshopService;

    @Autowired
    IShopshowService shopshowService;

    @Autowired
    IOrdersService ordersService;

    @Autowired
    IHotelService hotelService;

    @Autowired
    ILineService lineService;

    @Autowired
    IRecordService recordService;

    @Autowired
    IProvinceService provinceService;

    @Autowired
    IContinentService continentService;


    @Autowired
    IPromoService promoService;

    @Autowired
    IUsertravelService usertravelService;

    private static final int SIZE = 10;

    @RequestMapping("/operative")
    public String operative(HttpServletRequest request, Map<String, Object> map){
        int count = userService.count();
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
        int start = (toPage - 1) * SIZE;
        List<User> list = userService.selectByStart(start);
        List<User> user = new ArrayList<>();
        for(User u : list){
            u.setPassword(MD5.decodeMD5(u.getPassword()));
            user.add(u);
        }
        map.put("users", user);
        return "operative/index";
    }


    @RequestMapping("/operative/column")
    public String column(HttpServletRequest request, Map<String, Object> map){

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
        int start = (toPage - 1) * SIZE;
        List<TravelBean> list = travelService.selectByStart(start);
        map.put("travel", list);


        return "/operative/column";
    }

    @RequestMapping("/operative/user")
    public String audit(HttpServletRequest request, Map<String, Object> map){
        try{
            int count = auditService.count();
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
            int start = (toPage - 1) * SIZE;
            List<AuditBean> list = auditService.selectByStart(start);
            map.put("travel", list);
        }catch (Exception e){
            map.put("travel", new ArrayList<AuditBean>());
        }


        return "/operative/audit";
    }

    @RequestMapping("/operative/article")
    public String del(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        travelService.deleteByPrimaryKey(Integer.parseInt(id));
        usertravelService.deleteByTravelKey(Integer.parseInt(id));
        return column(request, map);
    }

    @RequestMapping("/operative/articleuser")
    public String deluser(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        auditService.deleteByPrimaryKey(Integer.parseInt(id));
        usertravelService.deleteByTravelKeyAnd0(Integer.parseInt(id));
        return audit(request, map);
    }
    @RequestMapping("/operative/delshop")
    public String delshop(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        lineService.deleteByForginId(Integer.parseInt(id));
        recordService.deleteByForginId(Integer.parseInt(id));
        ordersService.deleteByPrimaryKey(Integer.parseInt(id));

        return pass(request, map);
    }
    @RequestMapping("/operative/addarticle")
    public String addarticle(HttpServletRequest request, Map<String, Object> map){

        List<TypeBean> typeBeans = typeService.selectAll();
        map.put("type", typeBeans);
        List<String> spe = new ArrayList<>();
        List<ProvinceBean> provinceBeanList = provinceService.selectAll();
        List<ContinentBean> continentBeanList = continentService.selectAll();
        for(ProvinceBean p : provinceBeanList){
            spe.add(p.getProvince());
        }
        for(ContinentBean c : continentBeanList){
            spe.add(c.getContinent());
        }
        map.put("spe", spe);
        return "/operative/book";
    }
    @RequestMapping("/operative/delindex")
    public String delindex(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(Integer.parseInt(id));
        indexShowBean.setMid(-1);
        indexShowService.updateByPrimaryKey(indexShowBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/delindexshop")
    public String delindexshop(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        IndexshowshopBean indexshowshopBean = indexshowshopService.selectByPrimaryKey(Integer.parseInt(id));
        indexshowshopBean.setMid(-1);
        indexshowshopService.updateByPrimaryKey(indexshowshopBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/delshowshop")
    public String delshowshop(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(Integer.parseInt(id));
        shopshowBean.setMid(-1);
        shopshowService.updateByPrimaryKey(shopshowBean);
        return adv(request, map);
    }
    @RequestMapping("/operative/addtoindex")
    public String addtoindex(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FIVE_INT;i++){
            IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(i);
            if(indexShowBean.getMid() == -1){
                indexShowBean.setMid(Integer.parseInt(id));
                indexShowService.updateByPrimaryKey(indexShowBean);
                return adv(request, map);
            }else {
                TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
                if(travelBean == null){
                    indexShowBean.setMid(Integer.parseInt(id));
                    indexShowService.updateByPrimaryKey(indexShowBean);
                    return adv(request, map);
                }
            }
        }
        map.put("errorcode", 8);
        return "error";

    }
    @RequestMapping("/operative/addtoindexshop")
    public String addtoindexshop(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        for(int i=CommonConst.ONE_INT;i<=CommonConst.THREE_INT;i++){
            IndexshowshopBean indexshowshopBean = indexshowshopService.selectByPrimaryKey(i);
            if(indexshowshopBean.getMid() == -1){
                indexshowshopBean.setMid(Integer.parseInt(id));
                indexshowshopService.updateByPrimaryKey(indexshowshopBean);
                return adv(request, map);
            }else {
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(indexshowshopBean.getMid());
                if(ordersBean == null){
                    indexshowshopBean.setMid(Integer.parseInt(id));
                    indexshowshopService.updateByPrimaryKey(indexshowshopBean);
                    return adv(request, map);
                }
            }
        }
        map.put("errorcode", 11);
        return "error";

    }
    @RequestMapping("/operative/addtoshop")
    public String addtoshop(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        for(int i=CommonConst.ONE_INT;i<=CommonConst.THREE_INT;i++){
            ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(i);
            if(shopshowBean.getMid() == -1){
                shopshowBean.setMid(Integer.parseInt(id));
                shopshowService.updateByPrimaryKey(shopshowBean);
                return adv(request, map);
            }else {
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(shopshowBean.getMid());
                if(ordersBean == null){
                    shopshowBean.setMid(Integer.parseInt(id));
                    shopshowService.updateByPrimaryKey(shopshowBean);
                    return adv(request, map);
                }
            }
        }
        map.put("errorcode", 12);
        return "error";

    }
    @RequestMapping("/operative/addtomdd")
    public String addtomdd(HttpServletRequest request, Map<String, Object> map){

        String id = request.getParameter("id");
        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(CommonConst.SIX_INT);

        if(indexShowBean.getMid() == -1 ){
            indexShowBean.setMid(Integer.parseInt(id));
            indexShowService.updateByPrimaryKey(indexShowBean);
            return adv(request, map);
        }else {
            TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
            if(travelBean == null){
                indexShowBean.setMid(Integer.parseInt(id));
                indexShowService.updateByPrimaryKey(indexShowBean);
                return adv(request, map);
            }
        }

        map.put("errorcode", 9);
        return "error";
    }

    @RequestMapping("/operative/adv")
    public String adv(HttpServletRequest request, Map<String, Object> map){

        List<TravelBean> list = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.FIVE_INT;i++){
            IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(i);
            if(indexShowBean != null && indexShowBean.getMid() != -1){
                TravelBean travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
                if(travelBean != null) {
                    list.add(travelBean);
                }
            }
        }
        map.put("indexshow", list);

        IndexShowBean indexShowBean = indexShowService.selectByPrimaryKey(CommonConst.SIX_INT);
        TravelBean travelBean = new TravelBean();
        if(indexShowBean.getMid() != -1){
            travelBean = travelService.selectByPrimaryKey(indexShowBean.getMid());
        }
        map.put("banner", travelBean);

        //热卖爆款
        List<OrdersBean> listorders = new ArrayList<>();
        for(int i=CommonConst.ONE_INT;i<=CommonConst.THREE_INT;i++){
            IndexshowshopBean indexshowshopBean  = indexshowshopService.selectByPrimaryKey(i);
            if(indexshowshopBean != null  && indexshowshopBean.getMid() != -1){
                 OrdersBean ordersBean = ordersService.selectByPrimaryKey(indexshowshopBean.getMid());
                if(ordersBean != null){
                    listorders.add(ordersBean);
                }
            }
        }
        map.put("orders", listorders);

        List<OrdersBean> ordersBeans = new ArrayList<>();
        for(int i=0;i<CommonConst.FOUR_INT;i++){
            ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(i);
            if(shopshowBean != null  && shopshowBean.getMid() != -1){
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(shopshowBean.getMid());
                if(ordersBean != null){
                    ordersBeans.add(ordersBean);
                }
            }
        }
        map.put("shopshow", ordersBeans);
        return "/operative/adv";
    }

    @RequestMapping("/operative/addart")
    public String addart(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){
        try{

            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String type = request.getParameter("type");
            String area = request.getParameter("area");
            String line = request.getParameter("line");
            String summary = request.getParameter("summary");
            String content = request.getParameter("content");
            String spe = request.getParameter("spe");

            String filename = file.getOriginalFilename();
            String img ;
            if("".equals(filename)){
                img = "";
            }else{
                String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
                filename = String.valueOf(System.currentTimeMillis()) + filename;
                path = path + "images";
                File upload = new File(path, filename);
                try {
                    FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                img = "/travel/images/"+filename;
            }

            TravelBean travelBean = new TravelBean();
            travelBean.setTitle(title);
            travelBean.setCount(0);
            travelBean.setImage(img);
            travelBean.setType(type);
            travelBean.setAuthor(author);
            travelBean.setContext(content);
            travelBean.setLine(line);
            travelBean.setLookcount(0);
            travelBean.setTime(new Date());
            travelBean.setPlace(area);
            travelBean.setSummary(summary);

            travelService.insertSelective(travelBean);
            int travelId = travelBean.getId();
            TypeBean typeBean = typeService.selectByPrimaryKey(Integer.parseInt(type));
            typeBean.setCount(typeBean.getCount()==null?0:typeBean.getCount() + CommonConst.ONE_INT);
            typeService.updateByPrimaryKey(typeBean);
            //TODO spe
            ProvinceBean provinceBean = provinceService.selectByname(spe);
            ContinentBean continentBean = continentService.selectByName(spe);
            if(provinceBean != null){
                provinceBean.setCount(provinceBean.getCount() + CommonConst.ONE_INT);
                String str = provinceBean.getTravelid();
                if(str == null || "".equals(str)){
                    provinceBean.setTravelid(String.valueOf(travelId));
                }else{
                    provinceBean.setTravelid(provinceBean.getTravelid() + CommonConst.SPLITOR + String.valueOf(travelId));
                }
                provinceService.updateByPrimaryKey(provinceBean);
            }else if(continentBean != null){
                continentBean.setCount(continentBean.getCount() + CommonConst.ONE_INT);
                String str = continentBean.getTraveid();
                if(str == null || "".equals(str)){
                    continentBean.setTraveid(String.valueOf(travelId));
                }else {
                    continentBean.setTraveid(continentBean.getTraveid() + CommonConst.SPLITOR + String.valueOf(travelId));
                }
                continentService.updateByPrimaryKey(continentBean);
            }

            return addarticle(request, map);
        }catch (Exception e){
            e.printStackTrace();
            map.put("errorcode", 10);
            return "error";
        }
    }



    @RequestMapping("/operative/agree")
    public String agree(HttpServletRequest request, Map<String, Object> map){

        int travelId = Integer.parseInt(request.getParameter("id"));
        AuditBean auditBean = auditService.selectByPrimaryKey(travelId);
        auditService.deleteByPrimaryKey(travelId);
        TravelBean travelBean = new TravelBean();
        travelBean.setTitle(auditBean.getTitle());
        travelBean.setCount(0);
        travelBean.setImage(auditBean.getImage());
        travelBean.setType(auditBean.getType());
        travelBean.setAuthor(auditBean.getAuthor());
        travelBean.setContext(auditBean.getContext());
        travelBean.setLine(auditBean.getLine());
        travelBean.setLookcount(0);
        travelBean.setTime(new Date());
        travelBean.setPlace(auditBean.getPlace());
        travelBean.setSummary(auditBean.getSummary());
        travelService.insertSelective(travelBean);

        UsertravelBean usertravelBean = usertravelService.selectByTravelId(auditBean.getId());
        usertravelBean.setStatus(1);
        usertravelBean.setTravelid(travelBean.getId());
        usertravelService.updateByPrimaryKey(usertravelBean);

        TypeBean typeBean = typeService.selectByPrimaryKey(Integer.parseInt(auditBean.getType()));
        typeBean.setCount(typeBean.getCount()==null?0:typeBean.getCount() + CommonConst.ONE_INT);
        typeService.updateByPrimaryKey(typeBean);
        String spe = auditBean.getSmallimage();
        ProvinceBean provinceBean = provinceService.selectByname(spe);
        ContinentBean continentBean = continentService.selectByName(spe);
        if(provinceBean != null){
            provinceBean.setCount(provinceBean.getCount() + CommonConst.ONE_INT);
            String str = provinceBean.getTravelid();
            if(str == null || "".equals(str)){
                provinceBean.setTravelid(String.valueOf(travelId));
            }else{
                provinceBean.setTravelid(provinceBean.getTravelid() + CommonConst.SPLITOR + String.valueOf(travelId));
            }
            provinceService.updateByPrimaryKey(provinceBean);
        }else if(continentBean != null){
            continentBean.setCount(continentBean.getCount() + CommonConst.ONE_INT);
            String str = continentBean.getTraveid();
            if(str == null || "".equals(str)){
                continentBean.setTraveid(String.valueOf(travelId));
            }else {
                continentBean.setTraveid(continentBean.getTraveid() + CommonConst.SPLITOR + String.valueOf(travelId));
            }
            continentService.updateByPrimaryKey(continentBean);
        }



        return column(request, map);
    }

    @RequestMapping("/operative/pass")
    public String pass(HttpServletRequest request, Map<String, Object> map){
        int count = ordersService.count();
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
        int start = (toPage - 1) * SIZE;
        List<OrdersBean> list = ordersService.selectByStart(start);
        map.put("order", list);


        return "/operative/pass";
    }
    @RequestMapping("/operative/page")
    public String page(HttpServletRequest request, Map<String , Object> map) {
        List<HotelBean> hotelBeans = hotelService.selectAll();
        map.put("hotels", hotelBeans);

        List<LineBean> lineBeans = lineService.selectByForginId(-1);
        map.put("line", lineBeans);

        return "/operative/page";
    }
    @RequestMapping("/operative/line")
    public String line(HttpServletRequest request, Map<String , Object> map) {
        return "/operative/line";
    }
    @RequestMapping("/operative/addline")
    public String addline(HttpServletRequest request, Map<String , Object> map) {
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        String hotel = request.getParameter("hotel");
        String meal = request.getParameter("meal");
        LineBean lineBean = new LineBean();
        lineBean.setTitle(title);
        lineBean.setSummary(summary);
        lineBean.setHotle(hotel);
        lineBean.setMeal(meal);
        lineBean.setOrderid(-1);
        lineService.insertSelective(lineBean);

        return "/operative/line";
    }
    @RequestMapping("/operative/addshop")
    public String addshop(HttpServletRequest request, @RequestParam("image") MultipartFile file, Map<String, Object> map){
        try{
            String title = request.getParameter("title");
            String cost = request.getParameter("cost");
            String type = request.getParameter("type");
            String subject = request.getParameter("subject");
            int price = Integer.parseInt(request.getParameter("price"));
            String[] hotelId = request.getParameterValues("hotel");
            String[] lineId = request.getParameterValues("line");
            String place = request.getParameter("place");
            String content = request.getParameter("content");

            String filename = file.getOriginalFilename();
            String img ;
            if("".equals(filename)){
                img = "";
            }else{
                String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
                filename = String.valueOf(System.currentTimeMillis()) + filename;
                path = path + "images/sales";
                File upload = new File(path, filename);
                try {
                    FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                img = "/travel/images/sales/"+filename;
            }

            OrdersBean ordersBean = new OrdersBean();
            ordersBean.setCost(cost);
            ordersBean.setPlace(place);
            ordersBean.setTitle(title);
            ordersBean.setImage(img);
            ordersBean.setCount(0);
            StringBuffer sb = new StringBuffer();
            boolean flag = true;
            if(hotelId != null) {
                for (String h : hotelId) {
                    if (flag != true) {
                        sb.append(CommonConst.SPLITOR);
                    }
                    sb.append(h);
                    flag = false;
                }
                ordersBean.setHotel(sb.toString());
            }else {
                ordersBean.setHotel("");
            }

            String reg = ":8080.*?\"";
            Pattern pattern = Pattern.compile(reg);
            if(content == null)
                content = "";
            Matcher matcher =  pattern.matcher(content);
            StringBuffer sbcontent = new StringBuffer();
            Boolean b = false;
            while(matcher.find()){
                String g = matcher.group();
                if(b == false) {
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                    b = true;
                }else{
                    sbcontent.append(CommonConst.SPLITOR);
                    sbcontent.append(g.substring(CommonConst.FIVE_INT, g.length() - CommonConst.ONE_INT));
                }
            }
            ordersBean.setImages(sbcontent.toString());
            ordersBean.setPrice(price);
            ordersBean.setSellcount(0);
            ordersBean.setSubject(subject);
            ordersBean.setType(type);
            ordersService.insertSelective(ordersBean);
            for(String l : lineId){
                LineBean lineBean = lineService.selectByPrimaryKey(Integer.parseInt(l));
                lineBean.setOrderid(ordersBean.getId());
                lineService.updateByPrimaryKey(lineBean);
            }
            return page(request, map);
        }catch (Exception e){
            e.printStackTrace();
            map.put("errorcode", 10);
            return "error";
        }
    }

    @RequestMapping("/operative/der")
    public String der(HttpServletRequest request, Map<String, Object> map){
        int count = lineService.count();
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
        int start = (toPage - 1) * SIZE;
        List<LineBean> list = lineService.selectByStart(start);
        List<ReturnLineAndOrders> returnLineAndOrderss = new ArrayList<>();
        for(LineBean l : list){
            ReturnLineAndOrders returnLineAndOrders = new ReturnLineAndOrders();
            returnLineAndOrders.setLineId(l.getId());
            returnLineAndOrders.setLinesummary(l.getSummary());
            returnLineAndOrders.setLineTitle(l.getTitle());
            int orderid = l.getOrderid();
            OrdersBean ordersBean = ordersService.selectByPrimaryKey(orderid);
            if(ordersBean == null){
                returnLineAndOrders.setOrderId(-1);
                returnLineAndOrders.setOrderTitle("该旅游已经被删除");
            }else {
                returnLineAndOrders.setOrderId(ordersBean.getId());
                returnLineAndOrders.setOrderTitle(ordersBean.getTitle());
            }
            returnLineAndOrderss.add(returnLineAndOrders);
        }
        map.put("list", returnLineAndOrderss);
        return "/operative/der";
    }

    @RequestMapping("/operative/delline")
    public String delline(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");

        lineService.deleteByPrimaryKey(Integer.parseInt(id));

        return der(request, map);
    }


    @RequestMapping("/operative/per")
    public String per(HttpServletRequest request, Map<String, Object> map){
        int count = hotelService.count();
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
        int start = (toPage - 1) * SIZE;
        List<HotelBean> list = hotelService.selectByStart(start);

        map.put("list", list);
        return "/operative/per";
    }

    @RequestMapping("/operative/delhotle")
    public String delhotle(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");

        hotelService.deleteByPrimaryKey(Integer.parseInt(id));

        return per(request, map);
    }
    @RequestMapping("/operative/type")
    public String type(HttpServletRequest request, Map<String, Object> map){

        return "/operative/type";
    }

    @RequestMapping("/operative/addhotel")
    public String addhotel(HttpServletRequest request, @RequestParam("image") MultipartFile file,Map<String, Object> map){
        String title = request.getParameter("title");
        String etitle = request.getParameter("etitle");
        int star = Integer.parseInt(request.getParameter("star"));
        String score = request.getParameter("score");
        String adress = request.getParameter("adress");
        String summary = request.getParameter("summary");
        String filename = file.getOriginalFilename();
        String img ;
        if("".equals(filename)){
            img = "";
        }else{
            String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
            filename = String.valueOf(System.currentTimeMillis()) + filename;
            path = path + "images/hotel";
            File upload = new File(path, filename);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), upload);
            } catch (IOException e) {
                e.printStackTrace();
            }
            img = "/travel/images/hotel/"+filename;
        }
        HotelBean hotelBean = new HotelBean();
        hotelBean.setTitle(title);
        hotelBean.setEtitle(etitle);
        hotelBean.setStar(star);
        hotelBean.setAdress(adress);
        hotelBean.setSummary(summary);
        hotelBean.setImg(img);
        hotelBean.setScore(score);

        hotelService.insertSelective(hotelBean);

        return type(request, map);
    }

    @RequestMapping("/operative/promo")
    public String promo(HttpServletRequest request, Map<String, Object> map){
        List<PromoBean> list = promoService.selectAll();
        List<PromoReturnBean> returnBeans = new ArrayList<>();
        for (PromoBean p :list){
           // System.out.println();
            PromoReturnBean promoReturnBean = new PromoReturnBean();
            promoReturnBean.setId(p.getId());
            promoReturnBean.setTitle1(p.getTitle1());
            promoReturnBean.setTitle2(p.getTitle2());
            String orId = p.getOrders();
            List<OrdersBean> listorder = new ArrayList<>();
            if(orId != null || !"".equals(orId)) {
                String[] ordersId = orId.split(CommonConst.SPLITOR);
                for(String str : ordersId){
                    OrdersBean o = ordersService.selectByPrimaryKey(Integer.parseInt(str));
                    if(o!=null)
                        listorder.add(o);
                }
            }
            promoReturnBean.setOrders(listorder);
            returnBeans.add(promoReturnBean);
        }
        map.put("promo", returnBeans);

        return  "/operative/promo";
    }

    @RequestMapping("/operative/delpromo")
    public String delpromo(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        promoService.deleteByPrimaryKey(Integer.parseInt(id));

        return  promo(request, map);
    }

    @RequestMapping("/operative/addpromoshow")
    public String addpromoshow(HttpServletRequest request, Map<String, Object> map){

        return  "/operative/addpromo";
    }

    @RequestMapping("/operative/addpromo")
    public String addpromo(HttpServletRequest request, Map<String, Object> map){
        String title1 = request.getParameter("title1");
        String title2 = request.getParameter("title2");
        String[] orders = request.getParameter("orders").split(",");
        PromoBean promoBean = new PromoBean();
        promoBean.setTitle1(title1);
        promoBean.setTitle2(title2);
        StringBuffer sb = new StringBuffer();
        boolean flag = true;
        for(String order : orders){
            if(flag == false){
                sb.append(CommonConst.SPLITOR);
            }
            sb.append(order);
            flag = false;
        }
        promoBean.setOrders(sb.toString());
        promoService.insertSelective(promoBean);
        return addpromoshow(request, map);
    }
    @RequestMapping("/operative/login")
    public String login(HttpServletRequest request, Map<String, Object> map){

        return "/operative/login";
    }
    @RequestMapping("/operative/log")
    public String log(HttpServletRequest request, Map<String, Object> map){
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if(CommonConst.OUSERNAME.equals(name) && CommonConst.OPASS.equals(password)){
            return "/operative/index";
        }else {
            map.put("errorcode", 3);
            return "error";
        }

    }
    @RequestMapping("/operative/delorder")
    public String delorder(HttpServletRequest request, Map<String, Object> map){
       String id = request.getParameter("id");

       recordService.deleteByPrimaryKey(Integer.parseInt(id));
       return manshop(request, map);
    }
    @RequestMapping("/operative/manshop")
    public String manshop(HttpServletRequest request, Map<String, Object> map){
        try{
            int count = recordService.count();
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
            int start = (toPage - 1) * SIZE;
            List<RecordBean> list = recordService.selectByStart(start);
            List<String> title = Lists.newArrayList();
            map.put("record", list);
            for(RecordBean r : list){
                int orders = r.getOrderid();
                String t = ordersService.selectByPrimaryKey(orders).getTitle();
                title.add(t);
            }
            map.put("title", title);
            return "operative/opeshop";
        }catch (Exception e){
            map.put("count", 0);
            map.put("size", SIZE);
            map.put("page", 1);
            map.put("pageNow", 1);
            map.put("record", Lists.newArrayList());
            map.put("record", Lists.newArrayList());
            return "operative/opeshop";
        }
    }
}