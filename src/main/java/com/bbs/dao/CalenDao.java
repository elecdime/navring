package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.User;
import com.bbs.domain.admin;



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
	 public void overjoin(int id);
	 public void last_tobal(User user);
	 public List<User> searchMemberList(User us);
	 public List<User> memberList();
	 public int memberCount();
     public List<User> tobalList();
   
     public void tobalck(String id);
     public List<User> cut();
     public User updateuser(String id);
     public void userupdate(User user);
     public void deljoin(String id);
     public void min(String id);
 	public List<Calendar> discord();
	public List<Calendar> dsm(int id);
	 public admin loginCheck(admin dto);
	 public List<Calendar> dis(String id);
	 public User dloginCheck(User dto);
}
