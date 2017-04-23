package com.fk.searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.SQL.Save;
import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.resources.ResourcesDao;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfCenterFrom extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private int[] count = new int[50];
	private List<SaveSql> sql;
	private String classid;
	private String keyboard;
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getKeyboard() {
		return keyboard;
	}
	public void setKeyboard(String keyboard) {
		this.keyboard = keyboard;
	}
	public List<SaveSql> getSql() {
		return sql;
	}
	public void setSql(List<SaveSql> sql) {
		this.sql = sql;
	}
	public int[] getCount() {
		return count;
	}
	public void setCount(int[] count) {
		this.count = count;
	}
	public Page_center getPage() {
		return page;
	}
	public void setPage(Page_center page) {
		this.page = page;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	public String execute() throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			this.setTypeerror(20);
			return "USERERROR";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		ResourcesDao dao = new ResourcesDao();
		request.getSession().setAttribute("classid", classid);
		request.getSession().setAttribute("keyboard", keyboard);
		System.out.println(classid);
		System.out.println(keyboard);
		if(classid.equals("all")){
			
		}else if(classid.equals("user")){
			page = dao.getSearchCenterFromOfUser(classid, keyboard, 1);
		}else{
			page = dao.getSearchCenterFrom(classid, keyboard, 1);
		}
		count = dao.getKtypecount();
		sql = dao.getSQL(user.getUid());
	
		return SUCCESS;
	}
}
