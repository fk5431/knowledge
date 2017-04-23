package com.fk.loginRegisterAction;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.page.Page;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteuserAction extends ActionSupport implements ServletRequestAware{
	private Page page;
	private HttpServletRequest request;
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
		String n = request.getParameter("uid");
		int num = Integer.parseInt(n);
		UserService service = new UserService();
		page = service.deleteUser(num);
		return SUCCESS;
	}
}
