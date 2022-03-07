package com.bbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CalenDao;

import com.bbs.domain.Calendar;

public interface CalenService {

	
	public List<Calendar> calenList();
	public Calendar calView(int id);
}
