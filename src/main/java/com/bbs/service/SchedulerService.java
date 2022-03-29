package com.bbs.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bbs.controller.CalendarController;
import com.bbs.dao.CalenDao;
import com.bbs.domain.Calendar;
import com.bbs.service.CalenService;

public class SchedulerService {
	@Autowired
	private CalenService service;

	private static final Logger logger = LoggerFactory.getLogger(SchedulerService.class);

	@Scheduled(cron = "0 0/30 * * * ?")
	public void scheduleRun() throws Exception {
		// TODO Auto-generated method stub
		
			 	
		logger.debug("스케줄러실행");
		
		List<Calendar> ds = service.discord();


	    JSONObject jsonob = new JSONObject();


	    for(int i = 0 ; i < ds.size(); i++) {
	    	jsonob.put("leader",ds.get(i).getUserid());
	        jsonob.put("content",ds.get(i).getTitle());
	        jsonob.put("event", ds.get(i).getCateName());
	        jsonob.put("date", ds.get(i).getStart1());
	
		    List<Calendar> dsm = service.dsm(ds.get(i).getId());
		    List<String> list = new ArrayList<String>();
		    for(int j = 0 ; j < dsm.size() ; j ++) {
		    	list.add(dsm.get(j).getUserid());
		    	list.add(ds.get(i).getUserid()); //오류나면 여기임
		    	jsonob.put("members", list);
		    	logger.debug("스케줄러리스트"+list);
		    }
		    
		  //  System.out.println(i+"번쨰반복"+jsonob);
		 
		    }
	    
	    
	    
	    
	    
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
	        logger.debug("응답메시지 : " + returnMsg );

	        //HTTP 응답 코드 수신 
	        int responseCode = conn.getResponseCode();
	       if(responseCode == 400) {
	           logger.debug("400 : 명령을 실행 오류");
	       } else if (responseCode == 500) {
	    	   logger.debug("500 : 서버 에러.");
	        } else { //정상 . 200 응답코드 . 기타 응답코드 
	        	 logger.debug(responseCode + " : 응답코드임");
	        }

	    }
	
	    
	 
	
		
	

}


