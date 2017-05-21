package com.fk.bean;

import com.fk.util.CommonConst;

/**
 * Created by FK on 2017/5/21.
 */
public class ESFileBean extends FileBean{
    private String other;
    public ESFileBean(FileBean fileBean) {
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

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }
}
