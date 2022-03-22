package com.bbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CalenDao;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.User;
import com.bbs.domain.admin;

@Service
public class CalServcieImpl implements CalenService {
	@Inject
	private CalenDao dao;

	@Override
	public List<Calendar> calenList() {
		// TODO Auto-generated method stub
		return dao.calenList();
	}

	@Override
	public Calendar calView(int id) {
		// TODO Auto-generated method stub
		return dao.calView(id);
	}

	@Override
	public void calinsert(Calendar calendar) {
		// TODO Auto-generated method stub
		dao.calinsert(calendar);
	}

	@Override
	public List<CategoriDTO> categori() {
		// TODO Auto-generated method stub
		return dao.categori();
	}

	@Override
	public void join(User user) {
		// TODO Auto-generated method stub
		dao.join(user);
	}

	@Override
	public void rejoin(User user) {
		// TODO Auto-generated method stub
		dao.rejoin(user);
	}

	@Override
	public Object userid(Object id) {
		// TODO Auto-generated method stub
		return dao.userid(id);
	}

	@Override
	public List<Rade> radeList(int id) {
		// TODO Auto-generated method stub
		return dao.radeList(id);
	}

	@Override
	public void radejoin(Rade rade) {
		// TODO Auto-generated method stub
		dao.radejoin(rade);

	}

	@Override
	public void overjoin(int id) {
		// TODO Auto-generated method stub
		dao.overjoin(id);
	}

	@Override
	public void last_tobal(User user) {
		// TODO Auto-generated method stub
		dao.last_tobal(user);
	}

	@Override
	public List<User> searchMemberList(User us) {
		// TODO Auto-generated method stub
		return dao.searchMemberList(us);
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return dao.memberCount();
	}

	@Override
	public List<User> memberList() {
		// TODO Auto-generated method stub
		return dao.memberList();
	}

	@Override
	public List<User> tobalList() {
		// TODO Auto-generated method stub
		return dao.tobalList();
	}

	@Override
	public void tobalck(String id) {
		// TODO Auto-generated method stub
		dao.tobalck(id);
	}

	public List<User> cut() {
		// TODO Auto-generated method stub
		return dao.cut();
	}

	@Override
	public User updateuser(String id) {
		// TODO Auto-generated method stub
		return dao.updateuser(id);
	}

	@Override
	public void userupdate(User user) {
		// TODO Auto-generated method stub
		dao.userupdate(user);
		;
	}

	@Override
	public void deljoin(String id) {
		// TODO Auto-generated method stub
		dao.deljoin(id);
	}

	@Override
	public void min(String id) {
		// TODO Auto-generated method stub
		dao.min(id);
	}

	@Override
	public List<Calendar> discord() {
		// TODO Auto-generated method stub
		return dao.discord();
	}
	@Override
	public List<Calendar> dsm(int id) {
		// TODO Auto-generated method stub
		return dao.dsm(id);
	}
	 public admin loginCheck(admin dto) {
		 
		 return dao.loginCheck(dto);
	 }
}
