package com.fk.elasticsearch;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfText extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private int[] count = new int[50];
	private List<SaveSql> sql;
	private String searchText;
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
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
		ResourcesDao dao = new ResourcesDao();
		ElasticSearchHandler searchHandler = new ElasticSearchHandler();
		QueryBuilder queryBuilder = QueryBuilders.queryString(searchText);
		request.getSession().setAttribute("searchText",searchText);
		request.getSession().setAttribute("m", -1);
		List<File> result = searchHandler.searcher(queryBuilder,0);
		page = dao.getElasticsearch(result, 1);
		
		count = dao.getKtypecount();
		sql = dao.getSQL(user.getUid());
		return SUCCESS;
	}
}
