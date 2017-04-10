package com.fk.bean;

public class CloudBean {
    private Integer id;

    private Integer userid;

    private Integer actorid;

    private String actorname;

    private Integer actorstatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getActorid() {
        return actorid;
    }

    public void setActorid(Integer actorid) {
        this.actorid = actorid;
    }

    public String getActorname() {
        return actorname;
    }

    public void setActorname(String actorname) {
        this.actorname = actorname == null ? null : actorname.trim();
    }

    public Integer getActorstatus() {
        return actorstatus;
    }

    public void setActorstatus(Integer actorstatus) {
        this.actorstatus = actorstatus;
    }
}