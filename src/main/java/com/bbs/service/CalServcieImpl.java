package com.bbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CalenDao;

import com.bbs.domain.Calendar;
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
}
