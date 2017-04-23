package com.fk.resources;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class PagingResources extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private int[] count = new int[50];
	private List<SaveSql> sql;
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
	@Override
	public String execute() throws Exception {
		String n = request.getParameter("n");
		int num = Integer.parseInt(n);
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		ResourcesDao dao = new ResourcesDao();
		if (request.getSession().getAttribute("m") != null) {
			int mm =  (Integer) request.getSession().getAttribute("m");
			page = dao.getResources(mm, num);
		}else{
			page = dao.getResources(num);
		}
		count = dao.getKtypecount();
		sql = dao.getSQL(user.getUid());
		return SUCCESS;
	}
}
