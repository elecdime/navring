package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.User;
import com.bbs.domain.admin;


@Repository
public class CalenDaoImpl implements CalenDao {
	@Inject
	private SqlSession sql;
	private final static String namespace = "com.bbs.mapper.CalenMapper";
@Override
public List<Calendar> calenList() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".calenList");
}
@Override
public Calendar calView(int id) {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".calView",id);
}
@Override
public void calinsert(Calendar calendar) {
	// TODO Auto-generated method stub
	sql.insert(namespace+".calinsert",calendar);
}
@Override
public List<CategoriDTO> categori() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".categori");
}
@Override
public void join(User user) {
	// TODO Auto-generated method stub
	sql.insert(namespace+".join",user);
}
@Override
public void rejoin(User user) {
	// TODO Auto-generated method stub
	sql.update(namespace+".rejoin", user);
}@Override
public Object userid(Object id) {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".userid",id);
}
@Override
public List<Rade> radeList(int id) {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".radelist",id);
}
@Override
public void radejoin(Rade rade) {
	// TODO Auto-generated method stub
	sql.insert(namespace+".readjoin",rade);
}
@Override
public void overjoin(int id) {
	// TODO Auto-generated method stub
	sql.update(namespace+".overjoin",id);
}
@Override
public void last_tobal(User user) {
	// TODO Auto-generated method stub
	sql.update(namespace+".last_tobal",user);
}
@Override
public List<User> searchMemberList(User us) {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".searchMemberList",us);
}
@Override
public int memberCount() {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".memberCount");
}
@Override
public List<User> memberList() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".memberList");
}
@Override
public List<User> tobalList() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".tobalList");
}
@Override
public void tobalck(String id) {
	// TODO Auto-generated method stub
	sql.update(namespace+".tobalck",id);
}
@Override
public List<User> cut() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".cut");
}
@Override
public User updateuser(String id) {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".updateuser",id);
}
@Override
public void userupdate(User user) {
	// TODO Auto-generated method stub
	sql.update(namespace+".userupdate",user);
}@Override
public void deljoin(String id) {
	// TODO Auto-generated method stub
	sql.delete(namespace+".deljoin",id);
	
}
@Override
public void min(String id) {
	// TODO Auto-generated method stub
	sql.update(namespace+".min",id);
}
@Override
public List<Calendar> discord() {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".discord");
}
@Override
public List<Calendar> dsm(int id) {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".dsm",id);
}
@Override
public admin loginCheck(admin dto) {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".alogin",dto);
	
}
@Override
public List<Calendar> dis(String id) {
	// TODO Auto-generated method stub
	return sql.selectList(namespace+".dis",id);
}
@Override
public User dloginCheck(User dto) {
	// TODO Auto-generated method stub
	return sql.selectOne(namespace+".blogin",dto);
}

}

