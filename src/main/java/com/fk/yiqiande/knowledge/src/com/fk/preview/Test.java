package com.fk.preview;

import java.io.IOException;

import javax.servlet.http.HttpSession;

public class Test {
	public String showResourceJiaoxueshipin(){
		String fileName = "���μ�.mp4";
//		ConvertSingleVideo conver = new ConvertSingleVideo("F:\\" + fileName.substring(0,fileName.lastIndexOf("."))+".avi");
		ConvertSingleVideo conver = new ConvertSingleVideo("F:\\" + fileName);
//		
//		conver.convert(ConvertSingleVideo.inputFile_home + fileName, ConvertSingleVideo.outputFile_home + fileName.substring(0,fileName.lastIndexOf("."))+".flv");
		boolean flag = conver.convert("F:\\" + fileName, ConvertSingleVideo.outputFile_home + fileName.substring(0,fileName.lastIndexOf("."))+".flv");
		System.out.println(flag);
//		
//		HttpSession session = request.getSession();
//		fileName = new String(fileName.getBytes("UTF-8"),"GBK");//�浽session����jspҳ��ȡ����ֵ��GBK("����")�����������ȱ�����룬�����ȥ֮�󼴿�����
//		session.setAttribute("jiaoxueshipinName",fileName.substring(0,fileName.lastIndexOf("."))+".flv" );
//		System.out.println("���ǲ���:"+session.getAttribute("jiaoxueshipinName"));
		 return "success";
	}
	public static void main(String[] args) {
		new Test().showResourceJiaoxueshipin();
	}
}
