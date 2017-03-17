package com.fk.util;

import java.util.Random;

/**
 * Created by fengkai on 13/02/17.
 */
public class Test {
    public static String str = "1486977316030@15275247807@163.com";

    public static void main(String[] args) {
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
//        String type = "a|b";
//        String[] types = type.split("\\|");
//        for(String str : types){
//            System.out.println(str);
//        }

        String str = "<a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10035\" target=\"_blank\">成都</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10136\" target=\"_blank\">九寨沟</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10061\" target=\"_blank\">稻城</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10011\" target=\"_blank\">色达</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10564\" target=\"_blank\">若尔盖</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10163\" target=\"_blank\">都江堰</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10091\" target=\"_blank\">亚丁</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=11642\" target=\"_blank\">阿坝</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=10143\" target=\"_blank\">峨眉山</a>\n" +
                "                                <a href=\"${pageContext.request.contextPath}/searchtravelplace?place=17315\" target=\"_blank\">牛背山</a>";
    }
}
