package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.User;



public interface CalenDao {
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
