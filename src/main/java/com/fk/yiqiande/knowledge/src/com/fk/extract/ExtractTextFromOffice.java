package com.fk.extract;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.xmlbeans.XmlException;

public class ExtractTextFromOffice {
	public static void main(String[] args) throws IOException, XmlException, OpenXML4JException {
		String wordFile = "C:/Users/fengkai/Desktop/shuju/dotx.dotx";
//		String word = ExtractTextFromOffice.extractTextFromDOC(wordFile);
		String word = ExtractTextFromOffice.extractTextFromDOC2007(wordFile);
//		String word = ExtractTextFromOffice.extractTextFromXLS(wordFile);
//		String word = null;
//		try {
//			word = ExtractTextFromOffice.extractTextFromXLS2007(wordFile);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		System.out.println(word);
	}

	/**
	 * word 2003
	 * 
	 * @throws IOException
	 */
	public static String extractTextFromDOC(String wordFile) throws IOException {
		InputStream is = new FileInputStream(wordFile);
		WordExtractor ex = new WordExtractor(is);
		return ex.getText();
	}

	/**
	 * word 2007
	 * 
	 * @throws IOException
	 * @throws OpenXML4JException
	 * @throws XmlException
	 */
	public static String extractTextFromDOC2007(String fileName)
			throws IOException, XmlException, OpenXML4JException {
		OPCPackage opcPackage = POIXMLDocument.openPackage(fileName);
		POIXMLTextExtractor ex = new XWPFWordExtractor(opcPackage);
		return ex.getText();
	}

	/**
	 * ��excel 2003�ĵ�����ȡ���ı�
	 * 
	 * @throws IOException
	 * 
	 */
	public static String extractTextFromXLS(String wordFile) throws IOException {
		InputStream is = new FileInputStream(wordFile);
		StringBuffer content = new StringBuffer();
		HSSFWorkbook workbook = new HSSFWorkbook(is); // ������Excel�������ļ�������

		for (int numSheets = 0; numSheets < workbook.getNumberOfSheets(); numSheets++) {
			if (null != workbook.getSheetAt(numSheets)) {
				HSSFSheet aSheet = workbook.getSheetAt(numSheets); // ���һ��sheet

				for (int rowNumOfSheet = 0; rowNumOfSheet <= aSheet
						.getLastRowNum(); rowNumOfSheet++) {
					if (null != aSheet.getRow(rowNumOfSheet)) {
						HSSFRow aRow = aSheet.getRow(rowNumOfSheet); // ���һ��

						for (short cellNumOfRow = 0; cellNumOfRow <= aRow
								.getLastCellNum(); cellNumOfRow++) {
							if (null != aRow.getCell(cellNumOfRow)) {
								HSSFCell aCell = aRow.getCell(cellNumOfRow); // �����ֵ

								if (aCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
									content.append(aCell.getNumericCellValue());
								} else if (aCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
									content.append(aCell.getBooleanCellValue());
								} else {
									content.append(aCell.getStringCellValue());
								}
							}
						}
					}
				}
			}
		}
		return content.toString();
	}

	/**
	 * ��excel 2007�ĵ�����ȡ���ı�
	 */
	public static String extractTextFromXLS2007(String fileName)
			throws Exception {
		StringBuffer content = new StringBuffer();

		// ���� XSSFWorkbook ����strPath �����ļ�·��
		XSSFWorkbook xwb = new XSSFWorkbook(fileName);

		// ѭ��������Sheet
		for (int numSheet = 0; numSheet < xwb.getNumberOfSheets(); numSheet++) {
			XSSFSheet xSheet = xwb.getSheetAt(numSheet);
			if (xSheet == null) {
				continue;
			}

			// ѭ����Row
			for (int rowNum = 0; rowNum <= xSheet.getLastRowNum(); rowNum++) {
				XSSFRow xRow = xSheet.getRow(rowNum);
				if (xRow == null) {
					continue;
				}

				// ѭ����Cell
				for (int cellNum = 0; cellNum <= xRow.getLastCellNum(); cellNum++) {
					XSSFCell xCell = xRow.getCell(cellNum);
					if (xCell == null) {
						continue;
					}

					if (xCell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
						content.append(xCell.getBooleanCellValue());
					} else if (xCell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
						content.append(xCell.getNumericCellValue());
					} else {
						content.append(xCell.getStringCellValue());
					}
				}
			}
		}

		return content.toString();
	}
}
