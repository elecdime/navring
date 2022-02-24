package com.bbs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bbs.dao.boardList;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Criteria;
import com.bbs.domain.FileDTO;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;

@Service

public class boardListServiceImpl implements boardListService {

	@Inject
	private boardList dao;

	
	@Override
	public bbsDTO boardView(int bbsno) {
		// TODO Auto-generated method stub
		dao.viewcnt(bbsno);
		return dao.boardView(bbsno);
	}

	@Override
	public List<CategoriDTO> categori() {
		// TODO Auto-generated method stub
		return dao.categori();
	}

	@Override
	@Transactional(isolation = Isolation.DEFAULT)
	public void boardinsert(bbsDTO bbsDTO) {
		dao.boardinsert(bbsDTO);

	}

	@Override
	@Transactional(isolation = Isolation.DEFAULT)
	public void boardupdate(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		dao.boardupdate(bbsDTO);
	}

	@Override
	@Transactional(isolation = Isolation.DEFAULT)
	public void boardelete(int bbsno) {
		// TODO Auto-generated method stub
		dao.boardelete(bbsno);
	}

	@Override
	public void notice1() {
		// TODO Auto-generated method stub
		dao.notice1();
	}

	@Override
	public void notice2() {
		// TODO Auto-generated method stub
		dao.notice2();
	}

	@Override
	public void fileupload(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		dao.fileupload(fileDTO);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}@Override
	public Map<String, Object> selectFileInfo(int idx) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(idx);
	}@Override
	public void replyinsert(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		//dao.replyupdate(bbsDTO);
		dao.replyinsert(bbsDTO);
	

		
	}
	@Override
	public void updatefile(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		dao.updateFiles(fileDTO);
	}
	@Override
	public int count() throws Exception {
	 return dao.count();
	}@Override
	public List<bbsDTO> listPage(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.listPage(cri);
	}@Override
	public int countSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.countSearch(scri);
	}@Override
	public List<bbsDTO> listSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		dao.sqlfiledel();
		return dao.listSearch(scri);
	}
@Override
public void delfile(int num) {
	// TODO Auto-generated method stub
	dao.delfile(num);
}@Override
public List<FileDTO> delfiley(FileDTO fileDTO) {
	// TODO Auto-generated method stub
	return dao.delfiley(fileDTO);
}
	    
}
