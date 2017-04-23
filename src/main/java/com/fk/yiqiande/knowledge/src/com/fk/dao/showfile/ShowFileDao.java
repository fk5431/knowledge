package com.fk.dao.showfile;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.fk.bean.file.ShowFile;
import com.fk.bean.file.UploadFile;
import com.fk.bean.page.Page_center;
import com.fk.utils.JdbcUtil;

public class ShowFileDao {

	public UploadFile getFile(int id) {
		UploadFile file = new UploadFile();
		String sql = "select * from file where fid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			file = runner.query(sql, id, new BeanHandler<UploadFile>(UploadFile.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return file;
	}

	public void saveHistory(int id, int uid) {
		String sql = "insert into browse(uid,fid) values(?,?)";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			runner.update(sql, new Object[]{uid, id});
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String getUid(int uid) {
		String name = null;
		String sql = "select uname from user where uid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] o = runner.query(sql, uid, new ArrayHandler());
			name = (String) o[0];
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}

	public List<ShowFile> getRelevance(int id) {
		List<ShowFile> showfile = new ArrayList<ShowFile>();
		String sql = "select relfid from  relevance where fid = ?";
		String sql1 = "select * from file where fid = ? or fid = ? or fid = ? or fid = ? or fid = ? or fid = ? or fid = ?";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			Object[] o = runner.query(sql, id, new ArrayHandler());
			if(o.length == 0 || o.equals(null))
				return null;
			String s = (String) o[0];
			String[] str = s.split(","); 
			List<UploadFile> file = runner.query(sql1, str, new BeanListHandler<UploadFile>(UploadFile.class));
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
				showfile.add(showFile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		return showfile;
	}

}
