package com.fk.bean;

public class FtypeBean {
    private Integer ftypeid;

    private String ftypename;

    private String ftype;

    public Integer getFtypeid() {
        return ftypeid;
    }

    public void setFtypeid(Integer ftypeid) {
        this.ftypeid = ftypeid;
    }

    public String getFtypename() {
        return ftypename;
    }

    public void setFtypename(String ftypename) {
        this.ftypename = ftypename == null ? null : ftypename.trim();
    }

    public String getFtype() {
        return ftype;
    }

    public void setFtype(String ftype) {
        this.ftype = ftype == null ? null : ftype.trim();
    }
}