package com.bu.bumoim.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bu.bumoim.service.CalendarService;
import com.bu.bumoim.domain.Calendar;

@Controller
public class CalendarController {

	
	@Autowired
	CalendarService service;
	
	
	@RequestMapping(value="/calendar.do")
	public String calendar(Model model, String year, String month) { 
		java.util.Calendar cal = java.util.Calendar.getInstance();
		
		if((year == null || year.equals("") && month == null || month.equals(""))) {
			year = String.valueOf(cal.get(java.util.Calendar.YEAR));
			month = String.valueOf(cal.get(java.util.Calendar.MONTH));
		}
	
	System.out.println("year:" + year + ", month:" + month);
	
	if(month.length()<2) {
		month="0"+month;
	}
	
	model.addAttribute("year",year);
	model.addAttribute("month",month);
	
	return "calendar/calendar";
  }
	
	@RequestMapping(value="/calwrite.do")
	public String calwrite(Model model, String year, String month, String day) throws Exception{
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",day);
		
		return "calendar/calwrite";
	}
	
	
	@RequestMapping(value="/calWriteInsert.do")
	public String calwriteAf(Model model,Calendar dto,String year, 
			String month, String day,String hour,String min) throws Exception{
		
			
		if(month.length()<2) {
			month ="0"+month;
		}
		if(hour.length()<2) {
			hour ="0"+hour;
		}
		if(min.length()<2) {
			min ="0"+min;
		}
		String date = year+month+hour+min;
		dto.setCalendar_rDate(date);
			
		boolean isS =service.calWrite(dto);
				
		return "redirect:/calendar.do";
	}
}
