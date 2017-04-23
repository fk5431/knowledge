package com.fk.searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.resources.ResourcesDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfTag extends ActionSupport implements ServletRequestAware{
	private String tag;
	private HttpServletRequest request;
	private Page_center page;
	private int typeerror;
	private List<String> tag_list;
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
	public List<String> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<String> tag_list) {
		this.tag_list = tag_list;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String execute() throws Exception {
		UserService service = new UserService();
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
//		String tag = request.getParameter("tag");
		request.getSession().setAttribute("tag", tag);
		request.getSession().setAttribute("m", -1);
		request.getSession().setAttribute("searchTextCenter", "");
		request.getSession().setAttribute("ktypeid", "");
		CenterDao dao = new CenterDao();
		page = dao.getSeachTag(tag, user.getUid(), 1);
		tag_list = dao.getTag_list(user.getUid());
		return SUCCESS;
	}
}
