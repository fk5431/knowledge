package com.fk.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MovieBean {
    private Integer id;

    private String title;

    private String etitle;

    private String type;

    private String area;

    private String time;

    private Date showtime;

    private Integer lookcount;

    private Double score;

    private Integer boxoffice;

    private Integer directorid;

    private String performerids;

    private String prizeids;

    private String image;

    private String introduce;

    private String atlas;

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getAtlas() {
        return atlas;
    }

    public void setAtlas(String atlas) {
        this.atlas = atlas == null ? null : atlas.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getEtitle() {
        return etitle;
    }

    public void setEtitle(String etitle) {
        this.etitle = etitle == null ? null : etitle.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getShowtime() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(showtime);
    }

    public void setShowtime(Date showtime) {
        this.showtime = showtime;
    }

    public Integer getLookcount() {
        return lookcount;
    }

    public void setLookcount(Integer lookcount) {
        this.lookcount = lookcount;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getBoxoffice() {
        return boxoffice;
    }

    public void setBoxoffice(Integer boxoffice) {
        this.boxoffice = boxoffice;
    }

    public Integer getDirectorid() {
        return directorid;
    }

    public void setDirectorid(Integer directorid) {
        this.directorid = directorid;
    }

    public String getPerformerids() {
        return performerids;
    }

    public void setPerformerids(String performerids) {
        this.performerids = performerids == null ? null : performerids.trim();
    }

    public String getPrizeids() {
        return prizeids;
    }

    public void setPrizeids(String prizeids) {
        this.prizeids = prizeids == null ? null : prizeids.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }
}