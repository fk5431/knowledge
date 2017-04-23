package com.fk.dao.center;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.fk.bean.file.ShowFile;
import com.fk.bean.file.UploadFile;
import com.fk.bean.page.Page;
import com.fk.bean.page.Page_center;
import com.fk.bean.user.User;
import com.fk.utils.JdbcUtil;

public class CenterDao {
	public Page_center getPage_cdocument(int uid,int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from cdocument left join file on cdocument.uid = ? and cdocument.fid = file.fid where fname is not null order by id desc limit ?,?";
		String sql1 = "select count(*) from cdocument where uid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1,uid,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setFid(f.getFid());
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile);
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage() && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
}
	public Page_center getPage_history(int uid,int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from browse left join file on browse.uid = ? and browse.fid = file.fid where fname is not null order by id desc limit ?,?";
		String sql1 = "select count(*) from browse where uid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1,uid,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setAbstracString(f.getAbstracString());
				showFile.setFid(f.getFid());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,f.getKtypeid(), new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage() && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else	
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public Page_center getPage_center_search(int drop1, int drop2 ,int uid, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where uid = ? and ftypeid =? and ktypeid=? limit ?,?";
		String sql1 = "select count(*) from file where uid = ? and ftypeid =? and ktypeid=? ";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1, new Object[]{uid, drop1, drop2},new ArrayHandler());
			long l = ((Long) ob[0]);
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, drop1, drop2, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				showFile.setFid(f.getFid());
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage()  && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public Page_center getPage_center_search(int m, int uid, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where uid = ? and ktypeid=? limit ?,?";
		String sql1 = "select count(*) from file where uid = ? and ktypeid=? ";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1, new Object[]{uid,m},new ArrayHandler());
			long l = ((Long) ob[0]);
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, m, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setFid(f.getFid());
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage()  && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public Page_center getPage_center_search(String ktypeid, int uid, int pagenum) {
		int m = 0;
		String sql3 = "select ktypeid from ktype where ktype = ?";
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where uid = ? and ktypeid=? limit ?,?";
		String sql1 = "select count(*) from file where uid = ? and ktypeid=? ";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			long l;
			Object []aa = runner.query(sql3, new Object[]{ktypeid},new ArrayHandler());
			m = (Integer) aa[0];
			Object []ob = runner.query(sql1, new Object[]{uid,m},new ArrayHandler());
			l = ((Long) ob[0]);
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, m, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setFid(f.getFid());
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage()  && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public Page_center getPage_upload(int uid,int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where uid = ? limit ?,?";
		String sql1 = "select count(*) from file where uid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1,uid,new ArrayHandler());
			long l = ((Long) ob[0]);
			int num = (int) l;
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setFid(f.getFid());
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage()  && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public List<String> getTag_list(int uid) {
		List<String> list = new ArrayList<String>();
		String sql = "select tag from tags where uid = ? order by count desc limit ?,?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<Object[]> ob = runner.query(sql,new Object[]{uid,0,15},new ArrayListHandler());
			for(Object[] o : ob){
				String s = (String)o[0];
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public Page_center getSeachTag(String tag ,int uid, int pagenum) {
		String tag_ = "%"+tag+"%";
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where uid = ? and tags like ? limit ?,?";
		String sql1 = "select count from tags where uid = ? and tag=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object []ob = runner.query(sql1, new Object[]{uid, tag},new ArrayHandler());
			int num  = (Integer)  ob[0];
			page.setTotalNum(num);
			int start = (pagenum-1) * page.getPerPageNum();
			if(page.getTotalNum() < start)
				start = (pagenum-2) * page.getPerPageNum();
			int end = page.getPerPageNum() ;
			List<UploadFile> file = runner.query(sql, new Object[]{uid,tag_ , start, end}, new BeanListHandler<UploadFile>(UploadFile.class));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				ShowFile showFile = new ShowFile();
				showFile.setFid(f.getFid());
				showFile.setAbstracString(f.getAbstracString());
				String ft = "select ftype from ftype where ftypeid = ?";
				Object[] obj = runner.query(ft,new Object[] { f.getFtypeid() }, new ArrayHandler());
				showFile.setFtypeid((String) obj[0]);
				String kt = "select ktype from ktype where ktypeid = ?";
				obj = runner.query(kt,new Object[] { f.getKtypeid() }, new ArrayHandler());
				showFile.setKtypeid((String)obj[0]);
				showFile.setTags(f.getTags());
				showFile.setTitle(f.getTitle());
				String u = "select uname from user where uid = ?";
				obj = runner.query(u,new Object[] { f.getUid() }, new ArrayHandler());
				showFile.setUname((String)obj[0]);
				showFile.setUploadtime(f.getUploadtime());
				showFile.setUrl(f.getUrl());
				sfile.add(showFile);
			}
			page.setUserfile(sfile); 
			if(page.getTotalNum() % page.getPerPageNum() == 0)
				page.setTotalPage(page.getTotalNum() / page.getPerPageNum());
			else
				page.setTotalPage((page.getTotalNum() - page.getTotalNum()%page.getPerPageNum()) / page.getPerPageNum()  + 1);
			if(pagenum > page.getTotalPage()  && page.getTotalPage() >= 1)
				pagenum = page.getTotalPage();
			page.setPageNO(pagenum);
			if(pagenum % 10 == 0)
				page.setStartPage((pagenum / 10-1)*10+1 );
			else
				page.setStartPage(pagenum - pagenum % 10 + 1);
			if(page.getStartPage() + 9 < page.getTotalPage())
				page.setEndPage(page.getStartPage() + 9);
			else
				page.setEndPage(page.getTotalPage());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
}
