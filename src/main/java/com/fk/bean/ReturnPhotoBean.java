package com.fk.bean;

/**
 * Created by fengkai on 22/03/17.
 */
public class ReturnPhotoBean {

    private Integer id;

    private String title;

    private String image1;

    private String image2;

    private String image3;

    private Integer count;
    private Integer lookcount;

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
        this.title = title;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getLookcount() {
        return lookcount;
    }

    public void setLookcount(Integer lookcount) {
        this.lookcount = lookcount;
    }
}
