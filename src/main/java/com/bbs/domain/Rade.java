package com.bbs.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
public class Rade {
 private int id;
 private int calid;
 private String nickname;
 private String userid;
 private String job;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getCalid() {
	return calid;
}
public void setCalid(int calid) {
	this.calid = calid;
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
public String getJob() {
	return job;
}
public void setJob(String job) {
	this.job = job;
}
 
}
