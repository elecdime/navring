package com.bbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.CalenDao;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.User;

public interface CalenService {

	
	public List<Calendar> calenList();
	public Calendar calView(int id);
	 public void calinsert(Calendar calendar); 
	 public List<CategoriDTO> categori();
	 public void join(User user); 
	 public void rejoin(User user);
	 public Object userid(Object id);
	 public List<Rade> radeList(int id);
	 public void radejoin(Rade rade); 
}
