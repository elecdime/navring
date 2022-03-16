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
	private String cateName ,cateCodeRef,cateMax,cateMin,cateCode;
	 private int calid;
	 private String nickname;
	
	/*set/get메서드*/
    }