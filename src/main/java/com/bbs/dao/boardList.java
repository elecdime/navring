package com.bbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Criteria;
import com.bbs.domain.FileDTO;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;

public interface boardList {

	 public bbsDTO boardView(int bbsno);
	 public List<CategoriDTO> categori();
	 public void boardinsert(bbsDTO bbsDTO) ;
	 public void boardupdate(bbsDTO bbsDTO);
	 public void boardelete(int bbsno);
	 public void viewcnt(int num);
	 public void notice1();
	 public void notice2();
	 public void fileupload(FileDTO fileDTO) ;
	 public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		public Map<String, Object> selectFileInfo(int idx) throws Exception;
		public void updateFiles(FileDTO fileDTO) throws Exception;
		public void replyinsert(bbsDTO bbsDTO) ;
		public int count() throws Exception;
	    public List<bbsDTO> listPage(Criteria cri);
	    public List<bbsDTO> listSearch(SearchCriteria scri);
	    public int countSearch(SearchCriteria scri);
	    public void delfile(int num);
	   public List<FileDTO> delfiley(FileDTO fileDTO);
	   public void sqlfiledel();
	

}
