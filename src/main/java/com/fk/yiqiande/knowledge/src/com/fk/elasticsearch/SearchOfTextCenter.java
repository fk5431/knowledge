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

public class SearchOfTextCenter extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private List<SaveSql> sql;
	private String searchTextCenter;
	private List<String> tag_list;
	public List<String> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
	}
	public String getSearchTextCenter() {
		return searchTextCenter;
	}
	public void setSearchTextCenter(String searchTextCenter) {
		this.searchTextCenter = searchTextCenter;
	}
	public List<SaveSql> getSql() {
		return sql;
	}
	public void setSql(List<SaveSql> sql) {
		this.sql = sql;
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
		try {
			ElasticSearchHandler searchHandler = new ElasticSearchHandler();
			QueryBuilder queryBuilder = QueryBuilders
					.queryString(searchTextCenter);
			QueryBuilder queryBuilder1 = QueryBuilders.termQuery("uid",
					user.getUid());
			QueryBuilder queryBuilder2 = QueryBuilders.boolQuery()
					.must(queryBuilder1).must(queryBuilder);
			List<File> result = searchHandler.searcher(queryBuilder2, 0);
			page = dao.getElasticsearch(result, 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("searchTextCenter",searchTextCenter);
		request.getSession().setAttribute("ktypeid","");
		request.getSession().setAttribute("tag","");
		request.getSession().setAttribute("m",-1);
		CenterDao centerdao = new CenterDao();
		tag_list = centerdao.getTag_list(user.getUid());
		sql = dao.getSQL(user.getUid());
		return SUCCESS;
	}
}
