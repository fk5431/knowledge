package com.fk.managerAction;

import com.fk.bean.page.Page;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class ManageUser extends ActionSupport {
	private Page page;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String execute() throws Exception {
		UserService service = new UserService();
		page = service.getPage(1);
		return SUCCESS;
	}
	
}
