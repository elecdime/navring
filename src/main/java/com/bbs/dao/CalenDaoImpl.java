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
}

