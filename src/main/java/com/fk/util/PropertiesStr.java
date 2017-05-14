package com.fk.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by fengkai on 21/04/17.
 */
// 配置文件常量初始化类
public class PropertiesStr {

    public static String account = "";

    public static String authcode = "";
    public static String mailserver = "";
    public static String emailcontenttype = "";
    public static String office = "";

    public void initProperties() throws IOException {

        Properties prop = new Properties();
        InputStream is = this.getClass().getResourceAsStream("/config.properties");
        prop.load(is);
        PropertiesStr.account = prop.getProperty("account");
        PropertiesStr.authcode = prop.getProperty("authcode");
        PropertiesStr.mailserver = prop.getProperty("mailserver");
        PropertiesStr.emailcontenttype = prop.getProperty("emailcontenttype");
        PropertiesStr.office = prop.getProperty("office");
    }

}
