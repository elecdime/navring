package com.bbs.domain;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class Calendar {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start1;
	private String end;
    private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	private String username;
	private String leader_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart1() {
		return start1;
	}
	public void setStart1(String start1) {
		this.start1 = start1;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public boolean isAllday() {
		return allday;
	}
	public void setAllday(boolean allday) {
		this.allday = allday;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
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
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getCateMax() {
		return cateMax;
	}
	public void setCateMax(int cateMax) {
		this.cateMax = cateMax;
	}
	public int getCateMin() {
		return cateMin;
	}
	public void setCateMin(int cateMin) {
		this.cateMin = cateMin;
	}
	public int getCalid() {
		return calid;
	}
	public void setCalid(int calid) {
		this.calid = calid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRuser() {
		return ruser;
	}
	public void setRuser(String ruser) {
		this.ruser = ruser;
	}
	private String cateName ,cateCodeRef,cateCode;
	private int cateMax,cateMin;
	private int calid,rid;
	 private String nickname;
	 private String userid,ruser;
	/*set/get메서드*/
    }