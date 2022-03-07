package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.bbs.domain.Calendar;
import com.bbs.domain.bbsDTO;


public interface CalenDao {
	public List<Calendar> calenList();
	public Calendar calView(int id);
}
