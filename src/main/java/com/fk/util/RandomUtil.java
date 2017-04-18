package com.fk.util;

import java.util.Random;

/**
 * Created by fengkai on 18/04/17.
 */
public class RandomUtil {

    public static String Random(){
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
        return sb.toString();
    }

}
