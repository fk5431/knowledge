package com.fk.loginRegisterAction;

import com.fk.bean.user.User;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport{
	private User user;
	private int typeerror;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	@Override
	public String execute() throws Exception {
		UserService service = new UserService();
		int num = service.saveUser(user.getUname(), user.getPwd());
		if(num == 50){
			this.setTypeerror(50);
			return "REGISTERERROR";
		}
		if(num == 1)
			return SUCCESS;
		else
			return ERROR;
		
	}
}
