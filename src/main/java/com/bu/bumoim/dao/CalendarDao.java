package com.bu.bumoim.dao;

import java.util.List;
import java.util.Map;

import com.bu.bumoim.domain.Calendar;

public interface CalendarDao {

	public void insertCalendar(Calendar calendar);
	
	public List<Map<String, Object>> getCalendar(String member_id);
}
