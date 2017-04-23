package com.fk.centerAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.page.Page;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class PagingCenterAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private Page_center page_center_cdocument;
	private List<String> tag_list;
	private int typeerror;
	public Page_center getPage_center_cdocument() {
		return page_center_cdocument;
	}
	public void setPage_center_cdocument(Page_center page_center_cdocument) {
		this.page_center_cdocument = page_center_cdocument;
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
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		CenterDao centerDao = new CenterDao();
		page_center_cdocument = centerDao.getPage_cdocument(user.getUid(),num);
		tag_list = centerDao.getTag_list(user.getUid());
		
		return SUCCESS;
	}
}
