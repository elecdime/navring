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
    private int MemberCount;// 회어ㅜㄴ수
    private String searchCulumn; //컬럼
	private String searchText; // 텍스트
	private String subdate;
}
