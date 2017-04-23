package com.fk.main;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.fk.bean.file.Cdocument;
import com.fk.bean.file.Directory;
import com.fk.bean.file.ShowFile;
import com.fk.bean.page.Page;
import com.fk.bean.user.User;
import com.fk.dao.loginRegister.CdirectoryDao;
import com.fk.recommended.Test;
import com.fk.service.user.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport {
	private List<Directory> directory;
	private List<Cdocument> document;
	private List<ShowFile> userfile;
	public List<ShowFile> getUserfile() {
		return userfile;
	}
	public void setUserfile(List<ShowFile> userfile) {
		this.userfile = userfile;
	}
	public List<Directory> getDirectory() {
		return directory;
	}
	public void setDirectory(List<Directory> directory) {
		this.directory = directory;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user =(User) request.getSession().getAttribute("user");
		CdirectoryDao dao = new CdirectoryDao();
		directory = dao.getPage_directory();
		document = dao.getDocument();
		File file = new File("D:\\upload\\intro.csv");
		FileWriter fileWritter = new FileWriter(file,false);
		BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
		for(Cdocument d : document){
//			System.out.println(d.toString());
			bufferWritter.write(d.toString());
			bufferWritter.newLine();
		}
		bufferWritter.close();
		Test test = new Test();
		try {
			List<Integer> list = test.getID(user.getUid());
			userfile = dao.getFile(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
}
