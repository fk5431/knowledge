package com.fk.util;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by fengkai on 13/02/17.
 */
public class MD5 {

    public static String encodeMD5(String data){
        return DigestUtils.md5Hex(data);
    }

    public static void main(String[] args) {
        System.out.println(encodeMD5("123456"));
    }
}
