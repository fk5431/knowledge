package com.fk.loginRegisterAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.page.Page;
import com.fk.dao.loginRegister.UserDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteMoreUser extends ActionSupport implements ServletRequestAware{
	private Page page;
	private HttpServletRequest request;
	private String[] uid;
	public String[] getUid() {
		return uid;
	}
	public void setUid(String[] uid) {
		this.uid = uid;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public String execute() throws Exception {
		UserService service = new UserService();
		UserDao dao = new UserDao();
		for(int i=0;i<uid.length;i++){
			page = dao.deleteUser(Integer.parseInt(uid[i]));
		}
		return SUCCESS;
	}
}
