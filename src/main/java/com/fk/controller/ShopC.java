package com.fk.controller;

import com.fk.bean.*;
import com.fk.service.*;
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
//                        listorder.add(o);
//                        listorder.add(o);
//                        listorder.add(o);
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


}
