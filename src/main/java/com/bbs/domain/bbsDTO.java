package com.bbs.domain;


import java.sql.Timestamp;
import java.util.Date;


public class bbsDTO {
	private int bbsno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regDate;
	private int viewCnt;
	private String fimeName;
	private int bbsGroup ;
	private int bbsStep;
	private int bbsDent,cateCode;
	private String cateName,cateCodeRef,img,imgs,board_parent_seq,board_parent; 
	
	//페이징
	
	
	
	
	public String getBoard_parent() {
		return board_parent;
	}
	public void setBoard_parent(String board_parent) {
		this.board_parent = board_parent;
	}
	public String getBoard_parent_seq() {
		return board_parent_seq;
	}
	public void setBoard_parent_seq(String board_parent_seq) {
		this.board_parent_seq = board_parent_seq;
	}
	private String notice,startDate,endDate;

	private int file_no,  fileSize;
	private String orgfile,savefile,delfile;
	
	public int getFile_no() {
		return file_no;
	}
	public void setFile_no(int file_no) {
		this.file_no = file_no;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public int getCateCode() {
		return cateCode;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public int getBbsno() {
		return bbsno;
	}
	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	public String getFimeName() {
		return fimeName;
	}
	public void setFimeName(String fimeName) {
		this.fimeName = fimeName;
	}
	public int getBbsGroup() {
		return bbsGroup;
	}
	public void setBbsGroup(int bbsGroup) {
		this.bbsGroup = bbsGroup;
	}
	public int getBbsStep() {
		return bbsStep;
	}
	public void setBbsStep(int bbsStep) {
		this.bbsStep = bbsStep;
	}
	public int getBbsDent() {
		return bbsDent;
	}
	public void setBbsDent(int bbsDent) {
		this.bbsDent = bbsDent;
	}
}
