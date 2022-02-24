package com.bbs.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Criteria;
import com.bbs.domain.FileDTO;
import com.bbs.domain.PageMaker;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;
import com.bbs.service.boardListService;
import com.bbs.utils.UploadFileUtils;


import net.sf.json.JSONArray;

@Controller
public class BoardController {
	
	@Inject
	private boardListService boardListService;
	@Resource(name = "uploadPath")
	private String uploadPath;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class); 
	

	  //게시글조회
	  @RequestMapping(value="board/boardview", method=RequestMethod.GET)
	    public String boardview(@RequestParam("n") int bbsno, Model model,bbsDTO bbsDTO,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
	       	bbsDTO bbs = boardListService.boardView(bbsno);
	       	
	       	
	       	model.addAttribute("bbs", bbs);
	       	//파일리스트 가져오기
	    	List<Map<String, Object>> fileList = boardListService.selectFileList(bbs.getBbsno());
	    	
	    	model.addAttribute("file", fileList);
	    	//페이징 유지
	    	model.addAttribute("scri", scri); 
	    	return "board/boardview";
	    }
	  @RequestMapping(value = "/board/boardinsert", method = RequestMethod.GET)
	  public void boardinsert(Model model,bbsDTO bbsDTO) throws Exception {
		 
		
		  //카테고리 
		  List<CategoriDTO> category = null;
		  category = boardListService.categori();
		  model.addAttribute("category", JSONArray.fromObject(category));
	   	  }
	  //게시글 작성기능
	  @RequestMapping(value = "/board/boardinsert", method = RequestMethod.POST)
	  public String boardinsertp(bbsDTO bbsDTO,MultipartFile file) throws  Exception {
		  
		  // 계층형 게시판을위한 작업
		  int bbsGroup = bbsDTO.getBbsGroup();
	      bbsDTO.setBbsGroup(bbsGroup);
		 	
	      
	      
	      
	      
		  boardListService.boardinsert(bbsDTO);
		  
		  return "redirect:/board/listSearch?page=1&perPageNum=10&searchType=t&keyword=";
		  
	  }
	  
	   //업데이트
	  @RequestMapping(value = "/board/boardupdate", method = RequestMethod.GET)
	  public void boardupdate(@RequestParam("n") int bbsno,Model model,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		  //파일리스트 가져오기
		  List<Map<String, Object>> fileList = boardListService.selectFileList(bbsno);
	
	     model.addAttribute("file", fileList);
		  //board_jh 게시판조회
	      bbsDTO bbsDTO = new bbsDTO();		 
		  bbsDTO.setBbsno(bbsno);
		  System.out.println(bbsDTO.getBbsno());
		  bbsDTO bbs = boardListService.boardView(bbsno);
		  model.addAttribute("bbs", bbs);
	      //카테고리 가져오기	
		  List<CategoriDTO> category = null;
		  category = boardListService.categori();
		  model.addAttribute("category", JSONArray.fromObject(category));
		  //페이징 유지 
		  model.addAttribute("scri", scri); 
		  System.out.println(bbs.getCateName());
	   	  }
	
	  
	  
	  @RequestMapping(value = "/board/boardupdate", method = RequestMethod.POST)
	  public String boardupdate(bbsDTO bbsDTO ,MultipartFile file , HttpServletRequest req,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception  {
	
		//페이징 유지
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		   boardListService.boardupdate(bbsDTO);
	   return "redirect:/board/listSearch";
	  }
	  @RequestMapping(value = "/board/boarddelete", method = RequestMethod.POST)
	  public String boarddelete(@RequestParam("n") int bbsno,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)  {
	   boardListService.boardelete(bbsno);
	
	
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
		  	return "redirect:/board/listSearch";
	  }
	// ck 에디터에서 파일 업로드
	  @RequestMapping(value = "/board/ckUpload", method = RequestMethod.POST)
	  public void postCKEditorImgUpload(HttpServletRequest req,
	            HttpServletResponse res,
	            @RequestParam MultipartFile upload) throws Exception {
	   logger.info("post CKEditor img upload");
	   
	   // 랜덤 문자 생성
	   UUID uid = UUID.randomUUID();
	   
	   OutputStream out = null;
	   PrintWriter printWriter = null;
	     
	   // 인코딩
	   res.setCharacterEncoding("utf-8");
	   res.setContentType("text/html;charset=utf-8");
	   
	   try {
	    
	    String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	    byte[] bytes = upload.getBytes();
	    
	    // 업로드 경로
	    String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	    
	    out = new FileOutputStream(new File(ckUploadPath));
	    out.write(bytes);
	    out.flush();  // out에 저장된 데이터를 전송하고 초기화
	    
	    String callback = req.getParameter("CKEditorFuncNum");
	    printWriter = res.getWriter();
	    String fileUrl = "/web/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
	    
	    // 업로드시 메시지 출력
	    printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");

	    
	    printWriter.flush();
	    
	   } catch (IOException e) { e.printStackTrace();
	   } finally {
	    try {
	     if(out != null) { out.close(); }
	     if(printWriter != null) { printWriter.close(); }
	    } catch(IOException e) { e.printStackTrace(); }
	   }
	   
	   return; 
	  }

	    
	    
	    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분 , 업로드
	    @ResponseBody
	    public String upload(MultipartHttpServletRequest multipartRequest,MultipartFile file , HttpServletRequest req,FileDTO fileDTO) { //Multipart로 받는다.
	         
	    	
	    	
	    	   UUID uid = UUID.randomUUID(); // 파일 이름 랜덤
	    	
	    	
	        Iterator<String> itr =  multipartRequest.getFileNames();
	        
	        String filePath = uploadPath+"/upload" ;//설정파일로 뺀다.
	        
	        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
	            
	        	
	            
	            MultipartFile mpf = multipartRequest.getFile(itr.next());
	     
	            String originalFilename = mpf.getOriginalFilename(); //파일명
	            String uuidfile = originalFilename+uid;
	            String fileFullPath = filePath+"/"+uuidfile; //파일 전체 경로
	            	
	     
	            try {
	                //파일 저장
	                mpf.transferTo(new File(fileFullPath)); 
	                fileDTO.setOrgfile(originalFilename);
	                //파일이름이 중복되지 않도록 랜덤으로 저장
		            fileDTO.setSavefile(uuidfile);
		           
		            boardListService.fileupload(fileDTO);
	                System.out.println("originalFilename => "+originalFilename);
	                System.out.println("fileFullPath => "+fileFullPath);
	     
	            } catch (Exception e) {
	                System.out.println("postTempFile_ERROR======>"+fileFullPath);
	                e.printStackTrace();
	            }
	                         
	       }
	   
	
	       
	         
	        return "success";
	    }
	    //파일 다운로드
	    @RequestMapping(value="/board/fileDown", method = RequestMethod.GET)
		public void fileDown(@RequestParam("IDX")int idx,HttpServletResponse response,String fileNm, String originalFileNm,FileDTO fileDTO) throws Exception{
	    	//Map안에 파일정보 담아둠.	
	    	Map<String, Object> list =  boardListService.selectFileInfo(idx);
	    	
	    	  
	    	 //원본파일이름 
	    	String fileName =  (String) list.get("ORGFILE");
	    	//파일이 저장된경로
	  		String saveFileName = uploadPath+"/upload/"+list.get("SAVEFILE"); 


	  		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	  		response.setHeader("Content-Transfer-Encoding", "binary");
	  
	  		response.setHeader("Pragma", "no-cache;");
	  		response.setHeader("Expires", "-1;");

	  		try(
	  				FileInputStream fis = new FileInputStream(saveFileName);
	  				OutputStream out = response.getOutputStream();
	  				){
	  			int readCount = 0;
	  			byte[] buffer = new byte[1024];
	  			while((readCount = fis.read(buffer)) != -1){
	  				out.write(buffer,0,readCount);
	  			}
	  		}catch(Exception ex){
	  			throw new RuntimeException("file Save Error");
	  		}
	    	  
	    	  
	    	  
	    	  
	    	 
			
	  		
		}
	    
	    //답글 게시판
	    @RequestMapping(value = "/board/reply", method = RequestMethod.GET)
		  public void replyinsert(@RequestParam("n") int bbsno,Model model) {
	    
	    	
	    	bbsDTO bbs = boardListService.boardView(bbsno);
			model.addAttribute("bbs", bbs);
			  
		   	  }
	    
	     //답글작성
		  @RequestMapping(value = "/board/reply", method = RequestMethod.POST)
		  public String replyinsert(bbsDTO bbsDTO) throws Exception  {
			 		  

		   boardListService.replyinsert(bbsDTO);
		   return "redirect:/board/listSearch?page=1&perPageNum=10&searchType=t&keyword=";
		  }
		  
		  
		    @RequestMapping(value = "/fileupdate/post") //ajax에서 호출하는 부분
		    @ResponseBody
		    public String update(MultipartHttpServletRequest multipartRequest,MultipartFile file , HttpServletRequest req,FileDTO fileDTO) { 
		         
		    	
		    	
		      return "a";
		  }
			
			
			// 글 목록 + 페이징 + 검색
			@RequestMapping(value = "/board/listSearch", method = RequestMethod.GET)
			public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model,bbsDTO bbsDTO ,HttpServletRequest re,FileDTO fileDTO) throws Exception {
			 logger.info("get list search");
		     //공지사항 기간 상단고정,상단고정해제,delfill= 'y' 인 친구들 실제경로에서 삭제후 SQL에서도 삭제.
			 boardListService.notice1();
			 boardListService.notice2();
				
				List<FileDTO> filelist = boardListService.delfiley(fileDTO);
						//파일삭제
						for(int i=0;i < filelist.size();i++) {
				
					 
					 //파일의 실제경로
					 String filePath = uploadPath+"/upload/"+filelist.get(i).getSavefile();
		
					 File delfile = new File(filePath);
					 if(delfile.exists()) {
						 delfile.delete();
						 System.out.println(i+"개의 파일삭제완료");
					 }else {
					 System.out.println("삭제할 파일x");
				}
					 }
				
			
			//페이징,검색,리스트 조회
			 List<bbsDTO> list = boardListService.listSearch(scri);
			 model.addAttribute("list", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(scri);
			 //pageMaker.setTotalCount(service.listCount());
			 pageMaker.setTotalCount(boardListService.countSearch(scri));
			 model.addAttribute("pageMaker", pageMaker);
			}
			
			//파일 업데이트
			@RequestMapping(value = "/fileupDate/post") //ajax에서 호출하는 부분
			@ResponseBody
			    public String fileupdate(bbsDTO bbsDTO,MultipartHttpServletRequest multipartRequest,MultipartFile file , HttpServletRequest req,FileDTO fileDTO ) { //Multipart로 받는다.
			
				 int bbsno= bbsDTO.getBbsno();
				 //파일 재등록시 파일이름 랜덤으로
				 UUID uid = UUID.randomUUID();
			    	
			    	
			        Iterator<String> itr =  multipartRequest.getFileNames();
			        
			        String filePath = uploadPath+"/upload" ;//파일 경로
			        
			        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
			            
			            /* 기존 주석처리
			            MultipartFile mpf = multipartRequest.getFile(itr.next());
			            String originFileName = mpf.getOriginalFilename();
			            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
			            */
			        	
			            
			            MultipartFile mpf = multipartRequest.getFile(itr.next());
			     
			            String originalFilename = mpf.getOriginalFilename(); //파일명
			            String uuidfile = originalFilename+uid;
			            String fileFullPath = filePath+"/"+uuidfile; //파일 전체 경로
			            	
			     
			            try {
			                //파일 저장
			                mpf.transferTo(new File(fileFullPath)); 
			                fileDTO.setOrgfile(originalFilename); 
				            fileDTO.setSavefile(uuidfile);
				            fileDTO.setBbsno(bbsno);
				            boardListService.updatefile(fileDTO);
			                System.out.println("originalFilename => "+originalFilename);
			                System.out.println("fileFullPath => "+fileFullPath);
			     
			            } catch (Exception e) {
			                System.out.println("postTempFile_ERROR======>"+fileFullPath);
			                e.printStackTrace();
			            }
			                         
			       }
			        
			        
			   return "a";
			}	
			
		
			//파일수정에서 파일삭제
		
			@RequestMapping("/board/deleteBoardFile" )
			public String deleteBoardFile(@RequestParam int num, @RequestParam int boardIdx,HttpServletRequest req,@ModelAttribute("scri") SearchCriteria scri,RedirectAttributes rttr) throws Exception {
				boardListService.delfile(num);
				
				//페이징 유지
				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
				
				return "redirect:/board/boardview?n="+boardIdx;
			}
			
}
