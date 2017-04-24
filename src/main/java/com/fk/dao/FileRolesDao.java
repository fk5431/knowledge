package com.fk.dao;

import com.fk.bean.FileRolesBean;

public interface FileRolesDao {
    int deleteByPrimaryKey(Integer fid);

    int insert(FileRolesBean record);

    int insertSelective(FileRolesBean record);

    FileRolesBean selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(FileRolesBean record);

    int updateByPrimaryKey(FileRolesBean record);
}