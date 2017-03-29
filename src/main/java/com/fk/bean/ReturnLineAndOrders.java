package com.fk.bean;

/**
 * Created by fengkai on 29/03/17.
 */
public class ReturnLineAndOrders {

    private int lineId;

    private int orderId;

    private String lineTitle;

    private String linesummary;

    private String orderTitle;

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getLineTitle() {
        return lineTitle;
    }

    public void setLineTitle(String lineTitle) {
        this.lineTitle = lineTitle;
    }

    public String getLinesummary() {
        return linesummary;
    }

    public void setLinesummary(String linesummary) {
        this.linesummary = linesummary;
    }

    public String getOrderTitle() {
        return orderTitle;
    }

    public void setOrderTitle(String orderTitle) {
        this.orderTitle = orderTitle;
    }
}
