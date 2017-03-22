package com.fk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by fengkai on 22/03/17.
 */

@Controller
public class InfoC {

    @RequestMapping("/iinfo")
    public String info(Map<Object, String> map ){

        return "info";
    }

}
