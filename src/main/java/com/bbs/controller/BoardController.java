package com.bbs.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	
	@RequestMapping(value="board/boardlist", method=RequestMethod.GET)
	    public String boardList(
	    		bbsDTO bbsDTO, Model model ,HttpServletRequest re) throws Exception {
		FileDTO fileDTO = new FileDTO();
		

		
		
		List<bbsDTO> list = boardListService.boardList(bbsDTO);
				      
		boardListService.notice1();
		boardListService.notice2();

	    model.addAttribute("list", list);
	   
	        return "board/boardlist";
	    }
	  
	  @RequestMapping(value="board/boardview", method=RequestMethod.GET)
	    public String boardview(@RequestParam("n") int bbsno, Model model,bbsDTO bbsDTO,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
	       	bbsDTO bbs = boardListService.boardView(bbsno);
	       	
	       	
	       	model.addAttribute("bbs", bbs);
	       	
	    	List<Map<String, Object>> fileList = boardListService.selectFileList(bbs.getBbsno());
	    	System.out.println(fileList);
	    	System.out.println(fileList);
	    	System.out.println(fileList);
	    	model.addAttribute("file", fileList);
	    	   model.addAttribute("scri", scri); 
	    	return "board/boardview";
	    }
	  @RequestMapping(value = "/board/boardinsert", method = RequestMethod.GET)
	  public void boardinsert(Model model,bbsDTO bbsDTO) throws Exception {
		 
		
		  
		  List<CategoriDTO> category = null;
		  category = boardListService.categori();
		  model.addAttribute("category", JSONArray.fromObject(category));
	   	  }
	  
	  @RequestMapping(value = "/board/boardinsert", method = RequestMethod.POST)
	  public String boardinsertp(bbsDTO bbsDTO,MultipartFile file) throws  Exception {
		  
		 
		  int bbsGroup = bbsDTO.getBbsGroup();
	      bbsDTO.setBbsGroup(bbsGroup);
		 	
	      
	      
	      
	      
		  boardListService.boardinsert(bbsDTO);
		  
		  return "redirect:/board/boardlist";
		  
	  }
	  @RequestMapping(value = "/board/boardupdate", method = RequestMethod.GET)
	  public void boardupdate(@RequestParam("n") int bbsno,Model model,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		  List<Map<String, Object>> fileList = boardListService.selectFileList(bbsno);
	    	System.out.println(fileList);
	    	System.out.println(fileList);
	    	System.out.println(fileList);
	    	model.addAttribute("file", fileList);
		  
		  
		  
		  bbsDTO bbs = boardListService.boardView(bbsno);
		  model.addAttribute("bbs", bbs);
	    	
		  List<CategoriDTO> category = null;
		  category = boardListService.categori();
		  model.addAttribute("category", JSONArray.fromObject(category));
		   model.addAttribute("scri", scri); 
		  System.out.println(bbs.getCateName());
	   	  }
	
	  @RequestMapping(value = "/board/boardupdate", method = RequestMethod.POST)
	  public String boardupdate(bbsDTO bbsDTO ,MultipartFile file , HttpServletRequest req,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception  {
		int bbsno =  bbsDTO.getBbsno() ; 		//
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

	   boardListService.boardupdate(bbsDTO);
	   return "redirect:/board/boardlist";
	  }
	  @RequestMapping(value = "/board/boarddelete", method = RequestMethod.POST)
	  public String boarddelete(@RequestParam("n") int bbsno,@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)  {
	   boardListService.boardelete(bbsno);
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
		  	return "redirect:/board/boardlist";
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
	  @RequestMapping("board/boardlistAJAX")
	    public List<bbsDTO> boardlist(bbsDTO bbsDTO,Model model) {
	        List<bbsDTO> data = boardListService.boardList(bbsDTO);
	        model.addAttribute("data",data);
	        
	        return data;
	    }
	    
	    
	    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
	    @ResponseBody
	    public String upload(MultipartHttpServletRequest multipartRequest,MultipartFile file , HttpServletRequest req,FileDTO fileDTO) { //Multipart로 받는다.
	         
	    	
	    	
	    	   UUID uid = UUID.randomUUID();
	    	
	    	
	        Iterator<String> itr =  multipartRequest.getFileNames();
	        
	        String filePath = uploadPath+"/upload" ;//설정파일로 뺀다.
	        
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
	    @RequestMapping(value="/board/fileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = boardListService.selectFileInfo(map);
		
			String storedFileName = (String) resultMap.get("SAVEFILE");
			String originalFileName = (String) resultMap.get("ORGFILE");
			System.out.println(storedFileName);
			System.out.println(originalFileName);
			System.out.println(uploadPath);
			// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(uploadPath+"/upload"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}
	    @RequestMapping(value = "/board/reply", method = RequestMethod.GET)
		  public void replyinsert(@RequestParam("n") int bbsno,Model model) {
	    
	    	
	    	bbsDTO bbs = boardListService.boardView(bbsno);
			  model.addAttribute("bbs", bbs);
			  
		   	  }
		  @RequestMapping(value = "/board/reply", method = RequestMethod.POST)
		  public String replyinsert(bbsDTO bbsDTO) throws Exception  {
			 System.out.println(bbsDTO.getTitle()+bbsDTO.getBbsno()+bbsDTO.getBbsDent()+bbsDTO.getBbsGroup()+bbsDTO.getBbsStep());
			 System.out.println(bbsDTO.getTitle());
			 System.out.println(bbsDTO.getTitle());
			 System.out.println(bbsDTO.getTitle());

			  

		   boardListService.replyinsert(bbsDTO);
		   return "redirect:/board/boardlist";
		  }
		  @RequestMapping(value = "/fileupdate/post") //ajax에서 호출하는 부분
		    @ResponseBody
		    public String update(MultipartHttpServletRequest multipartRequest,MultipartFile file , HttpServletRequest req,FileDTO fileDTO) { //Multipart로 받는다.
		         
		    	
		    	
		        return "a";
		  }
			@RequestMapping(value="/board/listPage", method=RequestMethod.GET)
		    public String listpage(Criteria cri ,Model model) throws Exception {

			      
				boardListService.notice1();
				boardListService.notice2();

			
			List<bbsDTO> list = boardListService.listPage(cri);
		
		    model.addAttribute("list", list);
		    
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(boardListService.count());
		    model.addAttribute("pageMaker", pageMaker);
		        
		        return "board/boardlist";
		    }
			
			
			// 글 목록 + 페이징 + 검색
			@RequestMapping(value = "/board/listSearch", method = RequestMethod.GET)
			public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model,bbsDTO bbsDTO ,HttpServletRequest re) throws Exception {
			 logger.info("get list search");
			 
			 List<bbsDTO> list = boardListService.listSearch(scri);
			 model.addAttribute("list", list);
			 
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(scri);
			 //pageMaker.setTotalCount(service.listCount());
			 pageMaker.setTotalCount(boardListService.countSearch(scri));
			 model.addAttribute("pageMaker", pageMaker);
			}
}

