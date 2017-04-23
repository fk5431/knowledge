package com.fk.preview;

import java.io.BufferedReader;  
import java.io.File;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.util.List;  

import org.apache.commons.io.FileUtils;
public class ConvertSingleVideo {
	private static String mencoder_home = "D:\\transform\\mencoder.exe";
	private static String ffmpeg_home = "D:\\transform\\ffmpeg.exe";//ffmpeg.exe���ŵ�·��
	
	
	public static String inputFile_home = "F:\\java\\work\\jingpinkecheng\\WebRoot\\upload\\input\\";//��ת�����ļ���λ��
//	public static String outputFile_home = "D:\\javaserve\\tomcat\\apache-tomcat-7.0.32\\webapps\\jingpinkecheng\\upload\\output\\";//ת�����flv�ļ����ŵ��ļ���λ��
	public static String outputFile_home = "D:\\result\\";//ת�����flv�ļ����ŵ��ļ���λ��
	private String tempFile_home;//���rm,rmvb���޷�ʹ��ffmpegֱ��ת��Ϊflv�ļ���ת�ɵ�avi�ļ�
	 
	 public ConvertSingleVideo(String tempFilePath){
		 this.tempFile_home = tempFilePath;
	 }

		/** 
	     *  ���ܺ��� 
	     * @param inputFile ��������Ƶ�����·�� 
	     * @param outputFile �������Ƶ�����·�� 
	     * @return 
	     */  
	    public  boolean convert(String inputFile, String outputFile)  
	    {  
	        if (!checkfile(inputFile)) {  
	            System.out.println(inputFile + " is not file");  
	            return false;  
	        }  
	        if (process(inputFile,outputFile)) {  
	            System.out.println("ok");  
	            
	            return true;  
	        }  
	        return false;  
	    }  
	    //����ļ��Ƿ����  
	    private  boolean checkfile(String path) {  
	        File file = new File(path);  
	        if (!file.isFile()) {  
	            return false;  
	        }  
	        return true;  
	    }  
	    /** 
	     * ת������ ���ȼ���ļ����ͣ��ھ������� processFlv����processAVI 
	     * @param inputFile 
	     * @param outputFile 
	     * @return 
	     */  
	    private  boolean process(String inputFile,String outputFile) {  
	        int type = checkContentType( inputFile);  
	        System.out.println(type);
	        boolean status = false;  
	        if (type == 0) {  
	            status = processFLV(inputFile,outputFile);// ֱ�ӽ��ļ�תΪflv�ļ�  
	        } else if (type == 1) {  
	            String avifilepath = processAVI(type,inputFile);  
	            if (avifilepath == null)  
	                return false;// avi�ļ�û�еõ�  
	            status = processFLV(avifilepath,outputFile);// ��aviתΪflv  
	        }  
	        return status;  
	    }  
	    /** 
	     * �����Ƶ���� 
	     * @param inputFile 
	     * @return ffmpeg �ܽ�������0�����ܽ�������1 
	     */  
	    private  int checkContentType(String inputFile) {  
	        String type = inputFile.substring(inputFile.lastIndexOf(".") + 1,inputFile.length()).toLowerCase();  
	        // ffmpeg�ܽ����ĸ�ʽ����asx��asf��mpg��wmv��3gp��mp4��mov��avi��flv�ȣ�  
	        if (type.equals("avi")) {  
	            return 0;  
	        } else if (type.equals("mpg")) {  
	            return 0;  
	        } else if (type.equals("wmv")) {  
	            return 0;  
	        } else if (type.equals("3gp")) {  
	            return 0;  
	        } else if (type.equals("mov")) {  
	            return 0;  
	        } else if (type.equals("mp4")) {  
	            return 0;  
	        } else if (type.equals("asf")) {  
	            return 0;  
	        } else if (type.equals("asx")) {  
	            return 0;  
	        } else if (type.equals("flv")) {  
	            return 0;  
	        }  
	        // ��ffmpeg�޷��������ļ���ʽ(wmv9��rm��rmvb��),  
	        // �������ñ�Ĺ��ߣ�mencoder��ת��Ϊavi(ffmpeg�ܽ�����)��ʽ.  
	        else if (type.equals("wmv9")) {  
	            return 1;  
	        } else if (type.equals("rm")) {  
	            return 1;  
	        } else if (type.equals("rmvb")) {  
	            return 1;  
	        }  
	        return 9;  
	    }  
	    /** 
	     *  ffmepg: �ܽ����ĸ�ʽ����asx��asf��mpg��wmv��3gp��mp4��mov��avi��flv�ȣ� 
	     * @param inputFile 
	     * @param outputFile 
	     * @return 
	     */  
	    private  boolean processFLV(String inputFile,String outputFile) {  
	        if (!checkfile(inputFile)) {  
	            System.out.println(inputFile + " is not file");  
	            return false;  
	        } 
	        File file = new File(outputFile);
	        if(file.exists()){
	        	System.out.println("flv�ļ��Ѿ����ڣ�����ת��");
	        	return true;
	        } else {
	        	System.out.println("����ת����flv�ļ�����");
	        	
	        	List<String> commend = new java.util.ArrayList<String>();  
	 	        //�;���  
	 	        commend.add(ffmpeg_home);
	 	        commend.add("-i");  
	 	        commend.add(inputFile);  
	 	        commend.add("-ab");  
	 	        commend.add("128");  
	 	        commend.add("-acodec");  
	 	        commend.add("libmp3lame");  
	 	        commend.add("-ac");  
	 	        commend.add("1");  
	 	        commend.add("-ar");  
	 	        commend.add("22050");  
	 	        commend.add("-r");  
	 	        commend.add("29.97"); 
	 	        // ������ -qscale 4 Ϊ��õ��ļ���, -qscale 6�Ϳ�����
	 	        commend.add("-qscale");  
	 	        commend.add("8");  
	 	        commend.add("-y");  
	 	        commend.add(outputFile);  
	 	        StringBuffer test=new StringBuffer();  
	 	        for(int i=0;i<commend.size();i++)  
	 	            test.append(commend.get(i)+" ");  
	 	        System.out.println(test);  
	 	        try {  
	 	            ProcessBuilder builder = new ProcessBuilder();  
	 	            builder.command(commend);  
	 	            builder.start(); 
	 	            return true;  
	 	        } catch (Exception e) {  
	 	            e.printStackTrace();  
	 	            return false;  
	 	        }  
	 	       
	        }
	       
	    }  
	    /** 
	     * Mencoder: 
	     * ��ffmpeg�޷��������ļ���ʽ(wmv9��rm��rmvb��),�������ñ�Ĺ��ߣ�mencoder��ת��Ϊavi(ffmpeg�ܽ�����)��ʽ. 
	     * @param type 
	     * @param inputFile 
	     * @return 
	     */  
	    private  String processAVI(int type,String inputFile) {  
	        File file =new File(tempFile_home);  
	        if(file.exists()){
	        	System.out.println("avi�ļ��Ѿ����ڣ�����ת��");
	        	return tempFile_home;
	        }  
	        List<String> commend = new java.util.ArrayList<String>();  
	        commend.add(mencoder_home);  
	        commend.add(inputFile);  
	        commend.add("-oac");  
	        commend.add("mp3lame");  
	        commend.add("-lameopts");  
	        commend.add("preset=64");  
	        commend.add("-ovc");  
	        commend.add("xvid");  
	        commend.add("-xvidencopts");  
	        commend.add("bitrate=600");  
	        commend.add("-of");  
	        commend.add("avi");  
	        commend.add("-o");  
	        commend.add(tempFile_home);  
	        StringBuffer test=new StringBuffer();  
	        for(int i=0;i<commend.size();i++)  
	            test.append(commend.get(i)+" ");  
	        System.out.println(test);  
	        try   
	        {  
	            ProcessBuilder builder = new ProcessBuilder();  
	            builder.command(commend);  
	            Process p=builder.start();  
	            /** 
	             * ���Mencoder���� ��������ʹ����� 
	             * ��Ϊ��Щ����ƽ̨����Ա�׼�����������ṩ���޵Ļ�������С�� 
	             * �����д�ӽ��̵��������������Ѹ�ٳ���ʧ�ܣ�����ܵ����ӽ�����������������������  
	             */  
	            final InputStream is1 = p.getInputStream();  
	            final InputStream is2 = p.getErrorStream();  
	            new Thread() {  
	                public void run() {  
	                    BufferedReader br = new BufferedReader(new InputStreamReader(is1));  
	                    try {  
	                        String lineB = null;  
	                        while ((lineB = br.readLine()) != null ){  
	                            if(lineB != null)System.out.println(lineB);  
	                        }  
	                    } catch (IOException e) {  
	                        e.printStackTrace();  
	                    }  
	                }  
	            }.start();   
	            new Thread() {  
	                public void run() {  
	                    BufferedReader br2 = new BufferedReader(new InputStreamReader(is2));  
	                    try {  
	                        String lineC = null;  
	                        while ( (lineC = br2.readLine()) != null){  
	                            if(lineC != null)System.out.println(lineC);  
	                        }  
	                    } catch (IOException e) {  
	                        e.printStackTrace();  
	                    }  
	                }  
	            }.start();   
	              
	            //��Mencoder����ת���������ٵ���ffmpeg����  
	            p.waitFor();  
	             System.out.println("who cares");  
	            return tempFile_home;  
	        }catch (Exception e){   
	            System.err.println(e);   
	            return null;  
	        }   
	    }
	    /**
		 * ��Ƶ��ͼ
		 * @param veido_path    ��Ƶ·��
		 * @param ffmpeg_path	ffmpeg·��
		 * @param image_name	ͼƬ����·��
		 * @param time			��ͼʱ���
		 * @return
		 */
		public static boolean processImg(String veido_path, String image_name, float time) {
			File file = new File(veido_path);
			if (!file.exists()) {
				return false;
			}
			System.out.println(image_name);
			List<String> commands = new java.util.ArrayList<String>();
			commands.add(ffmpeg_home);
			commands.add("-ss");//SS���������ʼ��ͼ�ٶ����
			commands.add("\""+time+"\"");//������������ý�ȡ��Ƶ������ʱ�Ļ���
			commands.add("-i");
			commands.add(veido_path);
			commands.add("-y");
			commands.add("-f");
			commands.add("image2");
//			commands.add("-t");
//			commands.add("\""+z+"\"");
//			commands.add("-s");
		//	commands.add("700x525");
			commands.add(image_name+".jpg");
			try {
				ProcessBuilder builder = new ProcessBuilder();
				builder.command(commands);
				builder.start();
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
	}  
