package com.fk.dao.upload;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;

import com.fk.bean.file.UploadFile;
import com.fk.utils.JdbcUtil;

public class UploadDao {

	public int saveFile(UploadFile file) {
		int num = -1;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into file(uid,fname,uuidname,title,tags,ftypeid,uploadtime,abstracString,introduction,url_image,url,url_transforms,ktypeid) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		try {
			num = runner.update(sql, new Object[]{file.getUid(),
					file.getFname(),file.getUuidname(),file.getTitle(),file.getTags(),file.getFtypeid(),
					file.getUploadtime(),file.getAbstracString(),file.getIntroduction(),file.getUrl_image()
					,file.getUrl(),file.getUrl_transforms(),file.getKtypeid()});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	public void saveTags(String[] str, int uid) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "select count(*) from tags where tag = ? and uid = ?";
		String sql1 = "insert into tags(uid,tag,count) values(?,?,?)";
		String sql2 = "update tags set count = count + 1 where uid = ? and tag = ?";
		for(String s : str){
			try {
				Object[] o = runner.query(sql, new Object[]{s,uid}, new ArrayHandler());
				long l  = (Long) o[0];
				int num = (int) l;
				if(num == 0){
					runner.update(sql1, new Object[]{uid, s, 1});
				}else{
					runner.update(sql2, new Object[]{uid, s});
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int getFid() {
		Object[] obj;
		int num = 0;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "select max(fid) from file";
		try {
			obj = runner.query(sql, new ArrayHandler());
			num = (Integer) obj[0];
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	public void saveKtype(int ktypeid) {
		Object[] obj;
		int num = 0;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "update ktype set count=count+1 where ktypeid=?";
		try {
			runner.update(sql, ktypeid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
