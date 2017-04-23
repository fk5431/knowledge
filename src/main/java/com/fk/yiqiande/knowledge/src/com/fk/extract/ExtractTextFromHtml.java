package com.fk.extract;

import org.htmlparser.Parser;
import org.htmlparser.beans.StringBean;
import org.htmlparser.util.ParserException;

public class ExtractTextFromHtml {

	public String getTopicBlock(String url, String encoding) throws Exception {
		Parser parser = new Parser();
		parser.setURL(url);
		if (null == encoding) {
			parser.setEncoding(parser.getEncoding());
		} else {
			parser.setEncoding(encoding);
		}
		  StringBean bean=new StringBean();
		  bean.setLinks(false);
		  bean.setReplaceNonBreakingSpaces(true);
		  bean.setCollapse(true);
		  try {
		   parser.visitAllNodesWith(bean);
		  } catch (ParserException e) {
		   System.err.println("getHubEntries()-->"+e);
		  }
		  parser.reset();
		  return bean.getStrings();
		 }
	public static void main(String[] args) throws Exception {

		String url = "http://wenku.baidu.com/view/66bc246c1eb91a37f1115cfb.html";

		String s = new ExtractTextFromHtml().getTopicBlock(url, "UTF-8");
		System.out.println(s);
	}
}
