package com.fk.extract;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;


public class ExtractTextFromPDF {
	public String readPDF(String filename){
		File file = new File(filename);
		FileInputStream in = null;
		String result = null;
		try {
			in = new FileInputStream(filename);
			PDFParser parser = new PDFParser(in);
			parser.parse();
			PDDocument pdDocument = parser.getPDDocument();
			PDFTextStripper stripper = new PDFTextStripper();
			result = stripper.getText(pdDocument);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	public static void main(String[] args) {
		new ExtractTextFromPDF().readPDF("C:/Users/fengkai/Desktop/shuju/免费下载pdf文件转换工具.pdf");
	}
}
