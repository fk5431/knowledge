package com.fk.elasticsearch;

import java.io.IOException;

import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;

public class JsonUtil {

    /**
     * ʵ�ֽ�ʵ�����ת����json����
     * @param medicine    Medicine����
     * @return
     */
    public static String obj2JsonData(File file){
        String jsonData = null;
        try {
            //ʹ��XContentBuilder����json����
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