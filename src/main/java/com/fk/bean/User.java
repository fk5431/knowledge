package com.fk.bean;

/**
 * Created by FK on 2017/2/8.
 */
public class User {
    private int id;
    private String username;
    private String password;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + username + ", password=" + password + "]";
    }


}
