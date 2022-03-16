package com.bbs.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.service.CalenService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import io.mokulu.discord.oauth.DiscordAPI;
import io.mokulu.discord.oauth.DiscordOAuth;
import io.mokulu.discord.oauth.model.Connection;
import io.mokulu.discord.oauth.model.Guild;
import io.mokulu.discord.oauth.model.TokensResponse;
import io.mokulu.discord.oauth.model.User;
import jdk.nashorn.internal.parser.JSONParser;
import net.sf.json.JSON;
import net.sf.json.JSONArray;

@Controller
public class CalendarController {
	@Inject
	private CalenService service;
	@Resource(name = "uploadPath")
	private String uploadPath;
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public String cal(ModelAndView mv, HttpServletRequest request) {

		String viewpage = "calendar";
		List<Calendar> calendar = null;
		try {
			calendar = service.calenList();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return "cal";
	}

	@RequestMapping(value = "/calview", method = RequestMethod.GET)
	public String calview(@RequestParam("n") int id, Model model, Calendar cal,Rade rade) throws Exception {
		cal = service.calView(id);
		 List<Rade> rd = null;
		  rd = service.radeList(id);
		  model.addAttribute("rd", rd);
		System.out.println(cal);
		model.addAttribute("cal", cal);

		return "calview";
	}
	@RequestMapping(value = "/radejoin", method = RequestMethod.POST)
	public String radejoin(@RequestParam("n") int id,Rade rade,HttpServletRequest request) throws Exception {
		List<Rade> nickcheek = service.radeList(id);

		rade.setCalid(id);
			  HttpSession session = request.getSession();
			  
			
			//중복처리 해야함	
		
				  service.radejoin(rade);	
				  return "redirect:/calview?n="+id;
			
			  }

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getDiscord() throws Exception {

		return "/login";
	}

	/*
	 * https://discord.com/api/oauth2/authorize?client_id=894943429283446814&
	 * redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&
	 * response_type=code&scope=identify%20email
	 */
	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping(value = "/users/login/redirect", method = RequestMethod.GET)
	public String redirct(@RequestParam("code") String code, Model model, HttpServletRequest request) throws Exception {
		System.out.println(code);
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://discord.com/api/oauth2/token";
		String client_id = "894943429283446814";
		String client_secret = "M0jsQBmIRNAzMemKH63rQz8h1qqHQdMf";
		String grant_type = "authorization_code";

		String redirect_uri = "http://127.0.0.1:8000/users/login/redirect";
		String[] scope = { "identify", "guilds.members.read", "guilds" };
		DiscordOAuth discordOAuth2 = new DiscordOAuth(client_id, client_secret,
				"http://127.0.0.1:8000/users/login/redirect", scope);
		System.out.println(discordOAuth2);
		String url = discordOAuth2.getAuthorizationURL("");
		System.out.println(url);
		TokensResponse tokens = discordOAuth2.getTokens(code);
		System.out.println(tokens);
		String accessToken = tokens.getAccessToken();
		String refreshToken = tokens.getRefreshToken();
		System.out.println("acc:" + accessToken);
		System.out.println("ref :" + refreshToken);
		DiscordAPI api = new DiscordAPI(accessToken);
		User user = api.fetchUser();
		//List<Connection> connections = api.fetchConnections();
		ArrayList<Guild> guilds = new ArrayList(api.fetchGuilds());

		System.out.println(user);
		System.out.println(guilds.contains("295788758828056577"));

		System.out.println(guilds);

		//System.out.println(connections);
		System.out.println(api.fetchUser());
		//나브링 디코에 가입되어있을경우
		if (guilds.toString().contains("나브링")) {

			System.out.println("로그인");

			String jsonStr = null;
			JSONObject obj = null;
			//니아단 봇에있는 유저정보 들고오는부분
			jsonStr = Jsoup.connect("http://211.34.105.23:8080/members/" + user.getId()).ignoreContentType(true)
					.execute().body();
			System.out.println(jsonStr);
			JSONObject jsonObj = new JSONObject(jsonStr);
			//가입되어있는지 체크하는부분
			Object chid = jsonObj.get("id");
			Object ckid = service.userid(chid);
			if(ckid==null) {
			com.bbs.domain.User us = new com.bbs.domain.User();
			us.setNickname(jsonObj.get("nickname") + "/" + jsonObj.get("lv") + "/" + jsonObj.get("role"));
			us.setId(jsonObj.get("id"));
			us.setName(jsonObj.get("nickname"));
			us.setUsername(user.getUsername());
			us.setLv( jsonObj.get("lv"));
			us.setRole( jsonObj.get("role"));
			Object name = us.getNickname();
			service.join(us);
			System.out.println(name);
			
			HttpSession session = request.getSession();

			session.setAttribute("user", us);
			System.out.println(session);
			}else {
				com.bbs.domain.User us = new com.bbs.domain.User();
				us.setNickname(jsonObj.get("nickname") + "/" + jsonObj.get("lv") + "/" + jsonObj.get("role"));
				us.setId(jsonObj.get("id"));
				us.setName(jsonObj.get("nickname"));
				us.setUsername(user.getUsername());
				us.setLv( jsonObj.get("lv"));
				us.setRole( jsonObj.get("role"));
				Object name = us.getNickname();
				service.rejoin(us);
				System.out.println(name);

				HttpSession session = request.getSession();

				session.setAttribute("user", us);
				System.out.println(session);
				
			}
	
		} else {
			System.out.println("실패");

		}

		return "redirect:/cal";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/cal";
	}
	  @RequestMapping(value = "/calinsert", method = RequestMethod.GET)
	  public void boardinsert(Model model,Calendar calendar,HttpSession session) throws Exception {
		 
	
		

		  //카테고리 
		  List<CategoriDTO> category = null;
		  category = service.categori();
		  model.addAttribute("category", JSONArray.fromObject(category));
	   	  }
	  //게시글 작성기능
	  @RequestMapping(value = "/calinsert", method = RequestMethod.POST)
	  public String boardinsertp(Calendar calendar, HttpServletRequest request) throws  Exception {
		  
		  HttpSession session = request.getSession();
		  
	      
	      
	      
	      System.out.println(calendar.getWriter()+calendar.getTitle());
		  service.calinsert(calendar);
		  
		  return "redirect:/cal";
		  
	  }
	//  ck 에디터에서 파일 업로드
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

}