package com.fk.elasticsearch;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.junit.Test;

public class ElasticSearchHandler {
	private static String indexname = "indextest1";
	private static String type = "typetest1";
	private Client client;

	public static String getIndexname() {
		return indexname;
	}

	public static String getType() {
		return type;
	}

	public ElasticSearchHandler() {
		// ʹ�ñ�����Ϊ�ڵ�
		this("127.0.0.1");
	}

	public ElasticSearchHandler(String ipAddress) {
		// ��Ⱥ���ӳ�ʱ����
		/*
		 * Settings settings =
		 * ImmutableSettings.settingsBuilder().put("client.transport.ping_timeout"
		 * , "10s").build(); client = new TransportClient(settings);
		 */
		client = new TransportClient()
				.addTransportAddress(new InetSocketTransportAddress(ipAddress,
						9300));
	}

	/**
	 * ��������,����������֮��,����elasticsearch-0.20.6\data\elasticsearch\nodes\0���������㿴
	 * 
	 * @param indexName
	 *            Ϊ����������һ��es��Ⱥ�п����ж�������⡣ ���Ʊ���ΪСд
	 * @param indexType
	 *            TypeΪ�������ͣ�����������ͬ�������²�ͬ���͵����ݵģ�һ���������¿����ж���������͡�
	 * @param jsondata
	 *            json��ʽ�����ݼ���
	 * 
	 * @return
	 */
	public void createIndexResponse(String indexname, String type,
			List<String> jsondata) {
		// ���������� ��Ҫע�����.setRefresh(true)����һ��Ҫ����,�����һ�ν����������Ҳ�������
		IndexRequestBuilder requestBuilder = client.prepareIndex(indexname,
				type).setRefresh(true);
		for (int i = 0; i < jsondata.size(); i++) {
			//System.out.println(i);
			requestBuilder.setSource(jsondata.get(i)).execute().actionGet();
		}

	}

	/**
	 * ��������
	 * 
	 * @param client
	 * @param jsondata
	 * @return
	 */
	public IndexResponse createIndexResponse(String indexname, String type,
			String jsondata) {
		IndexResponse response = client.prepareIndex(indexname, type)
				.setSource(jsondata).execute().actionGet();
		return response;
	}

	/**
	 * ִ������
	 * 
	 * @param queryBuilder
	 * @param indexname
	 * @param type
	 * @return
	 */
	public List<File> searcher(QueryBuilder queryBuilder, int start) {
		List<File> list = new ArrayList<File>();
		SearchResponse searchResponse = client.prepareSearch(indexname)
				.setTypes(type).setQuery(queryBuilder).setFrom(start)
				.setSize(7).execute().actionGet();
		SearchHits hits = searchResponse.getHits();
		SearchHit[] searchHists = hits.getHits();
		if (searchHists.length > 0) {
			for (SearchHit hit : searchHists) {
				Integer fid = (Integer) hit.getSource().get("fid");
				String title = String.valueOf(hits.getTotalHits());
				list.add(new File(fid, title));
			}
		}
		return list;
	}
	public List<String> getjson() {
		List<String> list = new ArrayList<String>();
		UUID uuid = UUID.randomUUID();
		for (int i = 200001; i < 1000000; i++) {
			String data1 = JsonUtil.obj2JsonData(new File(i,2, uuid.toString(), uuid.toString(),
					uuid.toString(), uuid.toString(), uuid.toString()));
			list.add(data1);
		}
		System.out.println("ok");
		return list;
	}

	public static void main(String[] args) {
		ElasticSearchHandler esHandler = new ElasticSearchHandler();
	//	List<String> jsondata = esHandler.getjson();
	//	esHandler.createIndexResponse(indexname, type, jsondata);
		QueryBuilder queryBuilder = QueryBuilders.queryString("�찲��");// �����ֶβ�ѯ
//		QueryBuilder queryBuilder = QueryBuilders.queryString("�찲��");
//		QueryBuilder queryBuilder1 = QueryBuilders.termQuery("uid", 2);
//		QueryBuilder queryBuilder2 = QueryBuilders.boolQuery().must(queryBuilder).must(queryBuilder);
		List<File> result = esHandler.searcher(queryBuilder, 0);
		System.out.println("s");
		for (File f : result) {
			System.out.println(f.getFid() + " " + f.getTitle() + " " + f.getUid() + " "
					+ f.getTags() + " " + f.getAbstracString() + " "
					+ f.getIntroducting());
		}
	}
}
