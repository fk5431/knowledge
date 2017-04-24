package com.fk.bean;

public class KtypeBean {
    private Integer ktypeid;

    private String ktype;

    private Integer count;

    public Integer getKtypeid() {
        return ktypeid;
    }

    public void setKtypeid(Integer ktypeid) {
        this.ktypeid = ktypeid;
    }

    public String getKtype() {
        return ktype;
    }

    public void setKtype(String ktype) {
        this.ktype = ktype == null ? null : ktype.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}