package com.fk.managerAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.fk.bean.SQL.SaveSql;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.resources.ResourcesDao;
import com.opensymphony.xwork2.ActionSupport;

public class ManageDeleteMoreFile  extends ActionSupport{
	private Page_center page;
	private int typeerror;
	private int[] fid;
	public int[] getFid() {
		return fid;
	}
	public void setFid(int[] fid) {
		this.fid = fid;
	}
	public Page_center getPage() {
		return page;
	}
	public void setPage(Page_center page) {
		this.page = page;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		ResourcesDao dao = new ResourcesDao();
		for(int i=0;i<fid.length;i++)
			dao.deletefile(fid[i]);
		page = dao.getResources(1);
		
		return SUCCESS;
	}
}