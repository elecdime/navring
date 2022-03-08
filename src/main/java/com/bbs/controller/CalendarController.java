package com.bbs.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.bbs.domain.Calendar;
import com.bbs.domain.SearchCriteria;
import com.bbs.domain.bbsDTO;
import com.bbs.service.CalenService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import dev.coly.discordoauth2.DiscordOAuth2;
import io.mokulu.discord.oauth.DiscordAPI;
import io.mokulu.discord.oauth.DiscordOAuth;
import io.mokulu.discord.oauth.model.Connection;
import io.mokulu.discord.oauth.model.Guild;
import io.mokulu.discord.oauth.model.TokensResponse;
import io.mokulu.discord.oauth.model.User;



@Controller
public class CalendarController {
	@Inject
	private CalenService service;
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
	public String boardview(@RequestParam("n") int id, Model model, Calendar cal) throws Exception {
		cal = service.calView(id);

		System.out.println(cal);
		model.addAttribute("cal", cal);

		return "calview";
	}

@RequestMapping(value = "/login")
	public @ResponseBody String getDiscord(
			HttpServletRequest request) throws Exception {
		
		String reqUrl ="https://discord.com/api/oauth2/authorize?client_id=894943429283446814&redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&response_type=code&scope=identify%20email";
		
		return reqUrl;
	}

	/*
	 https://discord.com/api/oauth2/authorize?client_id=894943429283446814&
	 redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&
	 response_type=code&scope=identify%20email
	 */
	@RequestMapping(value = "/users/login/redirect", method = RequestMethod.GET)
	public String redirct(@RequestParam("code") String code,Model model) throws Exception {
		System.out.println(code);
		 String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://discord.com/api/oauth2/token";
	        String client_id = "894943429283446814";
	        String client_secret = "M0jsQBmIRNAzMemKH63rQz8h1qqHQdMf";
	        String grant_type = "authorization_code";
	      
	        String redirect_uri ="http://127.0.0.1:8000/users/login/redirect";
	        String[] scope = {"identify", "email" ,"connections","guilds.members.read","guilds"};
	        DiscordOAuth discordOAuth2 = new DiscordOAuth(client_id, client_secret, "http://127.0.0.1:8000/users/login/redirect", scope);
	        System.out.println(discordOAuth2);
	        String url = discordOAuth2.getAuthorizationURL("");
	        System.out.println(url);
	        TokensResponse tokens = discordOAuth2.getTokens(code);
	        System.out.println(tokens);
	        String accessToken = tokens.getAccessToken();
	        String refreshToken = tokens.getRefreshToken();
	        System.out.println("acc:"+accessToken);
	        System.out.println("ref :"+refreshToken);
	        DiscordAPI api = new DiscordAPI(accessToken);
	       User user = api.fetchUser();
	 //       List<Connection> connections = api.fetchConnections();
	     //   List<Guild> guilds = api.fetchGuilds();
	       System.out.println(user);

		return "/login";
	}
	public String getAccessToken (String authorize_code) {
		
	       
          
        return "a";
}
}