package com.fk.dao.loginRegister;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.fk.bean.page.Page;
import com.fk.bean.user.User;
import com.fk.utils.JdbcUtil;

public class UserDao {
	public int getUser(User user) {
		String username = user.getUname();
		String password = user.getPwd();
		int num = -1;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "select ismanage from user where uname=? and pwd=?";
		String sql1 = "select uid from user where uname=? and pwd=?";
		try {
			Object[] obj = runner.query(sql,
					new Object[] { username, password }, new ArrayHandler());
			
			if (obj != null) {
				int b = (Integer) obj[0];
				num = b;
				Object[] obj1 = runner.query(sql1,
						new Object[] { username, password }, new ArrayHandler());
				int c = (Integer) obj1[0];
				user.setUid(c);
			}
		} catch (Exception e) {
			return -1;
		}
		return num;
	}
	public int saveUser(String username, String password){
		int num = -1;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "insert into user(uname,pwd,ismanage) values(?,?,0);";
		try {
			num = runner.update(sql, new Object[]{username,password});
		} catch (SQLException e) {
			num = 50;
		} 
		return num;
	}
	public Page getPage(int pagenum) {
		Page page = new Page();
		String sql = "select * from user limit ?,?";
		String sql_ = "select count(*) from user";
		int size = page.getPerPageNum();
		int start = (pagenum - 1) * size;
		Object[] params={start, size};
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			page.setUserlist(runner.query(sql, params, new BeanListHandler<User>(User.class)));
			Object []ob = runner.query( sql_, new ArrayHandler());
			long l = (Long) ob[0];
			int num = (int) l;
			int m = 0;
			if(num % size == 0)
				m = num / size;
			else
				m = (num - num%size) / size  + 1;
			page.setTotalPage(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public Page deleteUser(int num) {
		Page page = new Page();
		String sql = "select * from user limit ?,?";
		String sql_ = "select count(*) from user";
		String dsql = "delete from user where uid = ?";
		int size = page.getPerPageNum();
		int start = 0;
		Object[] params={start, size};
		Object param = num;
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			runner.update(dsql, param);
			page.setUserlist(runner.query(sql, params, new BeanListHandler<User>(User.class)));
			Object []ob = runner.query(JdbcUtil.getMySqlConnection(), sql_, new ArrayHandler());
			long l = (Long) ob[0];
			int n = (int) l;
			int m = 0;
			if(n % size == 0)
				m = n / size;
			else
				m = (n - n%size) / size  + 1;
			page.setTotalPage(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
	public void update(int uid, String newpassword) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "update user set pwd=? where uid = ?";
		try {
			runner.update(sql, new Object[]{newpassword,uid});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public Page search(String username, int pagenum) {
		Page page = new Page();
		String sql = "select * from user where uname=? limit ?,?";
		String sql_ = "select count(*) from user";
		int size = page.getPerPageNum();
		int start = (pagenum - 1) * size;
		Object[] params={username,start, size};
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		try {
			page.setUserlist(runner.query(sql, params, new BeanListHandler<User>(User.class)));
			Object []ob = runner.query( sql_, new ArrayHandler());
			long l = (Long) ob[0];
			int num = (int) l;
			int m = 0;
			if(num % size == 0)
				m = num / size;
			else
				m = (num - num%size) / size  + 1;
			page.setTotalPage(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return page;
	}
}
