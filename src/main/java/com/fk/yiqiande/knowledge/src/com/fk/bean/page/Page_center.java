package com.fk.bean.page;

import java.util.List;

import com.fk.bean.file.ShowFile;



public class Page_center {
	private int pageNO = 1;//当前页码
	private int totalNum = -1;//记录总数
	private int totalPage = -1;//总页数
	private int perPageNum = 7;//每页显示数目
	private int startPage = 1;//
	private int endPage = 1;//
	private List<ShowFile> userfile;
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
	public List<ShowFile> getUserfile() {
		return userfile;
	}
	public void setUserfile(List<ShowFile> userfile) {
		this.userfile = userfile;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
