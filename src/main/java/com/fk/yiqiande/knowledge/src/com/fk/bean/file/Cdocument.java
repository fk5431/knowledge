package com.fk.bean.file;

public class Cdocument {
	private int uid;
	private int fid;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	@Override
	public String toString() {
		return uid+","+fid+","+"1";
	}
	
}
