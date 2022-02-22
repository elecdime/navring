package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Criteria;
import com.bbs.domain.FileDTO;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;

@Repository
public class boardListImpl implements boardList {
	@Inject
	private SqlSession sql;
	private final static String namespace = "com.bbs.mapper.boardMapper";

	@Override
	public List<bbsDTO> boardList(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		return sql.selectList("board", bbsDTO);
	}

	@Override
	public bbsDTO boardView(int bbsno) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".viewcnt", bbsno);
		return sql.selectOne(namespace + ".boardView", bbsno);

	}

	@Override
	public List<CategoriDTO> categori() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".categori");
	}

	@Override
	@Transactional
	public void boardinsert(bbsDTO bbsDTO) {
		sql.insert(namespace + ".boardinsert", bbsDTO);

	}

	@Override
	@Transactional
	public void boardupdate(com.bbs.domain.bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".boardupdate", bbsDTO);

	}

	@Override
	@Transactional
	public void boardelete(int bbsno) {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".boarddelete", bbsno);

	}

	@Override
	public void viewcnt(int num) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".viewcnt", num);
	}

	@Override
	public void notice1() {
		// TODO Auto-generated method stub
		sql.update(namespace + ".notice1");
	}

	@Override
	public void notice2() {
		// TODO Auto-generated method stub
		sql.update(namespace + ".notice2");
		sql.update(namespace+".nofile");
		}

	@Override
	public void fileupload(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertFile", fileDTO);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".selectFileList", bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".selectFileInfo", map);
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".updateFile", map);
	}

	@Override
	public void replyinsert(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".replyinsert",bbsDTO);
	}

	@Override
	public void replyupdate(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".replyupdate",bbsDTO);
	}@Override
	public void updatefile(int bbsno) {
		// TODO Auto-generated method stub
	 sql.insert(namespace+".updatefile",bbsno);	
	}
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".count");
	}@Override
	public List<bbsDTO> listPage(Criteria cri) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listPage",cri);
	}@Override
	public int countSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".countSearch",scri);
	}@Override
	public List<bbsDTO> listSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listSearch",scri);
	}
}
