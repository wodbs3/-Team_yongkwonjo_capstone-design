package com.bu.bumoim.service.logic;

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
	public boolean calWrite(Calendar dto) {
		return dao.calWrite(dto);
	}

}
