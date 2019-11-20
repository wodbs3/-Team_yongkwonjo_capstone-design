package com.bu.bumoim.dao.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.CalendarDao;
import com.bu.bumoim.domain.Calendar;


@Repository
public class CalendarDaoLogic implements CalendarDao{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	
	@Override
	public boolean calWrite(Calendar dto) {
		SqlSession session = sqlSessionFactory.openSession();
		int n = session.insert("Calendar.calWriteInsert", dto);
		return n>0?true:false;
	}

}
