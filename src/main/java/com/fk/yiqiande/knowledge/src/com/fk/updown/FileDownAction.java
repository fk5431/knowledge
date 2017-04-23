package com.fk.updown;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownAction extends ActionSupport{
	private InputStream fileInputStream;
	private String filename;
	private String url;
	private String uuidname;
    public String getUuidname() {
		return uuidname;
	}
	public void setUuidname(String uuidname) {
		this.uuidname = uuidname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public InputStream getFileInputStream() {
		return fileInputStream;
	}
	public void setFileInputStream(InputStream fileInputStream) {
		this.fileInputStream = fileInputStream;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		try {
			filename = new String(filename.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		this.filename = filename;
	}
	@Override  
    public String execute() throws Exception {  
        File file = new File(url+"/"+uuidname);
//        System.out.println(file.getAbsolutePath());
      //  System.out.println(filename);
        try {
			fileInputStream = new FileInputStream(file);
		} catch (Exception e) {
			return ERROR;
		}
		return SUCCESS;  
    }  
}
