package com.bu.bumoim.service.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.CalendarDao;
import com.bu.bumoim.domain.Calendar;
import com.bu.bumoim.service.CalendarService;

@Service
public class CalendarServiceLogic implements CalendarService{


	@Autowired
	CalendarDao dao;

	@Override
	public void insertCalendar(Calendar calendar) {
		dao.insertCalendar(calendar);
	}

	@Override
	public List<Map<String, Object>> getCalendar(String member_id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> calendar = dao.getCalendar(member_id);
		return calendar;
	} 
	
}
