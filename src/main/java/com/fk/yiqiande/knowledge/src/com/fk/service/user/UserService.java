package com.fk.service.user;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import com.fk.bean.page.Page;
import com.fk.bean.user.User;
import com.fk.dao.loginRegister.UserDao;

public class UserService {
	private UserDao dao = null;
	public int getUser(User user) throws SQLException {
		int num = -1;
		dao = new UserDao();
		num = dao.getUser(user);
		return num;
	}
	public int saveUser(String username, String password){
		int num = -1;
		dao = new UserDao();
		num = dao.saveUser(username, password);
		return num;
	}
	public Page getPage(int pagenum) {
		Page page = new Page();
		dao = new UserDao();
		page = dao.getPage(pagenum);
		return page;
	}
	public Page deleteUser(int num) {
		Page page = new Page();
		dao = new UserDao();
		page = dao.deleteUser(num);
		return page;
	}
}
