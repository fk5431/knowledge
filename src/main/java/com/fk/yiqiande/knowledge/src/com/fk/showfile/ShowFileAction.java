package com.fk.showfile;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.fk.bean.file.ShowFile;
import com.fk.bean.file.UploadFile;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.dao.center.CenterDao;
import com.fk.dao.showfile.ShowFileDao;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class ShowFileAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private UploadFile file;
	private int typeerror;
	private int id;
	private String name;
	private List<ShowFile> showfile;
	public List<ShowFile> getShowfile() {
		return showfile;
	}
	public void setShowfile(List<ShowFile> showfile) {
		this.showfile = showfile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UploadFile getFile() {
		return file;
	}
	public void setFile(UploadFile file) {
		this.file = file;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String execute() throws Exception {
		User user =(User) request.getSession().getAttribute("user");
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		ShowFileDao dao = new ShowFileDao();
		dao.saveHistory(id, user.getUid());
		file = dao.getFile(id);
		name = dao.getUid(file.getUid());
		showfile = dao.getRelevance(id);
		return SUCCESS;
	}
}
