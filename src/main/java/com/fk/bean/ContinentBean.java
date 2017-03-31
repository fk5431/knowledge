package com.fk.bean;

public class ContinentBean {
    private Integer id;

    private String continent;

    private Integer count;

    private String traveid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContinent() {
        return continent;
    }

    public void setContinent(String continent) {
        this.continent = continent == null ? null : continent.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getTraveid() {
        return traveid;
    }

    public void setTraveid(String traveid) {
        this.traveid = traveid;
    }
}