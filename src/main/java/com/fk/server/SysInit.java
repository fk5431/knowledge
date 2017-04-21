package com.fk.server;

import com.fk.util.PropertiesStr;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.IOException;

/**
 * Created by fengkai on 21/04/17.
 */
public class SysInit implements ServletContextListener {
//public class SysInit implements ContextLoaderListener {


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        PropertiesStr prop = new PropertiesStr();
        try {
            prop.initProperties();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
