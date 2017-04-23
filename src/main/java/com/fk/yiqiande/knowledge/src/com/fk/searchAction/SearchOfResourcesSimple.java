package com.fk.searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfResourcesSimple extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private int m;
	private int[] count = new int[50];
	private List<SaveSql> sql;
	public List<SaveSql> getSql() {
		return sql;
	}
	public void setSql(List<SaveSql> sql) {
		this.sql = sql;
	}
	public int getM() {
		return m;
	}
	public void setM(int m) {
		this.m = m;
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
		ResourcesDao dao = new ResourcesDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request.getParameter("m") != null) {
			String m = request.getParameter("m");
			int num = Integer.parseInt(m);
			if(request.getParameter("searchText") != null){
				String test = request.getParameter("searchText");
				request.getSession().setAttribute("m", num);
				page = dao.getResources(num, 1);
				count = dao.getKtypecount();
				return SUCCESS;
			}
			request.getSession().setAttribute("m", num);
			page = dao.getResources(num, 1);
		}
		count = dao.getKtypecount();
		sql = dao.getSQL(user.getUid());
		return SUCCESS;
	}
}
