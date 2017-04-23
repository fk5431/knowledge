package com.fk.elasticsearch;

public class File {
	private Integer fid;
	private Integer uid;
	private String title;
	private String tags;
	private String abstracString;
	private String introducting;
	private String extract;
	public File(){
	}
	public File(Integer fid,Integer uid, String title,String tags,String abstracString, String introducting,String extract){
		this.fid = fid;
		this.uid = uid;
		this.title = title;
		this.tags = tags;
		this.abstracString = abstracString;
		this.introducting = introducting;
		this.extract = extract;
	}
	public File(Integer fid, String title) {
		this.fid = fid;
		this.title = title;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getIntroducting() {
		return introducting;
	}
	public void setIntroducting(String introducting) {
		this.introducting = introducting;
	}
	public String getExtract() {
		return extract;
	}
	public void setExtract(String extract) {
		this.extract = extract;
	}
}
