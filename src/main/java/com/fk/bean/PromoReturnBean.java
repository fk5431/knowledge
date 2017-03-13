package com.fk.bean;

import java.util.List;

/**
 * Created by fengkai on 13/03/17.
 */
public class PromoReturnBean {

    private Integer id;

    private String title1;

    private String title2;

    private List<OrdersBean> orders;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public List<OrdersBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrdersBean> orders) {
        this.orders = orders;
    }
}
