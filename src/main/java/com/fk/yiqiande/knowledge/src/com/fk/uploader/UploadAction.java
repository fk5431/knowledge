package com.fk.uploader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.struts2.ServletActionContext;
import org.apache.xmlbeans.XmlException;
import org.junit.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.fk.bean.file.UploadFile;
import com.fk.bean.user.User;
import com.fk.dao.upload.UploadDao;
import com.fk.elasticsearch.DataFactory;
import com.fk.extract.ExtractTextFromHtml;
import com.fk.extract.ExtractTextFromOffice;
import com.fk.extract.ExtractTextFromPDF;
import com.fk.other.CopyFlv;
import com.fk.preview.ConvertSingleVideo;
import com.fk.preview.DocConverter;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	private File myFile;
	private UploadFile file;
	private String myFileContentType; // 文件的内容类型
	private String myFileFileName; // 上传文件名
	private int typeerror;

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public UploadFile getFile() {
		return file;
	}

	public void setFile(UploadFile file) {
		this.file = file;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public int getTypeerror() {
		return typeerror;
	}

	public void setTypeerror(int typeerror) {
		this.typeerror = typeerror;
	}

	public String execute() {
		String word = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		User user = (User) request.getSession().getAttribute("user");
		Timestamp d = new Timestamp(System.currentTimeMillis());
		if (this.getMyFileFileName() != null)
			this.setMyFileFileName(this.getMyFileFileName().replace(" ", ""));// 出去文件名称中的空格
		else {
			this.setTypeerror(5);
			return "NULL";
		}
		file.setFname(this.getMyFileFileName());
		if (user == null) {
			this.setTypeerror(20);
			return "USERERROR";
		}
		file.setUid(user.getUid());
		file.setUuidname(getuuid(file.getFname()));
		file.setUploadtime(d);
		String path = null;
		path = "D:/upload/" + file.getKtypeid() + "/" + file.getFtypeid() + "/"
				+ file.getFname().hashCode() % 500;
		file.setUrl(path);
		// System.out.println(path);
		String type = file.getFname().substring(
				file.getFname().lastIndexOf(".") + 1, file.getFname().length());// 文件类型的后缀名
		boolean flag = check(type);// 文件类型 和分类时候正确
		if (flag == false) {
			this.setTypeerror(10);
			return "TYPEERROR";
		}

		/* Copy file to a safe location */
		try {
			File destFile = new File(path, file.getUuidname());
			FileUtils.copyFile(myFile, destFile);
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}

		String pat = request.getSession().getServletContext().getRealPath("")
				.replace("\\", "/");
		if (file.getFtypeid() == 0) {
			if (type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("dot")) {
				try {
					word = ExtractTextFromOffice.extractTextFromDOC(path + "/"
							+ file.getUuidname());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("docx")
					|| type.equalsIgnoreCase("docm")
					|| type.equalsIgnoreCase("dotx")) {
				try {
					word = ExtractTextFromOffice.extractTextFromDOC2007(path
							+ "/" + file.getUuidname());
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
					word = ExtractTextFromOffice.extractTextFromXLS(path + "/"
							+ file.getUuidname());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("xlsx")
					|| type.equalsIgnoreCase("xlsm")) {
				try {
					word = ExtractTextFromOffice.extractTextFromXLS2007(path
							+ "/" + file.getUuidname());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("pdf")) {
				word = new ExtractTextFromPDF().readPDF(path + "/"
						+ file.getUuidname());
			}
			if (type.equalsIgnoreCase("pdf") || type.equalsIgnoreCase("doc")
					|| type.equalsIgnoreCase("docx")
					|| type.equalsIgnoreCase("xls")
					|| type.equalsIgnoreCase("xlsm")
					|| type.equalsIgnoreCase("xlsx")
					|| type.equalsIgnoreCase("ppt")
					|| type.equalsIgnoreCase("wps")) {
				String outputPath = pat + "upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500;
				DocConverter converter = new DocConverter(file.getUrl() + "/"
						+ file.getUuidname());
				converter.setFirst(outputPath);
				converter.setSecond(file.getUuidname().substring(0,
						file.getUuidname().lastIndexOf("."))
						+ ".swf");
				converter.conver();
				file.setUrl_transforms("upload/"
						+ file.getKtypeid()
						+ "/"
						+ file.getFtypeid()
						+ "/"
						+ file.getFname().hashCode()
						% 500
						+ "/"
						+ file.getUuidname().substring(0,
								file.getUuidname().lastIndexOf(".")) + ".swf");
			} else
				file.setUrl_transforms("");
			if (type.equalsIgnoreCase("pdf"))
				word = new ExtractTextFromPDF().readPDF(file.getUrl());
			file.setUrl_image("img/txt.png");
		}
		if (file.getFtypeid() == 1) {
			try {
				String pa = pat + "upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500;
				File destFile = new File(pa, file.getUuidname());
				FileUtils.copyFile(myFile, destFile);
				file.setUrl_image("upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500 + "/" + file.getUuidname());
				file.setUrl_transforms(file.getUrl_image());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (file.getFtypeid() == 2) {
			try {
				String pa = pat + "upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500;
				File destFile = new File(pa, file.getUuidname());
				FileUtils.copyFile(myFile, destFile);
				file.setUrl_transforms("upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500 + "/" + file.getUuidname());
				file.setUrl_image("img/m.png");
				System.out.println(file.getUrl_transforms());
			} catch (IOException e) {
				e.printStackTrace();
			}
			// file.setUrl_transforms(file.getUrl() + "/" + file.getUuidname());
		}
		if (file.getFtypeid() == 3) {
			String pa = pat + "upload/" + file.getKtypeid() + "/"
					+ file.getFtypeid() + "/" + file.getFname().hashCode()
					% 500;
			ConvertSingleVideo conver = new ConvertSingleVideo(file.getUrl()
					+ "/" + file.getUuidname());
			ConvertSingleVideo.processImg(
					file.getUrl() + "/" + file.getUuidname(), file.getUrl()
							+ "/" + file.getUuidname(), 10);
			try {
				Thread.sleep(1000);
				File destFile = new File(pa, file.getUuidname()+".jpg");
				FileUtils.copyFile(new File(file.getUrl()
						+ "/" + file.getUuidname() + ".jpg"), destFile);
				file.setUrl_image("upload/" + file.getKtypeid() + "/"
						+ file.getFtypeid() + "/" + file.getFname().hashCode()
						% 500 + "/" + file.getUuidname()+".jpg");
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(file.getUrl_image());
			
			conver.convert(
					file.getUrl() + "/" + file.getUuidname(),
					file.getUrl()
							+ "/"
							+ file.getUuidname().substring(0,
									file.getUuidname().lastIndexOf("."))
							+ ".flv");
//			file.setUrl_transforms(file.getUrl()+"/"+ file.getUuidname().substring(0,
//							file.getUuidname().lastIndexOf("."))
//					+ ".flv");
			CopyFlv copyFlv = new CopyFlv(file.getUrl() + "/" + file.getUuidname(), 
					pa + "/"
							+ file.getUuidname().substring(0,
									file.getUuidname().lastIndexOf("."))
							+ ".flv");
			copyFlv.start();
			file.setUrl_transforms("upload/" + file.getKtypeid() + "/"
					+ file.getFtypeid() + "/" + file.getFname().hashCode()
					% 500
					+ "/"
					+ file.getUuidname().substring(0,
							file.getUuidname().lastIndexOf("."))
					+ ".flv");
			System.out.println(file.getUrl_transforms());
		}
		if (file.getFtypeid() == 4) {
			file.setUrl_transforms(null);
			file.setUrl_image("img/z.png");
		}
		if (file.getFtypeid() == 5) {
			file.setUrl_transforms(null);
			file.setUrl_image("img/k.png");
		}
		if (file.getTitle().equals(""))
			file.setTitle(file.getFname());
		UploadDao dao = new UploadDao();
		int num = dao.saveFile(file);
		file.setFid(dao.getFid());
		String[] str = file.getTags().split(", ");
		dao.saveTags(str, user.getUid());
		dao.saveKtype(file.getKtypeid());
		/****************************************************/
		// 插入elasticsearch中信息
		DataFactory dataFactory = new DataFactory();
		dataFactory.addelasticsearche(file.getFid(), file.getUid(),
				file.getTitle(), file.getTags(), file.getAbstracString(),
				file.getIntroduction(), word);
		/****************************************************/
		if (num == 1)
			return SUCCESS;
		else
			return ERROR;
	}

	private boolean check(String type) {
		boolean flag = false;
		if (type.equalsIgnoreCase("bat") || type.equalsIgnoreCase("dll")
				|| type.equalsIgnoreCase("doc") || type.equalsIgnoreCase("fon")
				|| type.equalsIgnoreCase("html")
				|| type.equalsIgnoreCase("htm") || type.equalsIgnoreCase("ini")
				|| type.equalsIgnoreCase("js") || type.equalsIgnoreCase("c")
				|| type.equalsIgnoreCase("ppt") || type.equalsIgnoreCase("cpp")
				|| type.equalsIgnoreCase("pub") || type.equalsIgnoreCase("txt")
				|| type.equalsIgnoreCase("vbs") || type.equalsIgnoreCase("wri")
				|| type.equalsIgnoreCase("docx")
				|| type.equalsIgnoreCase("pptx")
				|| type.equalsIgnoreCase("dot")
				|| type.equalsIgnoreCase("docm")
				|| type.equalsIgnoreCase("dotx")
				|| type.equalsIgnoreCase("chm") || type.equalsIgnoreCase("css")
				|| type.equalsIgnoreCase("dcx") || type.equalsIgnoreCase("dic")
				|| type.equalsIgnoreCase("h") || type.equalsIgnoreCase("xls")
				|| type.equalsIgnoreCase("xlsx")
				|| type.equalsIgnoreCase("pdf")
				|| type.equalsIgnoreCase("xlsm"))
			if (file.getFtypeid() == 0)
				flag = true;
		if (type.equalsIgnoreCase("BMP") || type.equalsIgnoreCase("GIF")
				|| type.equalsIgnoreCase("JPGE")|| type.equalsIgnoreCase("JPEG")
				|| type.equalsIgnoreCase("JPG")
				|| type.equalsIgnoreCase("TIFF")
				|| type.equalsIgnoreCase("PSD") || type.equalsIgnoreCase("PNG")
				|| type.equalsIgnoreCase("SVG") || type.equalsIgnoreCase("eps")
				|| type.equalsIgnoreCase("raw") || type.equalsIgnoreCase("pdf")
				|| type.equalsIgnoreCase("pxr") || type.equalsIgnoreCase("tga")
				|| type.equalsIgnoreCase("vst") || type.equalsIgnoreCase("pcd")
				|| type.equalsIgnoreCase("pct") || type.equalsIgnoreCase("ai")
				|| type.equalsIgnoreCase("fpx") || type.equalsIgnoreCase("img")
				|| type.equalsIgnoreCase("ico"))
			if (file.getFtypeid() == 1)
				flag = true;
		if (type.equalsIgnoreCase("cda") || type.equalsIgnoreCase("wav")
				|| type.equalsIgnoreCase("mp3") || type.equalsIgnoreCase("mid")
				|| type.equalsIgnoreCase("wma") || type.equalsIgnoreCase("ra")
				|| type.equalsIgnoreCase("rm") || type.equalsIgnoreCase("rmx")
				|| type.equalsIgnoreCase("vqf") || type.equalsIgnoreCase("ogg")
				|| type.equalsIgnoreCase("flac")
				|| type.equalsIgnoreCase("ape"))
			if (file.getFtypeid() == 2)
				flag = true;
		if (type.equalsIgnoreCase("MPEG") || type.equalsIgnoreCase("MPG")
				|| type.equalsIgnoreCase("DAT") || type.equalsIgnoreCase("AVI")
				|| type.equalsIgnoreCase("MOV") || type.equalsIgnoreCase("ASF")
				|| type.equalsIgnoreCase("WMV")
				|| type.equalsIgnoreCase("NAVI")
				|| type.equalsIgnoreCase("3GP") || type.equalsIgnoreCase("RA")
				|| type.equalsIgnoreCase("RAM") || type.equalsIgnoreCase("MKV")
				|| type.equalsIgnoreCase("FLV") || type.equalsIgnoreCase("F4V")
				|| type.equalsIgnoreCase("RMVB")
				|| type.equalsIgnoreCase("WebM")
				|| type.equalsIgnoreCase("mp4") || type.equalsIgnoreCase("rm"))
			if (file.getFtypeid() == 3)
				flag = true;
		if (type.equalsIgnoreCase("rar") || type.equalsIgnoreCase("zip")
				|| type.equalsIgnoreCase("7z") || type.equalsIgnoreCase("cab")
				|| type.equalsIgnoreCase("arj") || type.equalsIgnoreCase("lzh")
				|| type.equalsIgnoreCase("tar") || type.equalsIgnoreCase("gz")
				|| type.equalsIgnoreCase("ace") || type.equalsIgnoreCase("uue")
				|| type.equalsIgnoreCase("bz2") || type.equalsIgnoreCase("jar")
				|| type.equalsIgnoreCase("iso") || type.equalsIgnoreCase("mpq"))
			if (file.getFtypeid() == 4)
				flag = true;
		if (file.getFtypeid() == 5)
			flag = true;

		return flag;
	}

	private String getuuid(String name) {
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString() + "_" + name;
		return str;
	}

	private void saveFile(File source, File dest) throws Exception {
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new FileInputStream(source);
			os = new FileOutputStream(dest);
			byte[] buffer = new byte[1024];
			int length;
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			is.close();
			os.close();
		}
	}
}