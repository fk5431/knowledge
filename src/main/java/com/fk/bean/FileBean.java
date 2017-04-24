package com.fk.bean;

import java.util.Date;

public class FileBean {
    private Integer fid;

    private Integer uid;

    private String fname;

    private String uuidname;

    private String title;

    private String tags;

    private Integer ftypeid;

    private Date uploadtime;

    private String abstractS;

    private String url;

    private String urlImage;

    private Integer ktypeid;

    private String urlTransforms;

    private String introduction;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

    public String getUuidname() {
        return uuidname;
    }

    public void setUuidname(String uuidname) {
        this.uuidname = uuidname == null ? null : uuidname.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags == null ? null : tags.trim();
    }

    public Integer getFtypeid() {
        return ftypeid;
    }

    public void setFtypeid(Integer ftypeid) {
        this.ftypeid = ftypeid;
    }

    public Date getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getAbstractS() {
        return abstractS;
    }

    public void setAbstractS(String abstractS) {
        this.abstractS = abstractS == null ? null : abstractS.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage == null ? null : urlImage.trim();
    }

    public Integer getKtypeid() {
        return ktypeid;
    }

    public void setKtypeid(Integer ktypeid) {
        this.ktypeid = ktypeid;
    }

    public String getUrlTransforms() {
        return urlTransforms;
    }

    public void setUrlTransforms(String urlTransforms) {
        this.urlTransforms = urlTransforms == null ? null : urlTransforms.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }
}