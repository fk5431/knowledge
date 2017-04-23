package com.fk.searchAction;

import com.fk.bean.page.Page;
import com.fk.dao.loginRegister.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class SearchUser  extends ActionSupport{
	private String username;
	private Page page;
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String execute() throws Exception {
		UserDao dao = new UserDao();
		page = dao.search(username, 1);
		return SUCCESS;
	}
}
