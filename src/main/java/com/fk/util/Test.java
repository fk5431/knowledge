package com.fk.util;

import com.alibaba.fastjson.JSON;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by fengkai on 13/02/17.
 */
public class Test {
    public static String str = "1486977316030@15275247807@163.com";
    public static String ss = "<p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345219013330.jpg\" title=\"1490349345219013330.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345220025367.png\" title=\"1490349345220025367.png\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345238061557.jpg\" title=\"1490349345238061557.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345282050166.jpg\" title=\"1490349345282050166.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345299086634.jpg\" title=\"1490349345299086634.jpg\"/></p><p><br/></p>";

    public static void main(String[] args) throws ParseException {

//        String date = "2013-02-10";
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//        Date d = simpleDateFormat.parse(date);
//        System.out.println(d.toString());
//        System.out.println(simpleDateFormat.format(d));

        int[][] a = new int[30][100];
//        Map<String, Object> map = new Map
//        Map<String, Object> map = new HashMap<>();
//        map.put("site", a);
      //  System.out.println(JSON.toJSONString(a));
        String a_JSON = JSON.toJSONString(a);
        String[] str = a_JSON.split("],");
        int[][] b = new int[30][100];
        for(int i=0;i <str.length;i++){
            if(i ==0){
                str[i] = str[i].substring(2);
            } else  if(i == str.length - 1){
                str[i] = str[i].substring(1, str[i].length()-2);
            } else {
                str[i] = str[i].substring(1);
            }
            String[] strs = str[i].split(",");
            for(int j=0;j<strs.length;j++){
                b[i][j] = Integer.parseInt(strs[j]);
            }
        }
        System.out.println(JSON.toJSONString(b));
//        int[][] b = (int[][]) JSON.parse(a_JSON);
//        System.out.println(b[0][0]);
//        String reg = ":8080.*?
//        Pattern pattern = Pattern.compile(reg);
//        Matcher matcher =  pattern.matcher(ss);
//        while(matcher.find()){
//            String g = matcher.group();
//            System.out.println(g.substring(5, g.length()-1));
//        }

//        Random random = new Random();
//        StringBuffer sb = new StringBuffer();
//        for(int i=0;i<8;i++){
//            int num = random.nextInt(53);
//            if(num % 2 == 0){
//                sb.append((char)('A' + num));
//            }else{
//                sb.append(random.nextInt(10));
//            }
//        }
//        System.out.println(sb.toString());

    }
}
