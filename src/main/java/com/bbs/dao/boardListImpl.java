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

     
	
	//게시글보기
	@Override
	public bbsDTO boardView(int bbsno) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".viewcnt", bbsno);
		return sql.selectOne(namespace + ".boardView", bbsno);

	}
	//카테고리 호출
	@Override
	public List<CategoriDTO> categori() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".categori");
	}
	//게시글작성
	@Override
	@Transactional
	public void boardinsert(bbsDTO bbsDTO) {
		sql.insert(namespace + ".boardinsert", bbsDTO);

	}
	//게시글업데이트
	@Override
	@Transactional
	public void boardupdate(com.bbs.domain.bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".boardupdate", bbsDTO);

	}
	//게시글삭제 + 게시글삭제시 파일삭제
	@Override
	@Transactional
	public void boardelete(int bbsno) {
		// TODO Auto-generated method stub
		sql.update(namespace+".delbbsfile",bbsno);
		sql.delete(namespace + ".boarddelete", bbsno);

	}
	//조회수증가
	@Override
	public void viewcnt(int num) {
		// TODO Auto-generated method stub
		sql.update(namespace + ".viewcnt", num);
	}
	//게시글 상단고정
	@Override
	public void notice1() {
		// TODO Auto-generated method stub
		sql.update(namespace + ".notice1");
	}
	//게시글 상단고정 해제 + 등록안된 파일 삭제
	@Override
	public void notice2() {
		// TODO Auto-generated method stub
		sql.update(namespace + ".notice2");
		sql.update(namespace+".nofile");
		}
    //파일업로드
	@Override
	public void fileupload(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertfile", fileDTO);
	}
	//첨부파일조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".selectFileList", bno);
	}
	//첨부파일 정보 (파일다운로드)
	@Override
	public Map<String, Object> selectFileInfo(int idx) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".selectFileInfo", idx);
	}
	//파일 수정시 파일업로드
	@Override
	public void updateFiles(FileDTO fileDTO) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".updatefile", fileDTO);
	}
	// 답글작성
	@Override
	public void replyinsert(bbsDTO bbsDTO) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".replyinsert",bbsDTO);
	}

    //게시글 카운트
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".count");
	}
	//게시글 페이징
	@Override
	public List<bbsDTO> listPage(Criteria cri) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listPage",cri);
	}
	//검색한 게시글 카운트
	@Override
	public int countSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".countSearch",scri);
	}@Override
	
	//검색
	public List<bbsDTO> listSearch(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listSearch",scri);
	}
	@Override
	//파일삭제
	public void delfile(int num) {
		// TODO Auto-generated method stub
		sql.update(namespace+".delfile",num);
	}
	//del_file y 시 삭제를위해 검색
	@Override
	public List<FileDTO> delfiley(FileDTO fileDTO) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".delfiley",fileDTO);
	}
	//파일삭제후 sql에서도 삭제
	@Override
	public void sqlfiledel() {
		// TODO Auto-generated method stub
		sql.delete(namespace+".sqlfiledel");
	}


}
