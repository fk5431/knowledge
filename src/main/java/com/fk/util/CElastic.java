package com.fk.util;

import com.alibaba.fastjson.JSON;
import com.fk.bean.ESFileBean;
import com.google.common.collect.Lists;
import org.elasticsearch.action.delete.DeleteRequestBuilder;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.action.update.UpdateRequestBuilder;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by FK on 2017/5/21.
 * ElasticSearch 工具类
 */
public class CElastic {

    public static CElastic elastic;
    public static String ES_CLUSTER_NAME;
    public static String es_index;
    public static String[] INDEX;
//    public static String[] ES_HOSTS;
    public static String ES_HOSTS;
    public TransportClient client;

    private static Logger logger = LoggerFactory.getLogger(CElastic.class);
    private CElastic() {

    }

    public static CElastic elastic() {
        return elastic;
    }

    public static CElastic inital(){
        try {
            elastic = new CElastic();
            ES_HOSTS = PropertiesStr.esHosts;
            ES_CLUSTER_NAME = PropertiesStr.clusterName;
            es_index = PropertiesStr.esIndex;
            INDEX = new String[]{es_index};
            // inital ElasticSearch cluster client.
            logger.info("=============init elasticsearch cluster connect =======");
            Settings settings = ImmutableSettings.settingsBuilder()
                    .put("client.transport.sniff", true)
                    .put("cluster.name", ES_CLUSTER_NAME).build();
            TransportClient client = new TransportClient(settings);
            //集群
//            InetSocketTransportAddress[] addresses = new InetSocketTransportAddress[ES_HOSTS.length];
//            for (int i = 0; i < ES_HOSTS.length; i++) {
//                String[] hps = ES_HOSTS[i].split(":");
//                addresses[i] = new InetSocketTransportAddress(hps[0], Integer.valueOf(hps[1]));
//            }
//            elastic.client = client.addTransportAddresses(addresses);
            String[] echost = ES_HOSTS.split(":");
            InetSocketTransportAddress inet = new InetSocketTransportAddress(echost[0],Integer.parseInt(echost[1]));
//            elastic.client = client.addTransportAddress(new InetSocketTransportAddress("127.0.0.1", 9300));
            elastic.client = client.addTransportAddress(inet);
            logger.info("=====  ES init　success　-======");
        }catch (Exception e){
            e.printStackTrace();
        }
        return elastic;
    }

    public boolean insert(ESFileBean fileBean){
            IndexResponse indexResponse = client
                    .prepareIndex(es_index, "file", String.valueOf(fileBean.getFid()))
                    .setSource(JSON.toJSONString(fileBean)).execute().actionGet();
       return indexResponse.isCreated();
    }
    public boolean delete(int id){
        DeleteRequestBuilder builder = client.prepareDelete(es_index, "file", String.valueOf(id));
        return  builder.get().isFound();
    }
    public boolean delete(String table, String id) {
        return delete(es_index,table,id);
    }

    public boolean delete(String index,String table, String id) {
        DeleteRequestBuilder builder = client.prepareDelete(index, table, id);
        return builder.get().isFound();
    }

    public boolean index(String table, String id, Object object) {
        IndexResponse response = client.prepareIndex(es_index, table, id).setSource(JSON.toJSONString(object)).get();
        return response.isCreated();
    }
    public boolean index(String table, String id, Object object,String parent) {
        IndexResponse response = client.prepareIndex(es_index, table, id).setSource(JSON.toJSONString(object)).setParent(parent).get();
        return response.isCreated();
    }
    //全文检索
    public List<String> searchAll(String str){
        List<String> list = Lists.newArrayList();
        SearchResponse searchResponse = client.prepareSearch(es_index)
                .setTypes("file")
//                .setQuery(QueryBuilders.matchAllQuery())
                .setQuery(QueryBuilders.queryStringQuery(str))
                .setSearchType(SearchType.QUERY_THEN_FETCH)
                .get();
        SearchHits hits = searchResponse.getHits();
        long total = hits.getTotalHits();
        System.out.println(total);
        SearchHit[] searchHits = hits.hits();
        for(SearchHit s : searchHits){
            list.add(s.getSourceAsString());
//            System.out.println(s.getSourceAsString());
        }
        return list;
    }
    //组合查询
    public List<String> groupSearch(String[] bools, String[] sections, String[] words){
        List<String> list = Lists.newArrayList();
        BoolQueryBuilder bqb = QueryBuilders.boolQuery()
                .must(QueryBuilders.termQuery(sections[0], words[0]));
//                .mustNot(QueryBuilders.termQuery("", ""))
//                .should(QueryBuilders.termQuery("", ""));
        for(int i=0;i<bools.length;i++){
            if(CommonConst.AND.equals(bools[i])){
                bqb =  bqb.must(QueryBuilders.termQuery(sections[i+1], words[i+1]));
            }else if(CommonConst.OR.equals(bools[i])){
                bqb =  bqb.should(QueryBuilders.termQuery(sections[i+1], words[i+1]));
            }else if(CommonConst.NOT.equals(bools[i])){
                bqb =  bqb.mustNot(QueryBuilders.termQuery(sections[i+1], words[i+1]));
            }
        }
        QueryBuilder qb = bqb;
        SearchResponse searchResponse = client.prepareSearch(es_index)
                .setTypes("file")
//                .setQuery(QueryBuilders.matchAllQuery())
                .setQuery(qb)
//                .setSearchType(SearchType.QUERY_THEN_FETCH)
                    .get();
        SearchHits hits = searchResponse.getHits();
        long total = hits.getTotalHits();
        System.out.println(total);
        SearchHit[] searchHits = hits.hits();
        for(SearchHit s : searchHits){
            list.add(s.getSourceAsString());
        }
        return list;
    }
    public boolean update(String table, String id, Map<String, Object> hash) {
        UpdateRequestBuilder builder = client.prepareUpdate(es_index, table, id);
        builder.setDoc(hash);
        builder.setRetryOnConflict(5);
        return builder.get().isCreated();
    }


    public static String obj2JsonUserData(String posx, String posy) {
        String jsonData = null;
        try {
            // 使用XContentBuilder创建json数据
            XContentBuilder jsonBuild = XContentFactory.jsonBuilder();
            jsonBuild.startObject().startArray("location").value(Double.parseDouble(posx)).value(Double.parseDouble(posy)).endArray()
                    .endObject();
            jsonData = jsonBuild.string();
            System.out.println(jsonData);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonData;
    }

}
