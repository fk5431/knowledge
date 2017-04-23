package com.fk.other;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.file.Directory;
import com.fk.bean.page.Page;
import com.fk.bean.user.User;
import com.fk.dao.loginRegister.CdirectoryDao;
import com.fk.dao.other.Operate;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class SendDocumentAction  extends ActionSupport implements
ServletRequestAware{
	private HttpServletRequest request;
	private int typeerror;
	private int uid;
	private int fid;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
		Operate dao = new Operate();
		dao.document(user.getUid(), fid);
		typeerror = 100;
		
		return SUCCESS;
	}
	
}
