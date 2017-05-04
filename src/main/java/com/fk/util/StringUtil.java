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
}
