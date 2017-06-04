package com.fk.util;

/**
 * Created by fengkai on 25/04/17.
 */
public class StringUtil {

    public static String blankOrEmpty(String str) {
        if (str == null || "".equals(str)) {
            return "";
        } else {
            return str;
        }
    }

    public static String blankOrEmpty(String str, String defStr) {
        if (str == null || "".equals(str)) {
            return defStr;
        } else {
            return str;
        }
    }
    public static String suffix(String str) {
        return str.substring(str.lastIndexOf(".")+1);
    }

    public static String subString(String url) {
        int start = url.indexOf("webapps");
        return url.substring(start+7);
    }

    public static void main(String[] args) {
        System.out.println(StringUtil.subString("D:/jsp/apache-tomcat-8.0.29/webapps/asdasfdsfd"));

    }
}
