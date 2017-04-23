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

public class SearchOfSaveResourcesAdvanced extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private Save save;
	private int search;
	private List<SaveSql> sql;
	public List<SaveSql> getSql() {
		return sql;
	}
	public void setSql(List<SaveSql> sql) {
		this.sql = sql;
	}
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	private int[] count = new int[50];
	public int[] getCount() {
		return count;
	}
	public Save getSave() {
		return save;
	}
	public void setSave(Save save) {
		this.save = save;
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
		int uid = -1;
		int cou = 0;
		ResourcesDao dao = new ResourcesDao();
		save = dao.getSave(search);
		String[] str = save.getIntroduction().split(",");
		uid = Integer.parseInt(str[str.length-2]);
		cou = Integer.parseInt(str[str.length-1]);
		
		request.getSession().setAttribute("sql", save.getRulename());
		request.getSession().setAttribute("uid", uid);
		request.getSession().setAttribute("str", str);
		request.getSession().setAttribute("cou", cou);
		page = dao.getSearchResources(save.getRulename(), uid, str,cou, 1);
		count = dao.getKtypecount();
		sql = dao.getSQL(user.getUid());
		return SUCCESS;
	}
	public static void main(String[] args) {

	}
}
