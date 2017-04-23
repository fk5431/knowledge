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

public class SearchOfCenterKtypeid  extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String ktypeid;
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
	public String getKtypeid() {
		return ktypeid;
	}
	public void setKtypeid(String ktypeid) {
		this.ktypeid = ktypeid;
	}
	public String execute() throws Exception {
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		CenterDao centerDao = new CenterDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("ktypeid", ktypeid);
		request.getSession().setAttribute("tag", "");
		request.getSession().setAttribute("m", -1);
		request.getSession().setAttribute("searchTextCenter", "");
		page = centerDao.getPage_center_search(ktypeid,user.getUid(),1);
		tag_list = centerDao.getTag_list(user.getUid());
		
		return SUCCESS;
	}
}
