package com.fk.bean;

/**
 * Created by fengkai on 13/03/17.
 */
public class PromoBean {
    private Integer id;

    private String title1;

    private String title2;

    private String orders;

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
        this.title1 = title1 == null ? null : title1.trim();
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2 == null ? null : title2.trim();
    }

    public String getOrders() {
        return orders;
    }

    public void setOrders(String orders) {
        this.orders = orders == null ? null : orders.trim();
    }
}
