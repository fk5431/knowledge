package com.fk.bean;

import java.util.Date;

public class MovieBean {
    private Integer id;

    private String title;

    private Date movietime;

    private String venue;

    private String screenings;

    private Date tickettime;

    private Integer price;

    private String artist;

    private String duration;

    private Integer type;

    private String introduce;

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

    public Date getMovietime() {
        return movietime;
    }

    public void setMovietime(Date movietime) {
        this.movietime = movietime;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue == null ? null : venue.trim();
    }

    public String getScreenings() {
        return screenings;
    }

    public void setScreenings(String screenings) {
        this.screenings = screenings == null ? null : screenings.trim();
    }

    public Date getTickettime() {
        return tickettime;
    }

    public void setTickettime(Date tickettime) {
        this.tickettime = tickettime;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist == null ? null : artist.trim();
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration == null ? null : duration.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }
}