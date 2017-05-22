package com.fk.util;

import com.alibaba.fastjson.JSON;
import com.fk.bean.FileBean;

import java.io.IOException;
import java.util.List;

/**
 * Created by FK on 2017/5/21.
 */
public class ESTest {

    public static void main(String[] args) throws IOException {
        PropertiesStr propertiesStr = new PropertiesStr();
        propertiesStr.initProperties();
        CElastic.inital();
        FileBean fileBean = new FileBean();
        fileBean.setFid(3);
        fileBean.setTitle("sad");
//        boolean flag =  CElastic.elastic.insert(fileBean);
//        System.out.println(flag);
        List<String> list = CElastic.elastic.searchAll("sad");
        for(String s : list){
            System.out.println(s);
            FileBean v = JSON.parseObject(s, FileBean.class);
            System.out.println();
        }
    }

}
