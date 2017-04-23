package com.fk.bean.file;

import java.sql.Timestamp;

public class UploadFile {
	private int fid;
	private short ftypeid;
	private int ktypeid;
	private int uid;
	private String title;
	private String fname;
	private String uuidname;
	private String introduction;
	private String url;
	private String url_image;
	private String url_transforms;
	private Timestamp uploadtime;
	private String tags;
	private String abstracString;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public short getFtypeid() {
		return ftypeid;
	}
	public void setFtypeid(short ftypeid) {
		this.ftypeid = ftypeid;
	}
	public int getKtypeid() {
		return ktypeid;
	}
	public void setKtypeid(int ktypeid) {
		this.ktypeid = ktypeid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getUuidname() {
		return uuidname;
	}
	public void setUuidname(String uuidname) {
		this.uuidname = uuidname;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrl_image() {
		return url_image;
	}
	public void setUrl_image(String url_image) {
		this.url_image = url_image;
	}
	public String getUrl_transforms() {
		return url_transforms;
	}
	public void setUrl_transforms(String url_transforms) {
		this.url_transforms = url_transforms;
	}
	public Timestamp getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Timestamp uploadtime) {
		this.uploadtime = uploadtime;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getAbstracString() {
		return abstracString;
	}
	public void setAbstracString(String abstracString) {
		this.abstracString = abstracString;
	}
}
