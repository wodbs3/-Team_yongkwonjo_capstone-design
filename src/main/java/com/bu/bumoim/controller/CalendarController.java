package com.bu.bumoim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.service.CalendarService;
import com.bu.bumoim.domain.Calendar;

@Controller
public class CalendarController {
	

	@Autowired
	CalendarService service;
	
	
	@RequestMapping(value="/calendarPage.do", method = RequestMethod.GET) 
	public String calendar() {
		return "calendar/caltest";
	}
	
	@RequestMapping(value="/calendar.do",method = RequestMethod.POST)
	public String schedule(@RequestBody Map<String, Object> params,Calendar calendar, HttpServletRequest request) { 
	
		 calendar.setMember_id((String) params.get("member_id"));
		 calendar.setCalendar_title((String) params.get("calendar_title"));
		 calendar.setCalendar_rDate((String) params.get("calendar_rdate"));
		 calendar.setCalendar_wDate((String) params.get("calendar_wdate"));
		 calendar.setCalendar_content((String) params.get("calendar_content"));
		 calendar.setCalendar_color((String) params.get("calendar_color"));
		
		 System.out.println(">>>>>>>>>>>>>>>>>>" + request.getParameter("calendar_title"));
		 System.out.println(params.get("member_id"));
		 System.out.println(params.get("calendar_title"));
		 System.out.println(calendar.getCalendar_wDate());
		 
		 service.insertCalendar(calendar);
		 
		 return "calendar";
		}
	
	
	
	@RequestMapping(value="/calTest.do")
	@ResponseBody
	public Map<String, Object> test(String member_id) {
		
//		List<Calendar> calendar = service.getCalendar(member_id);
//		map.put("member_id",calendar.get(member_id));
//		map.put("calendar_title",calendar.get("calendar_title"));
//		map.put("calendar_rdate",calendar.get("calendar_rdate"));
//		map.put("calendar_wdate",calendar.get("calendar_wdate"));
//		map.put("calendar_content",calendar.get("calendar_content"));
//		map.put("calendar_color",calendar.get("calendar_color"));
//		
		ModelAndView mav = new ModelAndView();
		
		
		List<Map<String, Object>> list; 
		int index=0;
		list = service.getCalendar(member_id);
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		for (Map<String, Object>map1:list) {
		          System.out.println("index >> " + index);
		          for (Map.Entry<String, Object> entry : map1.entrySet()) {
		 	        String key = entry.getKey();
		 	        Object value = entry.getValue();
		 	        map.put(key,value);
		 	    }

		       index++;

		  }
		mav.addObject(map);


		
		return map;
	}

}
