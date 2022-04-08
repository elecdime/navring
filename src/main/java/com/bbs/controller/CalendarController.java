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

import org.apache.http.HttpResponse;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.domain.Calendar;
import com.bbs.domain.CategoriDTO;
import com.bbs.domain.Rade;
import com.bbs.domain.admin;
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
		System.out.println( "응애"+service.discord());
			calendar = service.calenList();
			request.setAttribute("calendarList", calendar);
	
			

		mv.setViewName(viewpage);
		return "cal";
	}
	

	@RequestMapping(value = "/calview", method = RequestMethod.GET)
	public String calview(@RequestParam("n") int id, Model model, Calendar cal, Rade rade) throws Exception {
		cal = service.calView(id);
		List<Rade> rd = null;
		rd = service.radeList(id);
		model.addAttribute("rd", rd);
		model.addAttribute("cal", cal);
		
		List<Calendar> ds = service.discord();

	    JSONObject jsonob = new JSONObject();
		
		return "calview";
	}

	@RequestMapping(value = "/radejoin", method = RequestMethod.POST)
	public String radejoin(@RequestParam("n") int id, Rade rade, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Rade> nickcheek = service.radeList(id);
		System.out.println(nickcheek);
		rade.setCalid(id);
		Calendar cal = service.calView(id);
        int _id = id;
        
		HttpSession session = request.getSession();
		com.bbs.domain.User users = (com.bbs.domain.User) session.getAttribute("user");
		rade.setUserid(users.getId().toString());
	
		users.set_id(_id);
		
		String nk = users.getId().toString();
		String nick = users.getName().toString();

		
		System.out.println(nick.equals(cal.getLeader_id()) );

			if(nickcheek.toString().contains(nk) || nick.equals(cal.getLeader_id()) || cal.getCateMax() <= cal.getCateMin()) {
				System.out.println("중복참여  , 정원초과, 공대장 등등 아무튼 참여불가");
				response.setContentType("text/html; charset=UTF-8");
				 
				PrintWriter out = response.getWriter();
				 
				out.println("<script>alert('중복참여  , 정원초과, 본인이 글싼사람 이면 아무튼 참여불가능'); location.href='/calview?n="+id+"';</script>");
				 
				out.flush();


	
				
			}
			else {
				if(cal.getCateCode().equals("101")) {
					System.out.println("토벌전참여");
					service.last_tobal(users);
				}
				System.out.println("토벌전 미참여");
				service.overjoin(id);;
				service.radejoin(rade);
			}
		return "redirect:/calview?n=" + id;

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
		//System.out.println(code);
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://discord.com/api/oauth2/token";
		String client_id = "894943429283446814";
		String client_secret = "M0jsQBmIRNAzMemKH63rQz8h1qqHQdMf";
		String grant_type = "authorization_code";

		String redirect_uri = "http://nabring.kr/users/login/redirect";
		String[] scope = { "identify", "guilds.members.read", "guilds" };
		DiscordOAuth discordOAuth2 = new DiscordOAuth(client_id, client_secret,
				"http://nabring.kr/users/login/redirect", scope);
		//System.out.println(discordOAuth2);
		String url = discordOAuth2.getAuthorizationURL("");
		System.out.println(url);
		TokensResponse tokens = discordOAuth2.getTokens(code);
		//System.out.println(tokens);
		String accessToken = tokens.getAccessToken();
		String refreshToken = tokens.getRefreshToken();
		//System.out.println("acc:" + accessToken);
		//System.out.println("ref :" + refreshToken);
		DiscordAPI api = new DiscordAPI(accessToken);
		User user = api.fetchUser();
		// List<Connection> connections = api.fetchConnections();
		ArrayList<Guild> guilds = new ArrayList(api.fetchGuilds());

		// System.out.println(connections);
	//	System.out.println(api.fetchUser());
		// 나브링 디코에 가입되어있을경우
		if (guilds.toString().contains("나브링")) {

			System.out.println("로그인");

			String jsonStr = null;
			JSONObject obj = null;
			// 니아단 봇에있는 유저정보 들고오는부분
			jsonStr = Jsoup.connect("http://api.nabring.kr:8080/members/" + user.getId()).ignoreContentType(true)
					.execute().body();
			System.out.println(jsonStr);
		
			JSONObject jsonObj = new JSONObject(jsonStr);
			// 가입되어있는지 체크하는부분
			Object chid = jsonObj.get("id");
			Object ckid = service.userid(chid);
			if (ckid == null) {
				com.bbs.domain.User us = new com.bbs.domain.User();
				us.setNickname(jsonObj.get("nickname") + "/" + jsonObj.get("lv") + "/" + jsonObj.get("role"));
				us.setId(jsonObj.get("id"));
				us.setName(jsonObj.get("nickname"));
				us.setUsername(user.getUsername());
				us.setLv(jsonObj.get("lv"));
				us.setRole(jsonObj.get("role"));
				Object name = us.getNickname();
				service.join(us);
				System.out.println(name);

				HttpSession session = request.getSession();

				session.setAttribute("user", us);
				System.out.println(session);
			} else {
				com.bbs.domain.User us = new com.bbs.domain.User();
				us.setNickname(jsonObj.get("nickname") + "/" + jsonObj.get("lv") + "/" + jsonObj.get("role"));
				us.setId(jsonObj.get("id"));
				us.setName(jsonObj.get("nickname"));
				us.setUsername(user.getUsername());
				us.setLv(jsonObj.get("lv"));
				us.setRole(jsonObj.get("role"));
				Object name = us.getNickname();
				service.rejoin(us);
				System.out.println(name);
				HttpSession session = request.getSession();

				session.setAttribute("user", us);

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
	public void boardinsert(Model model, Calendar calendar, HttpSession session) throws Exception {

		
		// 카테고리
		List<CategoriDTO> category = null;
		category = service.categori();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 게시글 작성기능
	@RequestMapping(value = "/calinsert", method = RequestMethod.POST)
	public String boardinsertp(Calendar calendar, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		System.out.println(calendar.getWriter() + calendar.getTitle());
		service.calinsert(calendar);

		return "redirect:/cal";

	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/board/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
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

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
	
	@RequestMapping(value = "/admin/userlist", method = RequestMethod.POST)
	public String searchMemberList(Model model,com.bbs.domain.User us) {
		
		
		model.addAttribute("memberList", service.searchMemberList(us));
		return "/admin/userlist";
		
	}
	@RequestMapping(value = "/admin/userlist", method = RequestMethod.GET)
	public String memberList(Model model, com.bbs.domain.User user) {
		user.setMemberCount(service.memberCount());
		
		model.addAttribute("count", user.getMemberCount());
		model.addAttribute("memberList", service.memberList());
		return "/admin/userlist";
	}
	@RequestMapping(value = "/admin/tobal", method = RequestMethod.GET)
	public String tobalList(Model model, com.bbs.domain.User user) {
		user.setMemberCount(service.memberCount());
		
		model.addAttribute("count", user.getMemberCount());
		model.addAttribute("memberList", service.tobalList());
		return "/admin/tobal";
	}
	
    @SuppressWarnings("null")
	@RequestMapping(value = "/tobalck")
    public String ajaxTest(HttpServletRequest request) {
    	 com.bbs.domain.User user = null ;     
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        
        	System.out.println("sysout :" +ajaxMsg[i]);
        	service.tobalck(ajaxMsg[i]);	       
        	
        }
        return "redirect:/admin/tobal";
    }
	@RequestMapping(value = "/admin/cut", method = RequestMethod.GET)
	public String cut(Model model, com.bbs.domain.User user) {
		user.setMemberCount(service.memberCount());
		
		model.addAttribute("count", user.getMemberCount());
		model.addAttribute("memberList", service.cut());
		return "/admin/cut";
	}
	
	@RequestMapping(value = "/admin/update", method = RequestMethod.GET)
	public void update(@RequestParam("n") String id,Model model, com.bbs.domain.User user) {
		user.setId(id);
		service.updateuser(id);
		model.addAttribute("memberList",service.updateuser(id));
	
	}

	@RequestMapping(value = "/admin/update", method = RequestMethod.POST)
	public String updatep(com.bbs.domain.User user) {
		service.userupdate(user);
		return "redirect:/admin/userlist";
	}
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(ModelAndView mv, HttpServletRequest request) {

	
		return "about";
	}
	@RequestMapping(value = "/baby", method = RequestMethod.GET)
	public String baby(ModelAndView mv, HttpServletRequest request) {

	
		return "baby";
	}
	@RequestMapping(value = "/deljoin", method = RequestMethod.GET)
	public String deljoin(@RequestParam("n") String id,Rade rade, HttpServletRequest request,@RequestParam("s") String calid) throws Exception {
		service.deljoin(id);
		service.min(calid);
		
		
		
		return "redirect:/calview?n="+calid;

	}
	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String loginadmin() {

		return "/admin/login";


    }
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public String postlogin(HttpSession session, admin user, Model model) {
		if(session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		admin loginuser = service.loginCheck(user);
		
		if(loginuser!=null) {				//	성공
			session.setAttribute("login",loginuser);
			logger.info("success login");
			return "redirect:/admin/tobal";
		}						//	실패
		logger.info("fail login");
		return "redirect:/";	
	}
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public String adminlogout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/admin/login";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String ladmin() {

		return "/admin/login";


    }
	//참가자호출
	@RequestMapping(value = "/gorade", method = RequestMethod.GET)
	public String radego(@RequestParam("n") String id,Rade rade, HttpServletRequest request)throws Exception {

		List<Calendar> dis = service.dis(id);


	    JSONObject jsonob = new JSONObject();
	    List<String> list = new ArrayList<String>();

	    list.add(dis.get(0).getUserid());

	
	 
	    	jsonob.put("leader",dis.get(0).getUserid());
	        jsonob.put("content",dis.get(0).getTitle());
	        jsonob.put("event", dis.get(0).getCateName());
	        jsonob.put("date", dis.get(0).getStart1());
	
		    List<Calendar> dsm = service.dsm(dis.get(0).getId());
		
		    for(int j = 0 ; j < dsm.size() ; j ++) {
		    	list.add(dsm.get(j).getUserid());
		    	
		    	jsonob.put("members", list);
		    	logger.debug("sysout"+list);
		
		    }
	    
		  //  System.out.println(i+"번쨰반복"+jsonob);
		
	    
	    
	    
	    
	    
	    	System.out.println(jsonob);
	        String host_url = "http://api.nabring.kr:8080/tag";
	        HttpURLConnection conn = null;

	        URL url = new URL(host_url);
	        conn = (HttpURLConnection)url.openConnection();

	        conn.setRequestMethod("POST");//POST GET
	        conn.setRequestProperty("Content-Type", "application/json");

	        //POST방식으로 스트링을 통한 JSON 전송
	        conn.setDoOutput(true);
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

	        bw.write(jsonob.toString());
	        bw.flush();
	        bw.close();

	        //서버에서 보낸 응답 데이터 수신 받기
	        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String returnMsg = in.readLine();
	        logger.info("응답메시지 : " + returnMsg );

	        //HTTP 응답 코드 수신 
	        int responseCode = conn.getResponseCode();
	       if(responseCode == 400) {
	           logger.info("400 : 명령을 실행 오류");
	       } else if (responseCode == 500) {
	    	   logger.info("500 : 서버 에러.");
	        } else { //정상 . 200 응답코드 . 기타 응답코드 
	        	 logger.info(responseCode + " : 응답코드임");
	        }

	    



		
		
		return "/cal";


    }
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(ModelAndView mv, HttpServletRequest request) {

	
		return "/error";
	}
	@RequestMapping(value = "/error-404", method = RequestMethod.GET)
	public String error404(ModelAndView mv, HttpServletRequest request) {

	
		return "/error-404";
	}
	@RequestMapping(value = "/error-500", method = RequestMethod.GET)
	public String error500(ModelAndView mv, HttpServletRequest request) {

	
		return "/error-500";
	}

	@RequestMapping(value = "/blogin", method = RequestMethod.POST)
	public String bpostlogin(HttpSession session, com.bbs.domain.User user, Model model) {
		if(session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		com.bbs.domain.User loginuser = service.boginCheck(user);
		
		if(loginuser!=null) {				//	성공
			session.setAttribute("user",loginuser);
			logger.info("success login");
			return "redirect:/cal";
		}						//	실패
		logger.info("fail login");
		return "redirect:/";	
	}
	@RequestMapping(value = "/blogin", method = RequestMethod.GET)
	public String blogin() {

		return "/blogin";


    }
	    
}