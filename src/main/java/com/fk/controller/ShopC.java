package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
import com.fk.util.CommonConst;
import com.fk.util.Login;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by fengkai on 06/03/17.
 */
@Controller
public class ShopC {

    private Logger logger = LoggerFactory.getLogger(ShopC.class);

    @Autowired
    public ITravelService travelService;

    @Autowired
    public IProvinceService provinceService;

    @Autowired
    public IContinentService continentService;

    @Autowired
    public ITypeService typeService;

    @Autowired
    public IRecordService recordService;

    @Autowired
    public IOrdersService ordersService;

    @Autowired
    public IHotelService hotelService;

    @Autowired
    public ILineService lineService;

    @Autowired
    public IPromoService promoService;

    @Autowired
    public IShopshowService shopshowService;

    @Autowired
    public IUserService userService;

    private static final int SIZE = CommonConst.SIX_INT;

    @RequestMapping("/shop")
    public String shop(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.FOUR_INT);

        String id = request.getParameter("id");
        if(id == null || "".equals(id)){
            id = "1";
        }

        OrdersBean ordersBean = updateCost(ordersService.selectByPrimaryKey(Integer.parseInt(id)));
        map.put("order", ordersBean);
        map.put("images", ordersBean.getImages().split(CommonConst.SPLITOR));
        List<HotelBean> hotelBeans = getHotels(ordersBean.getHotel());
        map.put("hotels", hotelBeans);
        List<LineBean> lines = lineService.selectByForginId(Integer.parseInt(id));
        map.put("lines", lines);
        List<RecordBean> recordBean = recordService.selectByForginId(Integer.parseInt(id));
        map.put("record", recordBean);

        ordersBean.setCount(ordersBean.getCount() + CommonConst.ONE_INT);
        ordersService.updateByPrimaryKey(ordersBean);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        return "shop";
    }

    @RequestMapping("/sales")
    public String sales(HttpServletRequest request, Map<String, Object> map){
        map.put("index", CommonConst.FOUR_INT);
        // 大模块
        List<PromoBean> list = promoService.selectAll();
        List<PromoReturnBean> returnBeans = new ArrayList<>();
        for (PromoBean p :list){
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
                    if(o!=null){
                        listorder.add(o);
                    }
                }
            }
            promoReturnBean.setOrders(listorder);
            returnBeans.add(promoReturnBean);
        }
        map.put("promo", returnBeans);


        List<OrdersBean> ordersBeans = new ArrayList<>();
        for(int i=0;i<CommonConst.FOUR_INT;i++){
            ShopshowBean shopshowBean = shopshowService.selectByPrimaryKey(i);
            if(shopshowBean != null  && shopshowBean.getMid() != -1){
                OrdersBean ordersBean = ordersService.selectByPrimaryKey(shopshowBean.getMid());
                if(ordersBean != null)
                    ordersBeans.add(ordersBean);
            }
        }
        map.put("shopshow", ordersBeans);
        if(Login.islogin(request)){
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }
        return "sales";
    }

    @RequestMapping("count_shop")
    public String addCount(HttpServletRequest request, Map<String, Object> map){
        String id = request.getParameter("id");
        if(id!=null) {
            OrdersBean ordersBean = ordersService.selectByPrimaryKey(Integer.parseInt(id));
            ordersBean.setCount(ordersBean.getCount() + CommonConst.ONE_INT);
            ordersService.updateByPrimaryKey(ordersBean);
        }
        return shop(request, map);
    }

    private List<HotelBean> getHotels(String hotel) {
        List<HotelBean> list = new ArrayList<>();
        String[] strs = hotel.split(CommonConst.SPLITOR);
        for(String str : strs){
            HotelBean hotelBean = hotelService.selectByPrimaryKey(Integer.parseInt(str));
            if(hotelBean != null){
                list.add(hotelBean);
            }
        }
        return list;
    }

    private OrdersBean updateCost(OrdersBean ordersBean) {
        String cost = ordersBean.getCost();
        cost = cost.replace("\n","<br>");
        ordersBean.setCost(cost);
        logger.debug("=============================================== cost{[]}", cost);
        return ordersBean;
    }


    @RequestMapping("/buy")
    public String buy(HttpServletRequest request, Map<String, Object> map){

        if(!Login.islogin(request)){
            return "login";
        }else{
            map.put(CommonConst.LOGIN, CommonConst.YES);
        }

        map.put("index", 0);
        String id = request.getParameter("id");
        OrdersBean ordersBean = updateCost(ordersService.selectByPrimaryKey(Integer.parseInt(id)));
        map.put("order", ordersBean);

        return "buy";
    }


    @RequestMapping("/salesagreement")
    public String salesagreement(HttpServletRequest request, Map<String, Object> map){
        map.put("index", 0);

        return "salesagreement";
    }
    @RequestMapping("/buyshop")
    public String order(HttpServletRequest request, Map<String, Object> map){
        try {
            map.put("index", 0);
            String adress = request.getParameter("adress");
            Preconditions.checkNotNull(adress, "address not null");
            String name = request.getParameter("name");
            Preconditions.checkNotNull(name, "name not null");
            String email = request.getParameter("email");
            String wechat = request.getParameter("wechat");
            String mob = request.getParameter("mob");
            Preconditions.checkNotNull(mob, "mob not null");
            String other = request.getParameter("other");
            String id = request.getParameter("id");
            String userId = "";
            Cookie[] cookies = request.getCookies();
            for(Cookie c : cookies){
                if(CommonConst.USERID.equals(c.getName())){
                     userId = c.getValue();
                }
            }
            RecordBean recordBean = new RecordBean();
            User user = userService.selectUserByID(Integer.parseInt(userId));
            OrdersBean ordersBean = ordersService.selectByPrimaryKey(Integer.parseInt(id));
            recordBean.setAdress(adress);
            recordBean.setEmail(Objects.firstNonNull(email, ""));
            recordBean.setMob(mob);
            recordBean.setName(name);
            recordBean.setNum(1);
            recordBean.setOrderid(ordersBean.getId());
            recordBean.setOther(Objects.firstNonNull(other,""));
            recordBean.setPrice(String.valueOf(ordersBean.getPrice()));
            recordBean.setTime(new Date(System.currentTimeMillis()));
            recordBean.setType(ordersBean.getType());
            recordBean.setUserid(user.getId());
            recordBean.setWechat(Objects.firstNonNull(wechat, ""));

            recordService.insertSelective(recordBean);
        } catch (Exception e){
            map.put("errorcode", 10);
            e.printStackTrace();
        }

        return sales(request, map);
    }
}
