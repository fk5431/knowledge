package com.fk.bean.user;

public class User {
	private int uid;
	private String uname;
	private String pwd;
	private int ismanage;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getIsmanage() {
		return ismanage;
	}
	public void setIsmanage(int ismanage) {
		this.ismanage = ismanage;
	}
	public User(){}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
