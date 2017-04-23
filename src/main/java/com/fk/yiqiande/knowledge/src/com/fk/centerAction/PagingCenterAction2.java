package com.fk.centerAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import com.fk.bean.page.Page;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.fk.elasticsearch.ElasticSearchHandler;
import com.fk.elasticsearch.File;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class PagingCenterAction2 extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private Page_center page;
	private List<String> tag_list;
	private int typeerror;

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

	public List<String> getTag_list() {
		return tag_list;
	}

	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
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
		UserService service = new UserService();
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			this.setTypeerror(20);
			return "USERERROR";
		}
		CenterDao centerDao = new CenterDao();
		tag_list = centerDao.getTag_list(user.getUid());
		HttpServletRequest request = ServletActionContext.getRequest();
		if (request.getSession().getAttribute("searchTextCenter") != null) {
			String searchTextCenter = (String) request.getSession().getAttribute("searchTextCenter");
			if (!searchTextCenter.equals("")) {
				ResourcesDao dao = new ResourcesDao();
				ElasticSearchHandler searchHandler = new ElasticSearchHandler();
				QueryBuilder queryBuilder = QueryBuilders.queryString(searchTextCenter);
				QueryBuilder queryBuilder1 = QueryBuilders.termQuery("uid", user.getUid());
				QueryBuilder queryBuilder2 = QueryBuilders.boolQuery().must(queryBuilder1).must(queryBuilder);
				List<File> result = searchHandler.searcher(queryBuilder,0);
				page = dao.getElasticsearch(result, 1);
				return SUCCESS;
			}
		}
		if (request.getSession().getAttribute("ktypeid") != null) {
			String ktypeid = (String) request.getSession().getAttribute("ktypeid");
			if (!ktypeid.equals("")) {
				page = centerDao.getPage_center_search(ktypeid,user.getUid(),num);
				return SUCCESS;
			}
		}
		if (request.getSession().getAttribute("tag") != null) {
			String tag = (String) request.getSession().getAttribute("tag");
			if (!tag.equals("")) {
				page = centerDao.getSeachTag(tag, user.getUid(), num);
				return SUCCESS;
			}
		}
		if (request.getSession().getAttribute("m") != null) {
			int m =  (Integer) request.getSession().getAttribute("m");
			if (m!= -1) {
				page = centerDao.getPage_center_search(m, user.getUid(), num);
				return SUCCESS;
			}
		}


		return SUCCESS;
	}
}
