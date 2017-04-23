package com.fk.other;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.user.User;
import com.fk.dao.other.Operate;
import com.opensymphony.xwork2.ActionSupport;

public class Preview  extends ActionSupport implements
ServletRequestAware{
	private HttpServletRequest request;
	private int typeerror;
	private String url_transforms;
	private int typeid;
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getUrl_transforms() {
		return url_transforms;
	}
	public void setUrl_transforms(String url_transforms) {
		this.url_transforms = url_transforms;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public String execute() throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			this.setTypeerror(20);
			return "USERERROR";
		}
		if(url_transforms == null || url_transforms.equals("")){
			this.setTypeerror(200);
			return "TYPEERROR";
		}
		if(typeid == 1){
			this.setTypeerror(200);
			return "TYPEERROR";
		}
		if(typeid == 2){
			return "music";
		}
		if(typeid == 3){
			return "video";
		}
			
		request.getSession().setAttribute("swfpath", url_transforms);
		
		return SUCCESS;
	}

}
