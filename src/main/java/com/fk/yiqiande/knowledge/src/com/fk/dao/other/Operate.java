package com.fk.dao.other;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.fk.bean.file.UploadFile;
import com.fk.utils.JdbcUtil;

public class Operate {
	public int cdirectory(int id, String fname) {
		int num = -1;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into cdirectory(fid,fname) values(?,?);";
		try {
			num = runner.update(sql, new Object[]{id, fname});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
	public int document(int uid, int fid) {
		int num = -1;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into cdocument(uid,fid) values(?,?);";
		try {
			num = runner.update(sql, new Object[]{uid, fid});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
}
