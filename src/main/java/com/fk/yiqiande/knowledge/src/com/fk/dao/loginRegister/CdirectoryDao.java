package com.fk.dao.loginRegister;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.fk.bean.file.Cdocument;
import com.fk.bean.file.Directory;
import com.fk.bean.file.ShowFile;
import com.fk.bean.file.UploadFile;
import com.fk.utils.JdbcUtil;

public class CdirectoryDao {
	public  List<Directory> getPage_directory() {
		List<Directory> directories = new ArrayList<Directory>();
		String sql = "select fid, fname, url from cdirectory  order by did desc";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			directories = runner.query(sql, new BeanListHandler<Directory>(Directory.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return directories;
	}

	public List<Cdocument> getDocument() {
		List<Cdocument> list = new ArrayList<Cdocument>();
		String sql = "select uid,fid from cdocument";
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			list = runner.query(sql, new BeanListHandler<Cdocument>(Cdocument.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ShowFile> getFile(List<Integer> list) {
		List<ShowFile> file = new ArrayList<ShowFile>();
		if(list.size() == 0)
			return null;
		StringBuffer sb = new StringBuffer();
		sb.append("select * from file where ");
		Object[] object = new Object[list.size()];
		for(int i=0;i<list.size();i++){
			if(i == 0)
				sb.append("fid = ? ");
			else
				sb.append(" or fid = ?");
			object[i] = list.get(i);
		}
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			List<UploadFile> up = (runner.query(sb.toString(), object, new BeanListHandler<UploadFile>(UploadFile.class)));
			for(UploadFile f : up){
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
				file.add(showFile);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
 		return file;
	}
}
