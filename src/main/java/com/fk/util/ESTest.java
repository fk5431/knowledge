package com.fk.util;

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
//        FileBean fileBean = new FileBean();
//        fileBean.setFid(8);
//        fileBean.setTitle("标题");
//        fileBean.setFname("名字");
//        fileBean.setUrl("url");
//        ESFileBean es = new ESFileBean(fileBean);
//        boolean flag =  CElastic.elastic.insert(es);
//        System.out.println(flag);
//        List<String> list = CElastic.elastic.searchAll("标题");
        String[] bools = new String[3];
        bools[0] = "AND";
        bools[1] = "NOT";
        bools[2] = "OR";
        String[] sections = new String[4];
        sections[0] = "title";
        sections[1] = "fname";
        sections[2] = "title";
        sections[3] = "title";
        String[] words = new String[4];
        words[0] = "标题";
        words[1] = "名字";
        words[2] = "测试";
        words[3] = "";
        List<String> list = CElastic.elastic.groupSearch(bools, sections, words);
        for(String s : list){
            System.out.println(s);
//                FileBean v = JSON.parseObject(s, FileBean.class);
//            System.out.println();
        }
    }

}
