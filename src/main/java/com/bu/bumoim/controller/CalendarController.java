package com.bu.bumoim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bu.bumoim.service.CalendarService;
import com.bu.bumoim.domain.Calendar;

@Controller
public class CalendarController {
	
	@RequestMapping(value="calendar.do",  method=RequestMethod.GET)
	public String calendar() {
		//
		return "calendar/calendar";
	}

	
}
