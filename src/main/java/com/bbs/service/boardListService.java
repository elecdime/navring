package com.bbs.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Criteria;
import com.bbs.domain.FileDTO;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;

public interface boardListService {
	

	public bbsDTO boardView(int bbsno);

	public List<CategoriDTO> categori();

	@Transactional(isolation = Isolation.DEFAULT)
	public void boardinsert(bbsDTO bbsDTO);

	@Transactional(isolation = Isolation.DEFAULT)
	public void boardupdate(bbsDTO bbsDTO);

	@Transactional(isolation = Isolation.DEFAULT)
	public void boardelete(int bbsno);

	public void notice1();

	public void notice2();

	public void fileupload(FileDTO fileDTO);

	public List<Map<String, Object>> selectFileList(int bno) throws Exception;

	public Map<String, Object> selectFileInfo(int idx) throws Exception;

	public void replyinsert(bbsDTO bbsDTO);

	public void updatefile(FileDTO file)throws Exception;

	public int count() throws Exception;
	public List<bbsDTO> listPage(Criteria cri);
    public List<bbsDTO> listSearch(SearchCriteria scri);
    public int countSearch(SearchCriteria scri);
    public void delfile(int num);
    public List<FileDTO> delfiley(FileDTO fileDTO);
    

}
