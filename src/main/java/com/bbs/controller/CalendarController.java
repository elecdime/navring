package com.bbs.controller;

import java.io.IOException;
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
	 @RequestMapping(value="calview", method=RequestMethod.GET)
	    public String boardview(@RequestParam("n") int id, Model model,Calendar cal) throws Exception {
	       	 cal = service.calView(id);
	       	
	       	System.out.println(cal);
	       	model.addAttribute("cal", cal);
	       	
	    	return "calview";
	    }

}