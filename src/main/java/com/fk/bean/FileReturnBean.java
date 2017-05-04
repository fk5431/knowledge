package com.fk.bean;


import com.fk.util.CommonConst;

import java.util.Date;

public class FileReturnBean extends FileBean {

    private String uname;

    private String ftypename;

    public FileReturnBean(FileBean fileBean) {
        this.setCount(fileBean.getCount());
        this.setUuidname(fileBean.getUuidname());
        this.setTitle(fileBean.getTitle());
        this.setUrlTransforms(fileBean.getUrlTransforms());
        this.setUrl(fileBean.getUrl());
        this.setUrlImage(fileBean.getUrlImage());
        this.setAbstractS(fileBean.getAbstractS());
        this.setCanTransforms(fileBean.getCanTransforms());
        this.setFid(fileBean.getFid());
        this.setFname(fileBean.getFname());
        this.setFtypeid(fileBean.getFtypeid());
        this.setIntroduction(fileBean.getIntroduction());
        this.setUid(fileBean.getUid());
        this.setUploadtime(fileBean.getUploadtime());
        this.setKtypeid(fileBean.getKtypeid());
        StringBuffer sb = new StringBuffer();
        for (String tag : fileBean.getTags().split(CommonConst.SPLITOR)) {
            sb.append(tag + ",");
        }
        this.setTags(sb.toString().substring(0, sb.length() - 1));
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getFtypename() {
        return ftypename;
    }

    public void setFtypename(String ftypename) {
        this.ftypename = ftypename;
    }


}