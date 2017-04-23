package com.fk.searchAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class SearchOfCenterSimpleAction  extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Page_center page;
	private List<String> tag_list;
	private int typeerror;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Page_center getPage() {
		return page;
	}
	public void setPage(Page_center page) {
		this.page = page;
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
	public String execute() throws Exception {
		UserService service = new UserService();
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		CenterDao centerDao = new CenterDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		if(request.getParameter("m") != null){
			String str = request.getParameter("m");
			if(!str.equals("")){
			int m = Integer.parseInt(str);
			tag_list = centerDao.getTag_list(user.getUid());
			page = centerDao.getPage_center_search(m,user.getUid(),1);
			request.getSession().setAttribute("m", m);
			request.getSession().setAttribute("tag", "");
			request.getSession().setAttribute("ktypeid", "");
			request.getSession().setAttribute("searchTextCenter", "");
			return SUCCESS;}
		}
		tag_list = centerDao.getTag_list(user.getUid());
		
		return SUCCESS;
	}
}
