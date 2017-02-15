package com.fk.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * Created by fengkai on 13/02/17.
 */
public class MD5 {

    public static String encodeMD5(String data){
        byte[] b = Base64.encodeBase64(data.getBytes(), true);
        String str = new String(b);
        return str;
    }

    public static String decodeMD5(String data){
        byte[] b = Base64.decodeBase64(data);
        return new String(b);
    }

    public static void main(String[] args) {
        System.out.println(encodeMD5("123456"));
        System.out.println(decodeMD5(encodeMD5("123456")));
    }
}
