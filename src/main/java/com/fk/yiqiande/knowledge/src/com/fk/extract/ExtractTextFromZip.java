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
     * ѹ�� 
     */  
    public void compress(String srcPathName) {  
        File srcdir = new File(srcPathName);  
        if (!srcdir.exists())  
            throw new RuntimeException(srcPathName + "�����ڣ�");  
  
        Project prj = new Project();  
        Zip zip = new Zip();  
        zip.setProject(prj);  
        zip.setDestFile(zipFile);  
        FileSet fileSet = new FileSet();  
        fileSet.setProject(prj);  
        fileSet.setDir(srcdir);  
        // fileSet.setIncludes("**/*.java"); ������Щ�ļ����ļ���  
        // eg:zip.setIncludes("*.java");  
        // fileSet.setExcludes(...); �ų���Щ�ļ����ļ���  
        zip.addFileset(fileSet);  
        zip.execute();  
    }  
  
    /**  
     * ��ѹ  
     * @param sourceZip   ����ѹ�ļ�·��  
     * @param destDir     ��ѹ����·��  
     */  
    public void unZip(String sourceZip, String destDir) {  
        // ��֤�ļ���·�������"/"����"\"  
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
        ant�µ�zip����Ĭ��ѹ������ΪUTF-8���룬 
        ��winRAR���ѹ�����õ�windowsĬ�ϵ�GBK����GB2312���� 
        ���Խ�ѹ��ʱҪ�ƶ������ʽ 
        */  
        e.setEncoding("utf-8");  
        e.execute();  
    }  
}
