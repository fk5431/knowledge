package com.fk.bean.page;

import java.util.List;

import com.fk.bean.user.User;

public class Page {
	private int pageNO = 1;//��ǰҳ��
	private int totalNum = -1;//��¼����
	private int totalPage = -1;//��ҳ��
	private int perPageNum = 7;//ÿҳ��ʾ��Ŀ
	private List<User> userlist;
	public int getPageNO() {
		return pageNO;
	}
	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public List<User> getUserlist() {
		return userlist;
	}
	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}
}
