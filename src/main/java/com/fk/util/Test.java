package com.fk.util;

import com.alibaba.fastjson.JSON;

import java.io.*;
import java.util.Random;

/**
 * Created by fengkai on 13/02/17.
 */
public class Test {

    public static void main(String[] args) throws IOException {
//        Reader reader = new InputStreamReader(new FileInputStream(new File("in.txt")));
        File directory = new File("");//参数为空
        String courseFile = directory.getCanonicalPath() ;
        System.out.println(courseFile);
        BufferedReader reader = new BufferedReader(new FileReader(new File("in.txt")));
        BufferedWriter writer = new BufferedWriter(new FileWriter(new File("out.txt")));
        String str = "";
        while ( (str = reader.readLine()) != null ){
            String[] strs = str.split(",");
            StringBuffer sb = new StringBuffer();
            sb.append("update movie set directorId = '");
            String row = strs[1];
            String col = strs[2].substring(0, strs[2].length()-1);
            String id = strs[0];
            int[][] array = new int[Integer.parseInt(row)][Integer.parseInt(col)];
            sb.append(row + "!=end=!"+col+"!=end=!"+ Integer.parseInt(row)*Integer.parseInt(col)+"!=end=!"+JSON.toJSONString(array) + "'");
            sb.append(" where id = " + id + ";" +"\n");

            writer.write(sb.toString());
        }
        writer.flush();

        reader.close();
        writer.close();


    }
}
