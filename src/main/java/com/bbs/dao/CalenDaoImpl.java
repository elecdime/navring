package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bbs.domain.Calendar;


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
}

