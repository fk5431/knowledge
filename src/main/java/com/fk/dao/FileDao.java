package com.fk.dao;

import com.fk.bean.FileBean;

import java.util.List;

public interface FileDao {
    int deleteByPrimaryKey(Integer fid);

    int insert(FileBean record);

    int insertSelective(FileBean record);

    FileBean selectByPrimaryKey(Integer fid);

    int updateByPrimaryKeySelective(FileBean record);

    int updateByPrimaryKeyWithBLOBs(FileBean record);

    int updateByPrimaryKey(FileBean record);

    int count();

    List<FileBean> selectByStart(int start);
}