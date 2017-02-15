package com.fk.util;

import java.util.Random;

/**
 * Created by fengkai on 13/02/17.
 */
public class Test {
    public static String str = "1486977316030@15275247807@163.com";

    public static void main(String[] args) {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<8;i++){
            int num = random.nextInt(53);
            if(num % 2 == 0){
                sb.append((char)('A' + num));
            }else{
                sb.append(random.nextInt(10));
            }
        }
        System.out.println(sb.toString());

    }
}
