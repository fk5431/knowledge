package com.fk.bean;

public class ProvinceBean {
    private Integer id;

    private String provinceid;

    private String province;

    private Integer count;

    private String travelid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProvinceid() {
        return provinceid;
    }

    public void setProvinceid(String provinceid) {
        this.provinceid = provinceid == null ? null : provinceid.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getTravelid() {
        return travelid;
    }

    public void setTravelid(String travelid) {
        this.travelid = travelid;
    }
}


