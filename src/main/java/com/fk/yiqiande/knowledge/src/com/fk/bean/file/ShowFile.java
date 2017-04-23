package com.fk.bean.file;

import java.sql.Timestamp;

public class ShowFile {
	private int fid;
	private String ftypeid;
	private String ktypeid;
	private String uname;
	private String title;
	private String url;
	private Timestamp uploadtime;
	private String tags;
	private String abstracString;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFtypeid() {
		return ftypeid;
	}
	public void setFtypeid(String ftypeid) {
		this.ftypeid = ftypeid;
	}
	public String getKtypeid() {
		return ktypeid;
	}
	public void setKtypeid(String ktypeid) {
		this.ktypeid = ktypeid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
