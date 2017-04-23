package com.fk.loginRegisterAction;

import com.fk.bean.page.Page;
import com.fk.dao.loginRegister.UserDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUser extends ActionSupport{
	private int uid;
	private String newpassword;
	private Page page;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String execute() throws Exception {
		UserDao dao = new UserDao();
		dao.update(uid,newpassword);
		page = dao.getPage(1);
		return SUCCESS;
	}
}
