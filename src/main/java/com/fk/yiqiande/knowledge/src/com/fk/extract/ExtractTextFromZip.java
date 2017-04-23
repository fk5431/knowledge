package com.fk.extract;

import java.io.File;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;

public class ExtractTextFromZip {
	private File zipFile;  
	  
    public static void main(String[] args) {  
    	ExtractTextFromZip zipCompressByAnt = new ExtractTextFromZip(  
                "F:\\mmdANT2.zip");  
        zipCompressByAnt.compress("F:\\mmd\\");  
  
        zipCompressByAnt.unZip("F:\\mmdANT2.zip", "F:\\testAnt");  
    }  
  
    public ExtractTextFromZip(String pathName) {  
        zipFile = new File(pathName);  
    }  
  
    /** 
     * 压缩 
     */  
    public void compress(String srcPathName) {  
        File srcdir = new File(srcPathName);  
        if (!srcdir.exists())  
            throw new RuntimeException(srcPathName + "不存在！");  
  
        Project prj = new Project();  
        Zip zip = new Zip();  
        zip.setProject(prj);  
        zip.setDestFile(zipFile);  
        FileSet fileSet = new FileSet();  
        fileSet.setProject(prj);  
        fileSet.setDir(srcdir);  
        // fileSet.setIncludes("**/*.java"); 包括哪些文件或文件夹  
        // eg:zip.setIncludes("*.java");  
        // fileSet.setExcludes(...); 排除哪些文件或文件夹  
        zip.addFileset(fileSet);  
        zip.execute();  
    }  
  
    /**  
     * 解压  
     * @param sourceZip   待解压文件路径  
     * @param destDir     解压到的路径  
     */  
    public void unZip(String sourceZip, String destDir) {  
        // 保证文件夹路径最后是"/"或者"\"  
        char lastChar = destDir.charAt(destDir.length() - 1);  
        if (lastChar != '/' && lastChar != '\\') {  
            destDir += File.separator;  
        }  
        Project p = new Project();  
        Expand e = new Expand();  
        e.setProject(p);  
        e.setSrc(new File(sourceZip));   
        e.setOverwrite(false);   
        e.setDest(new File(destDir));  
        e.setSrc(new File(sourceZip));  
        e.setOverwrite(false);  
        e.setDest(new File(destDir));  
        /* 
        ant下的zip工具默认压缩编码为UTF-8编码， 
        而winRAR软件压缩是用的windows默认的GBK或者GB2312编码 
        所以解压缩时要制定编码格式 
        */  
        e.setEncoding("utf-8");  
        e.execute();  
    }  
}
