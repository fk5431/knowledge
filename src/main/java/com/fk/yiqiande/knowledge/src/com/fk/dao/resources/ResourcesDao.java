package com.fk.dao.resources;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.fk.bean.SQL.Save;
import com.fk.bean.SQL.SaveSql;
import com.fk.bean.file.ShowFile;
import com.fk.bean.file.UploadFile;
import com.fk.bean.page.Page_center;
import com.fk.elasticsearch.File;
import com.fk.utils.JdbcUtil;

public class ResourcesDao {

	public Page_center getResources(int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file limit ?,?";
		String sql1 = "select count(*) from file";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> file = (runner.query(sql, new Object[]{start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
				ShowFile showFile = new ShowFile();
				showFile.setAbstracString(f.getAbstracString());
				showFile.setFid(f.getFid());
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
			Object []ob = runner.query(sql1,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
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

	public Page_center getResources(int ktype, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where ktypeid=? limit ?,?";
		String sql1 = "select count(*) from file where ktypeid=?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> file = (runner.query(sql, new Object[]{ktype, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object []ob = runner.query(sql1, ktype,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
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

	public int[] getKtypecount() {
		String sql = "select count from ktype";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		int[] list = new int[50];
		try {
			List<Object[]> obj = runner.query(sql, new ArrayListHandler());
			int i=0;
			for(Object[] o : obj){
				int a = (Integer) o[0];
				list[i++] = a;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public Page_center getSearchResources(String s, int uid, String[] str, int cou, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = s+ " limit ?,?";
		String sql1 = s.replace("*", "count(*)");
		String sql2 = "select uid from user where uname=?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			if(uid != -1){
				Object[] o = runner.query(sql2, str[uid], new ArrayHandler());
				if(o.length == 0 || o == null){
					 return page;
				}
				int u = (Integer) o[0];
				str[uid] = String.valueOf(u);
			}
			Object[] o = new Object[cou+2];
			for(int i=0;i<cou;i++){
				o[i] = str[i];
			}
			o[cou] = start;o[cou+1] = end;
			List<UploadFile> file = (runner.query(sql, o, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object[] obj_ = new Object[cou];
			for(int i=0;i<cou;i++){
				obj_[i] = str[i];
			}
			Object []ob = runner.query(sql1, obj_,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
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
			return page;
		}
		
		return page;
	}

	public Page_center getSearchResources(String s, int uid, String[] str,
			int cou, int pagenum, int totalnum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = s+ " limit ?,?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] o = new Object[cou+2];
			for(int i=0;i<cou;i++){
				o[i] = str[i];
			}
			o[cou] = start;o[cou+1] = end;
			List<UploadFile> file = (runner.query(sql, o, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object[] obj_ = new Object[cou];
			for(int i=0;i<cou;i++){
				obj_[i] = str[i];
			}
			page.setTotalNum(totalnum);
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
			return page;
		}
		
		return page;
	}

	public Page_center saveSearch(String s, int uid, String[] str, int cou, int saveUser) {
		Object[] num;
		Page_center page = new Page_center();
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into rule(uid, rulename,introduction) values(?,?,?)";
		String sql1= "select ruleid from rule where uid=? and rulename=?";
		String sql2 = "insert into userroles(roleid,uid) values(?,?)";
		String sql3 = "insert into role(roleid,rolename) values(?,?)";
		StringBuffer sb = new StringBuffer();
		for(String st : str){
			sb.append(st+",");
		}
		sb.append(uid+",");
		sb.append(cou);
		try {
			runner.update(sql, new Object[]{saveUser, s, sb.toString()});
			num = runner.query(sql1, new Object[]{saveUser, s},  new ArrayHandler());
			int ruleid = (Integer) num[0];
			runner.update(sql3, new Object[]{ruleid, s});
			runner.update(sql2, new Object[]{ruleid, saveUser});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		page = getSearchResources(s, uid, str, cou,1);
		return page;
	}

	public List<SaveSql> getSQL(int uid) {
		Object[] obj;
		List<SaveSql> list = new ArrayList<SaveSql>();
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql1 = "select rulename,introduction,ruleid from rule where uid=?";
		try {
			List<Object[]> o = runner.query(sql1, uid, new ArrayListHandler());
			for(Object[] a : o){
				String s = (String) a[0];
				String s1 = (String) a[1];
				int id = (Integer) a[2];
				s =  s.substring(25);
				s = s.replace("like", "");
				s = s.replace("title", "标题");
				s = s.replace("uid", "上传者");
				s = s.replace("tags", "标签");
				s = s.replace("uploadtime", "上传时间");
				s = s.replace("ftypeid", "类型");
				s = s.replace("abstracString", "摘要");
				s = s.replace("AND", "and");
				s = s.replace("OR", "or");
				s = s.replace("NOT", "not");
				String[] str = s1.split(",");
				int cou = Integer.parseInt(str[str.length-1]);
				for(int i=0;i<cou;i++)
					s = s.replaceFirst("\\?", str[i]);
				s=s.replace("%", "");
				s=s.replace("=", "");
				s=s.replace(" 00:00:00", "");
				list.add(new SaveSql(s,id));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public Save getSave(int search) {
		Save save = new Save();
		String sql = "select rulename,introduction from rule where ruleid=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] obj = runner.query(sql, search, new ArrayHandler());
			save.setRulename((String)obj[0]);
			save.setIntroduction((String)obj[1]);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return save;
	}

	public Page_center getSearchCenterFrom(String classid, String keyboard, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where "+ classid+ "=? limit ?,?";
		String sql1 = "select count(*) from file where " + classid + "=?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> file = (runner.query(sql, new Object[]{keyboard, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object []ob = runner.query(sql1, keyboard,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
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

	public Page_center getSearchCenterFromOfUser(String classid, String keyboard, int pagenum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sq = "select uid from user where uname=?";
		String sql = "select * from file where  uid=? limit ?,?";
		String sql1 = "select count(*) from file where uid=?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] oo = runner.query(sq, keyboard, new ArrayHandler());
			int uid = 1;
			if(oo.length > 0 && oo != null)
				uid = (Integer) oo[0];
			else
				return page;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object []ob = runner.query(sql1, uid,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			page.setTotalNum(num);
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

	public Page_center getPagingSearchCenterFromOfUser(String classid,
			String keyboard, int pagenum, int totalnum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sq = "select uid from user where uname=?";
		String sql = "select * from file where  uid=? limit ?,?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] oo = runner.query(sq, keyboard, new ArrayHandler());
			int uid = 1;
			if(oo.length > 0 && oo != null)
				uid = (Integer) oo[0];
			else
				return page;
			List<UploadFile> file = (runner.query(sql, new Object[]{uid, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			page.setTotalNum(totalnum);
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

	public Page_center getPagingSearchCenterFrom(String classid,
			String keyboard, int pagenum, int totalnum) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where "+ classid+ "=? limit ?,?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> file = (runner.query(sql, new Object[]{keyboard, start, end}, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			page.setTotalNum(totalnum);
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

	public Page_center getElasticsearch(List<File> result, int pagenum) {
		if(pagenum <1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = "select * from file where ";
		StringBuffer sb = new StringBuffer();
		Object[] o = new Object[result.size()];
		for(int i=0;i<result.size()-1;i++)
			sb.append(" fid = ? or ");
		int coun = 0;
		for(File f : result){
			o[coun++] = f.getFid();
		}
		sb.append("fid = ?");
		sql = sql + sb.toString();
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> file = (runner.query(sql, o, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			long num = Long.parseLong(result.get(0).getTitle());
			page.setTotalNum((int) num);
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

	public Page_center getSearchResources(String s, String[] str, int cou, int pagenum, int uid) {
		if(pagenum < 1)
			pagenum = 1;
		Page_center page = new Page_center();
		String sql = s+ " limit ?,?";
		String sql1 = s.replace("*", "count(*)");
		String sql2 = "select uid from user where uname=?";
		int start = (pagenum-1) * page.getPerPageNum();
		int end = page.getPerPageNum() ;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] o = new Object[cou+3];
			o[0] = uid;
			for(int i=1;i<=cou;i++){
				o[i] = str[i-1];
			}
			o[cou+1] = start;o[cou+2] = end;
			List<UploadFile> file = (runner.query(sql, o, new BeanListHandler<UploadFile>(UploadFile.class)));
			List<ShowFile> sfile = new ArrayList<ShowFile>();
			for(UploadFile f : file){
				if(f.getFname() == null)
					continue;
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
			Object[] obj_ = new Object[cou+1];
			obj_[0] = uid;
			for(int i=1;i<cou+1;i++){
				obj_[i] = str[i-1];
			}
			Object []ob = runner.query(sql1, obj_,new ArrayHandler());
			long l  = (Long) ob[0];
			int num = (int) l;
			System.out.println("num"+num);
			page.setTotalNum(num);
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
			return page;
		}
		
		return page;
	}

	public void deletefile(int fid) {
		String sql = "delete from browse where fid=?";
		String sql1 = "delete from cdirectory where fid=?";
		String sql2 = "delete from cdocument where fid=?";
		String sql3 = "delete from fileroles where fid=?";
		String sql4 = "delete from file where fid=?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			runner.update(sql, fid);
			runner.update(sql1, fid);
			runner.update(sql2, fid);
			runner.update(sql3, fid);
			runner.update(sql4, fid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
