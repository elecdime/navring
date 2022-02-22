package com.bbs.domain;

public class FileDTO {


	private int file_no, bbsno , fileSize;
	private String orgfile,savefile,delfile;
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
	}
	public int getBbsno() {
		return bbsno;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getOrgfile() {
		return orgfile;
	}
	public void setOrgfile(String orgfile) {
		this.orgfile = orgfile;
	}
	public String getSavefile() {
		return savefile;
	}
	public void setSavefile(String savefile) {
		this.savefile = savefile;
	}
	public String getDelfile() {
		return delfile;
	}
	public void setDelfile(String delfile) {
		this.delfile = delfile;
	}
	



}
