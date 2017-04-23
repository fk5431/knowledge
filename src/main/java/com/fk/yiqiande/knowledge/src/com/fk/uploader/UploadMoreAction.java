package com.fk.uploader;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.XmlException;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.fk.bean.file.UploadFile;
import com.fk.bean.user.User;
import com.fk.dao.upload.UploadDao;
import com.fk.elasticsearch.DataFactory;
import com.fk.extract.ExtractTextFromOffice;
import com.fk.extract.ExtractTextFromPDF;
import com.fk.preview.ConvertSingleVideo;
import com.fk.preview.DocConverter;
import com.opensymphony.xwork2.ActionSupport;

public class UploadMoreAction extends ActionSupport {
	private File[] myFile;
	private UploadFile file0;
	private UploadFile file1;
	private UploadFile file2;
	private UploadFile file3;
	private UploadFile file4;
	private String[] myFileFileName; // 上传文件名
	private String[] myFileContentType;
	private int typeerror;
	public File[] getMyFile() {
		return myFile;
	}
	public void setMyFile(File[] myFile) {
		this.myFile = myFile;
	}
	public String[] getMyFileFileName() {

		return myFileFileName;
	}
	public void setMyFileFileName(String[] myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public String[] getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String[] myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public UploadFile getFile0() {
		return file0;
	}
	public void setFile0(UploadFile file0) {
		this.file0 = file0;
	}
	public UploadFile getFile1() {
		return file1;
	}
	public void setFile1(UploadFile file1) {
		this.file1 = file1;
	}
	public UploadFile getFile2() {
		return file2;
	}
	public void setFile2(UploadFile file2) {
		this.file2 = file2;
	}
	public UploadFile getFile3() {
		return file3;
	}
	public void setFile3(UploadFile file3) {
		this.file3 = file3;
	}
	public UploadFile getFile4() {
		return file4;
	}
	public void setFile4(UploadFile file4) {
		this.file4 = file4;
	}
	public int getTypeerror() {
		return typeerror;
	}
	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}
	public String execute() {
		String s0 = null;
		if(myFile == null || myFile.length == 0){
			this.setTypeerror(5);
			return "NULL";
		}
		for(int i=0;i<myFile.length;i++){
			if(i == 0){
				s0 = upLoadFile(file0, 0);
				if(!s0.equals("success"))
					return s0;
			}
			if(i==1){
				s0 = upLoadFile(file1, 1);
				if(!s0.equals("success"))
					return s0;
			}
			if(i==2){
				s0 = upLoadFile(file2, 2);
				if(!s0.equals("success"))
					return s0;
			}
			if(i==3){
				s0 = upLoadFile(file3, 3);
				if(!s0.equals("success"))
					return s0;
			}
			if(i==4){
				s0 = upLoadFile(file4, 4);
				if(!s0.equals("success"))
					return s0;
			}
		}
		return SUCCESS;
	}
	private boolean check(String type, UploadFile file) {
		boolean flag = false;
		if(type.equalsIgnoreCase("bat") || type.equalsIgnoreCase("dll") || type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("fon")
				 || type.equalsIgnoreCase("html") || type.equalsIgnoreCase("htm") || type.equalsIgnoreCase("ini") || type.equalsIgnoreCase("js")
				 || type.equalsIgnoreCase("c") || type.equalsIgnoreCase("ppt") || type.equalsIgnoreCase("cpp") || type.equalsIgnoreCase("pub")
				 || type.equalsIgnoreCase("txt") || type.equalsIgnoreCase("vbs") || type.equalsIgnoreCase("wri") || type.equalsIgnoreCase("docx")
				 || type.equalsIgnoreCase("dot")|| type.equalsIgnoreCase("docm")|| type.equalsIgnoreCase("dotx")|| type.equalsIgnoreCase("chm")
				 || type.equalsIgnoreCase("css")|| type.equalsIgnoreCase("dcx")|| type.equalsIgnoreCase("dic")|| type.equalsIgnoreCase("h")
				 || type.equalsIgnoreCase("xls")|| type.equalsIgnoreCase("xlsx")|| type.equalsIgnoreCase("xlsm"))
			if(file.getFtypeid() == 0)
				flag = true;
		if(type.equalsIgnoreCase("BMP") || type.equalsIgnoreCase("GIF") || type.equalsIgnoreCase("JPGE") || type.equalsIgnoreCase("JPG")
				 || type.equalsIgnoreCase("TIFF") || type.equalsIgnoreCase("PSD") || type.equalsIgnoreCase("PNG")  
				 || type.equalsIgnoreCase("SVG") || type.equalsIgnoreCase("eps") || type.equalsIgnoreCase("raw") || type.equalsIgnoreCase("pdf")
				 || type.equalsIgnoreCase("pxr") || type.equalsIgnoreCase("tga") || type.equalsIgnoreCase("vst") || type.equalsIgnoreCase("pcd")
				 || type.equalsIgnoreCase("pct")|| type.equalsIgnoreCase("ai")|| type.equalsIgnoreCase("fpx")|| type.equalsIgnoreCase("img")
				 || type.equalsIgnoreCase("ico"))
			if(file.getFtypeid() == 1)
				flag = true;
		if(type.equalsIgnoreCase("cda") || type.equalsIgnoreCase("wav") || type.equalsIgnoreCase("mp3") || type.equalsIgnoreCase("mid")
				 || type.equalsIgnoreCase("wma") || type.equalsIgnoreCase("ra") || type.equalsIgnoreCase("rm") || type.equalsIgnoreCase("rmx")
				 || type.equalsIgnoreCase("vqf") || type.equalsIgnoreCase("ogg") || type.equalsIgnoreCase("flac") || type.equalsIgnoreCase("ape")
				 )
			if(file.getFtypeid() == 2)
				flag = true;
		if(type.equalsIgnoreCase("MPEG") || type.equalsIgnoreCase("MPG") || type.equalsIgnoreCase("DAT") || type.equalsIgnoreCase("AVI")
				 || type.equalsIgnoreCase("MOV") || type.equalsIgnoreCase("ASF") || type.equalsIgnoreCase("WMV") || type.equalsIgnoreCase("NAVI")
				 || type.equalsIgnoreCase("3GP") || type.equalsIgnoreCase("RA") || type.equalsIgnoreCase("RAM") || type.equalsIgnoreCase("MKV")
				 || type.equalsIgnoreCase("FLV") || type.equalsIgnoreCase("F4V") || type.equalsIgnoreCase("RMVB") || type.equalsIgnoreCase("WebM")
				 || type.equalsIgnoreCase("mp4")|| type.equalsIgnoreCase("rm"))
			if(file.getFtypeid() == 3)
				flag = true;
		if(type.equalsIgnoreCase("rar") || type.equalsIgnoreCase("zip") || type.equalsIgnoreCase("7z") || type.equalsIgnoreCase("cab")
				 || type.equalsIgnoreCase("arj") || type.equalsIgnoreCase("lzh") || type.equalsIgnoreCase("tar") || type.equalsIgnoreCase("gz")
				 || type.equalsIgnoreCase("ace") || type.equalsIgnoreCase("uue") || type.equalsIgnoreCase("bz2") || type.equalsIgnoreCase("jar")
				 || type.equalsIgnoreCase("iso") || type.equalsIgnoreCase("mpq")  )
			if(file.getFtypeid() == 4)
				flag = true;
		if(file.getFtypeid() == 5)
			flag = true;
		
		return flag;
	}
	private String getuuid(String name){
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString() + "_" + name;
		return str;
	}
	private String upLoadFile(UploadFile file, int i) {
		String word = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		User user =(User) request.getSession().getAttribute("user");
		Timestamp d = new Timestamp(System.currentTimeMillis());
		myFileFileName[i] = myFileFileName[i].replace(" ", "");
		file.setFname(myFileFileName[i]);
		if(user == null){
			this.setTypeerror(20);
			return "USERERROR";
		}
		file.setUid(user.getUid());
		file.setUuidname(getuuid(file.getFname()));
		file.setUploadtime(d);
		String path = null;
		path = "D:/upload/"+file.getKtypeid()+"/" +file.getFtypeid()+"/"+file.getFname().hashCode()%500;
		file.setUrl(path);
//		System.out.println(path);
		String type = file.getFname().substring(file.getFname().lastIndexOf(".")+1, file.getFname().length());//文件类型的后缀名
		boolean flag = check(type, file);//文件类型 和分类时候正确
		if(flag == false){
			this.setTypeerror(10);
			return "TYPEERROR";
		}
		
		/* Copy file to a safe location */
		try {
			File destFile = new File(path, file.getUuidname());
			FileUtils.copyFile(myFile[i], destFile);
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		String pat = request.getSession().getServletContext()
				.getRealPath("").replace("\\", "/");
		if(file.getFtypeid() == 0 ){
			if (type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("dot")) {
				try {
					word = ExtractTextFromOffice.extractTextFromDOC(path+"/"+file.getUuidname());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("docx")
					|| type.equalsIgnoreCase("docm")
					|| type.equalsIgnoreCase("dotx")) {
				try {
					word = ExtractTextFromOffice.extractTextFromDOC2007(path+"/"+file.getUuidname());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (XmlException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (OpenXML4JException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("xls")) {
				try {
					word = ExtractTextFromOffice.extractTextFromXLS(path+"/"+file.getUuidname());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("xlsx")
					|| type.equalsIgnoreCase("xlsm")) {
				try {
					word = ExtractTextFromOffice.extractTextFromXLS2007(path+"/"+file.getUuidname());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(type.equalsIgnoreCase("pdf")){
				word = new ExtractTextFromPDF().readPDF(path+"/"+file.getUuidname());
			}
			if (type.equalsIgnoreCase("pdf") || type.equalsIgnoreCase("doc")
					|| type.equalsIgnoreCase("docx")
					|| type.equalsIgnoreCase("xls")
					|| type.equalsIgnoreCase("xlsm")
					|| type.equalsIgnoreCase("xlsx")
					|| type.equalsIgnoreCase("ppt")
					|| type.equalsIgnoreCase("wps")) {
				String outputPath = pat
						+ "upload/" + file.getKtypeid() + "/" + file.getFtypeid() + "/"
								+ file.getFname().hashCode() % 500;
				DocConverter converter = new DocConverter(file.getUrl() + "/" 	+ file.getUuidname());
				converter.setFirst(outputPath);
				converter.setSecond(file.getUuidname().substring(0,file.getUuidname().lastIndexOf(".")) + ".swf");
				converter.conver();
				file.setUrl_transforms("upload/" + file.getKtypeid() + "/" + file.getFtypeid() + "/"
						+ file.getFname().hashCode() % 500+"/"+file.getUuidname().substring(0,file.getUuidname().lastIndexOf(".")) + ".swf");
			} else
				file.setUrl_transforms("");
			if (type.equalsIgnoreCase("pdf"))
				word = new ExtractTextFromPDF().readPDF(file.getUrl());
			file.setUrl_image("img/txt.png");
		}
		if(file.getFtypeid() == 1){
			try {
				String pa = pat + "upload/" + file.getKtypeid() + "/" + file.getFtypeid() + "/"
						+ file.getFname().hashCode() % 500;
				File destFile = new File(pa, file.getUuidname());
				FileUtils.copyFile(myFile[i], destFile);
				file.setUrl_image("upload/" + file.getKtypeid() + "/" + file.getFtypeid() + "/"
						+ file.getFname().hashCode() % 500 + "/" + file.getUuidname());
				file.setUrl_transforms(file.getUrl_image());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(file.getFtypeid() == 2){
			file.setUrl_transforms(file.getUrl() + "/" + file.getUuidname());
			file.setUrl_image("img/m.png");
		}
		if(file.getFtypeid() == 3){
			ConvertSingleVideo.processImg(file.getUrl() + "/" + file.getUuidname(),  file.getUrl() + "/" + file.getUuidname(), 20);
			file.setUrl_image(file.getUrl() + "/" + file.getUuidname()+".jpg");
			ConvertSingleVideo conver = new ConvertSingleVideo(file.getUrl() + "/" + file.getUuidname());
			conver.convert(file.getUrl() + "/" + file.getUuidname(), file.getUrl()+ "/" + file.getUuidname().substring(0,file.getUuidname().lastIndexOf("."))+".flv");
			file.setUrl_transforms(file.getUrl()+ "/" + file.getUuidname().substring(0,file.getUuidname().lastIndexOf("."))+".flv");
		}
		if(file.getFtypeid() == 4){
			file.setUrl_transforms(null);
			file.setUrl_image("img/z.png");
		}
		if(file.getFtypeid() == 5){
			file.setUrl_transforms(null);
			file.setUrl_image("img/k.png");
		}
		if(file.getTitle().equals(""))
			file.setTitle(file.getFname());
		file.setKtypeid(file0.getKtypeid());
		file.setTags(file0.getTags());
		file.setAbstracString(file0.getAbstracString());
		UploadDao dao = new UploadDao();
		int num = dao.saveFile(file);
		String []str = file.getTags().split(", ");
		dao.saveTags(str,user.getUid());
		dao.saveKtype(file.getKtypeid());
		// 插入elasticsearch中信息
		DataFactory dataFactory = new DataFactory();
		dataFactory.addelasticsearche(file.getFid(), file.getUid(), file.getTitle(),
				file.getTags(), file.getAbstracString(),
				file.getIntroduction(), word);
		if(num == 1)
			return SUCCESS;
		else 
			return ERROR;
	}
}