package com.bbs.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Object id; //디스코드 고유 ID
    private Object username; // 유저의 디스코드 이름
    private Object nickname; // 니아단에 등록한 닉네임
    private Object name; // 유저의 로스트 아크 닉네임
    private Object lv; //레벨
    private Object role; //직업
    private Object _id; //없어도되는거
    private String last_tobal; // 마지막 토벌전 참여일
    private String issu; // 특별사유?
    private int yellowCard; // 경고 횟수
    private String yellowCardWhy;  //경고 사유
    private String real_tobal; // 님 진짜 토벌전함?
    private String sooncut; // 기여도 미달인원
    private int MemberCount,a;// 회어ㅜㄴ수
    private String searchCulumn; //컬럼
	private String searchText; // 텍스트
	private String subdate,aid,apw,regdate;
	public Object getId() {
		return id;
	}
	public void setId(Object id) {
		this.id = id;
	}
	public Object getUsername() {
		return username;
	}
	public void setUsername(Object username) {
		this.username = username;
	}
	public Object getNickname() {
		return nickname;
	}
	public void setNickname(Object nickname) {
		this.nickname = nickname;
	}
	public Object getName() {
		return name;
	}
	public void setName(Object name) {
		this.name = name;
	}
	public Object getLv() {
		return lv;
	}
	public void setLv(Object lv) {
		this.lv = lv;
	}
	public Object getRole() {
		return role;
	}
	public void setRole(Object role) {
		this.role = role;
	}
	public Object get_id() {
		return _id;
	}
	public void set_id(Object _id) {
		this._id = _id;
	}
	public String getLast_tobal() {
		return last_tobal;
	}
	public void setLast_tobal(String last_tobal) {
		this.last_tobal = last_tobal;
	}
	public String getIssu() {
		return issu;
	}
	public void setIssu(String issu) {
		this.issu = issu;
	}
	public int getYellowCard() {
		return yellowCard;
	}
	public void setYellowCard(int yellowCard) {
		this.yellowCard = yellowCard;
	}
	public String getYellowCardWhy() {
		return yellowCardWhy;
	}
	public void setYellowCardWhy(String yellowCardWhy) {
		this.yellowCardWhy = yellowCardWhy;
	}
	public String getReal_tobal() {
		return real_tobal;
	}
	public void setReal_tobal(String real_tobal) {
		this.real_tobal = real_tobal;
	}
	public String getSooncut() {
		return sooncut;
	}
	public void setSooncut(String sooncut) {
		this.sooncut = sooncut;
	}
	public int getMemberCount() {
		return MemberCount;
	}
	public void setMemberCount(int memberCount) {
		MemberCount = memberCount;
	}
	public int getA() {
		return a;
	}
	public void setA(int a) {
		this.a = a;
	}
	public String getSearchCulumn() {
		return searchCulumn;
	}
	public void setSearchCulumn(String searchCulumn) {
		this.searchCulumn = searchCulumn;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getSubdate() {
		return subdate;
	}
	public void setSubdate(String subdate) {
		this.subdate = subdate;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApw() {
		return apw;
	}
	public void setApw(String apw) {
		this.apw = apw;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
