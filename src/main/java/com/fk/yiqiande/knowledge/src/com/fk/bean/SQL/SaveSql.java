package com.fk.bean.SQL;

public class SaveSql {
	private String sql;
	private int id;
	public SaveSql(String s, int id2) {
		this.sql = s;
		this.id = id2;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
