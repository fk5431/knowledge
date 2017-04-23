package com.fk.elasticsearch;

import java.io.IOException;

import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;

public class JsonUtil {

    /**
     * 实现将实体对象转换成json对象
     * @param medicine    Medicine对象
     * @return
     */
    public static String obj2JsonData(File file){
        String jsonData = null;
        try {
            //使用XContentBuilder创建json数据
            XContentBuilder jsonBuild = XContentFactory.jsonBuilder();
            jsonBuild.startObject()
            .field("fid",file.getFid())
            .field("uid", file.getUid())
            .field("title",file.getTitle())
            .field("tags", file.getTitle())
            .field("abstracString", file.getAbstracString())
            .field("introducting", file.getIntroducting())
            .endObject();
            jsonData = jsonBuild.string();
          //  System.out.println(jsonData);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonData;
    }

}