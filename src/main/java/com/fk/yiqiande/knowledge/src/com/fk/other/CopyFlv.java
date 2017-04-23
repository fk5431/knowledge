package com.fk.other;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class CopyFlv extends Thread{
	private String old;
	private String ne;
	public void setOld(String old) {
		this.old = old;
	}
	public void setNe(String ne) {
		this.ne = ne;
	}
	public CopyFlv(String old, String ne){
		this.old = old;
		this.ne = ne;
	}

	@Override
	public void run() {
		try {
			Thread.sleep(1000*60*60);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		File f1 = new File(old);
		File f2 = new File(ne);
		try {
			FileUtils.copyFile(f1, f2);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
