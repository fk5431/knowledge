package com.fk.bean;

import java.util.Date;

public class PerformerBean {
    private Integer id;

    private String name;

    private String ename;

    private String othername;

    private Date birth;

    private Integer fan;

    private Double boxoffice;

    private String works;

    private String introduce;

    private String birthplace;

    private String nationality;

    private String sex;

    private String constellation;

    private String height;

    private String image;

    private String images;

    private String prizeids;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getOthername() {
        return othername;
    }

    public void setOthername(String othername) {
        this.othername = othername == null ? null : othername.trim();
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getFan() {
        return fan;
    }

    public void setFan(Integer fan) {
        this.fan = fan;
    }

    public Double getBoxoffice() {
        return boxoffice;
    }

    public void setBoxoffice(Double boxoffice) {
        this.boxoffice = boxoffice;
    }

    public String getWorks() {
        return works;
    }

    public void setWorks(String works) {
        this.works = works == null ? null : works.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getBirthplace() {
        return birthplace;
    }

    public void setBirthplace(String birthplace) {
        this.birthplace = birthplace == null ? null : birthplace.trim();
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality == null ? null : nationality.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getConstellation() {
        return constellation;
    }

    public void setConstellation(String constellation) {
        this.constellation = constellation == null ? null : constellation.trim();
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height == null ? null : height.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images == null ? null : images.trim();
    }

    public String getPrizeids() {
        return prizeids;
    }

    public void setPrizeids(String prizeids) {
        this.prizeids = prizeids == null ? null : prizeids.trim();
    }
}