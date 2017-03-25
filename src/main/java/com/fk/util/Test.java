package com.fk.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by fengkai on 13/02/17.
 */
public class Test {
    public static String str = "1486977316030@15275247807@163.com";
    public static String ss = "<p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345219013330.jpg\" title=\"1490349345219013330.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345220025367.png\" title=\"1490349345220025367.png\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345238061557.jpg\" title=\"1490349345238061557.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345282050166.jpg\" title=\"1490349345282050166.jpg\"/></p><p><img src=\"http://127.0.0.1:8080/movie/image/upload/20170324/1490349345299086634.jpg\" title=\"1490349345299086634.jpg\"/></p><p><br/></p>";

    public static void main(String[] args) throws ParseException {

        String date = "2013-02-10";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date d = simpleDateFormat.parse(date);
        System.out.println(d.toString());
        System.out.println(simpleDateFormat.format(d));
//        String reg = ":8080.*?\"";
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
