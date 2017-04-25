package com.fk.bean;

public class KtypeBean {
    private Integer ktypeid;

    private String ktype;

    private String ktypeurl;

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

    public String getKtypeurl() {
        return ktypeurl;
    }

    public void setKtypeurl(String ktypeurl) {
        this.ktypeurl = ktypeurl == null ? null : ktypeurl.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}